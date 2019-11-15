/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bbebawe.pricecomparison.scrapers;


import java.io.IOException;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;

import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

/**
 * @author beshoy
 */
public class SainsburyScraper extends Scraper {
    private String querySelector;

    public SainsburyScraper() {
    }


    public String getQuerySelector() {
        return querySelector;
    }

    public void setQuerySelector(String querySelector) {
        this.querySelector = querySelector;
    }


    public void run() {

        try {
            this.scrape();
            sleep(this.getCrawlDelay());
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void scrape() throws IOException {
        System.out.println(" =========== Salisbury's Scrapper Started ===========");
//        startScraping();

    }

    // deprecated method, to be removed
    public void updateScrapped() throws IOException {
        List<Category> categoryList = hibernateUtil.getCategoryList();

        for (Category category : categoryList) {
            this.setCrawlQuery(category.getCategoryName());
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements products = doc.select("#productLister .productNameAndPromotions");
            Elements prices = doc.select("#productLister .pricing .pricePerUnit");
            Elements images = doc.select("#productLister .productNameAndPromotions img");

            int indexOfDash = category.getCategoryName().indexOf("-");
            String keyword1 = category.getCategoryName().substring(0, (indexOfDash - 1));
            String keyword2 = category.getCategoryName().substring((indexOfDash + 2), category.getCategoryName().length());
            for (int i = 0; i < products.size(); i++) {
                Product productObj = new Product();
                ProductPrice productPrice = new ProductPrice();
                if (products.get(i).text().toLowerCase().contains(keyword1) && products.get(i).text().toLowerCase().contains(keyword2)) {
                    String description = products.get(i).text();
                    Product product = hibernateUtil.getProductByDescription(description);
                    ProductPrice currentProductPrice = hibernateUtil.getProductPriceById(product.getProductId());
                    String priceString = prices.get(i).text().replaceAll("[£|p|/unit|']", "");
                    double price = Double.parseDouble(priceString);
                    if (currentProductPrice.getProductPrice() != price) {
                        System.out.println("They are not equal");
                        hibernateUtil.updateProductPrice(price, product.getProductId());
                    }
                } else {
                    System.out.println("No");
                }
            }
        }
    }

    public void startScraping() throws IOException {
        List<Product> productList = hibernateUtil.getProductList();
        List<ProductPrice> storedProducts = hibernateUtil.getProductPriceList();


        for (Product product : productList) {
            // set crawl query
            this.setCrawlQuery(product.getProductName());
            // jsoup scrapping
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements scrapedProducts = doc.select("#productLister .productNameAndPromotions");
            Elements scrapedPrices = doc.select("#productLister .pricing .pricePerUnit");
            Elements scrapedImages = doc.select("#productLister .productNameAndPromotions img");

            // create list product keywords
            String productKeyWordsString = product.getProductKeywords();
            List<String> productKeywords = getListOfKeywords(productKeyWordsString);


            for (int i = 0; i < scrapedProducts.size(); i++) {
                boolean productScrappedBefore = true;
                boolean productMatch = true;
                String priceString = scrapedPrices.get(i).text().replaceAll("[£|p|/unit|']", "");
                double price = Double.parseDouble(priceString);
                String scrapedProductDescription = scrapedProducts.get(i).text();
                System.out.println(scrapedProductDescription);

                // check if scrapped description match product keywords
                for(String key : productKeywords) {
                    if(!scrapedProductDescription.toLowerCase().contains(key)) {
                        productMatch = false;
                    }
                }
                if (productMatch) {
                    System.out.println("product match");
                    // get current products from db with same description, return empty list if nothing found
                    List<ProductPrice> productPriceResults = hibernateUtil.getProductPriceByDescription(scrapedProductDescription);
                    System.out.println(productPriceResults.size());
                    // if product not found store it
                    if (productPriceResults.size() == 0) {
                        ProductPrice productPrice = new ProductPrice();
                        productPrice.setProduct(product);
                        productPrice.setProductPrice(price);
                        productPrice.setProductDescription(scrapedProducts.get(i).text());
                        productPrice.setPriceSource(this.getCrawlURL() + this.getCrawlQuery());
                        Supermarket supermarket = this.getSupermarket();
                        productPrice.setSupermarket(supermarket);
                        hibernateUtil.saveProductPrice(productPrice);
                        System.out.println("product added to db");
                    } else if (productPriceResults.size() > 0) {
                        // if price changes then update the product
                        if (productPriceResults.get(0).getProductPrice() != price) {
                            hibernateUtil.updateProductPrice(price, productPriceResults.get(0).getPriceId());
                            System.out.println("Product Scrapped before and price changed");
                        } else {
                            System.out.println("Product scrapped before and price has not changed since then");
                        }
                    }
                }
            }
        }
    }

    // methods takes sting and return list of keywords based on the location of ,
    public static List<String> getListOfKeywords(String keywordString) {
        // lists keywords and index of , character
        List<String> keywords = new ArrayList<String>();
        List<Integer> indexList = new ArrayList<Integer>();

        // get the indexes of , when it appears in the string
        for (int i = 0; i < keywordString.length(); i++) {
            if (keywordString.charAt(i) == ',') {
                indexList.add(i);
            }
        }
        // initial start and endsubstringg
        int startAt = 0;
        int endAt = indexList.get(0);

        for (int i = 0; i <= indexList.size(); i++) {
            if (i == indexList.size()) {
                endAt = keywordString.length();
            } else {
                endAt = indexList.get(i);
            }
            String word = keywordString.substring(startAt, endAt);
            keywords.add(word);
            startAt = endAt + 1;
        }
        return keywords;
    }
}
