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
public class TescoScraper extends Scraper {
    private String querySelector;

    public TescoScraper() {
    }


    public String getQuerySelector() {
        return querySelector;
    }

    public void setQuerySelector(String querySelector) {
        this.querySelector = querySelector;
    }


    public void run() {
        System.out.println(" =========== Tesco Scrapper Started ===========");
        try {
            scrape();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void scrape() throws IOException {
        List<Product> productList = hibernateUtil.getProductList();

        for (Product product : productList) {
            // set crawl query
            this.setCrawlQuery(product.getProductName());
            // jsoup scrapping
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements scrapedProducts = doc.select(".product-list--list-item h3 a");
            Elements scrapedPrices = doc.select(".product-list--list-item .price-per-sellable-unit .value");

            // create list product keywords
            String productKeyWordsString = product.getProductKeywords();
            List<String> productKeywords = getListOfKeywords(productKeyWordsString);


            for (int i = 0; i < scrapedProducts.size(); i++) {
                boolean productMatch = true;

                String scrapedProductDescription = scrapedProducts.get(i).text();
                System.out.println(scrapedProductDescription);

                // check if scrapped description match product keywords
                for (String key : productKeywords) {
                    if (!scrapedProductDescription.toLowerCase().contains(key)) {
                        productMatch = false;
                    }
                }

                if (productMatch) {
                    System.out.println("product match");
                    String priceString = scrapedPrices.get(i).text();

                    // try to convert price from penny to pound
                    double price = getProductPriceFromString(priceString);

                    // get current products from db with same description, return empty list if nothing found
                    List<ProductPrice> productPriceResults = hibernateUtil.getProductPriceByDescription(this.supermarket.getSupermarketId(), scrapedProductDescription);

                    // if product not found store it
                    if (productPriceResults.size() == 0) {
                        ProductPrice productPrice = new ProductPrice();
                        productPrice.setProduct(product);
                        productPrice.setProductPrice(price);
                        productPrice.setProductVolume(product.getProductVolume());
                        productPrice.setProductDescription(scrapedProductDescription);
                        productPrice.setPriceSource(this.supermarket.getSupermarketURL() + scrapedProducts.get(i).attr("href"));
                        productPrice.setSupermarket(this.supermarket);
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

    public double convertProductPriceToPound(double priceInPenny) {
        double price = 0;
        // convert price from penny to pound
        if ((priceInPenny == Math.floor(priceInPenny)) && !Double.isInfinite(priceInPenny)) {
            price = priceInPenny / 100;
        } else {
            price = priceInPenny;
        }
        return price;
    }
    public double getProductPriceFromString(String priceString) {
        double price = 0;
        String cleanedPriceString = priceString.replaceAll("[£|p|/unit|']", "");
        double tempPrice = Double.parseDouble(cleanedPriceString);
        if (cleanedPriceString.length() < 3) {
            price = tempPrice / 100;
        } else {
            price = tempPrice;
        }
        return price;
    }
}
