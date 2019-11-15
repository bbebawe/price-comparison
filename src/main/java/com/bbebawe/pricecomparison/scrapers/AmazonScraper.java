/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bbebawe.pricecomparison.scrapers;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.bbebawe.pricecomparison.appconfig.AppConfig;
import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author beshoy
 */
public class AmazonScraper extends Scraper {
    private String querySelector;

    public AmazonScraper() {
    }

    public AmazonScraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String crawlQuery, Supermarket supermarket, String querySelector) {
        super(threadName, crawlDelay, scraperName, crawlURL, crawlQuery, supermarket);
        this.querySelector = querySelector;
    }

    public AmazonScraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String querySelector, Supermarket supermarket) {
        super(threadName, crawlDelay, scraperName, crawlURL, supermarket);
        this.querySelector = querySelector;
    }


    public String getQuerySelector() {
        return querySelector;
    }

    public void setQuerySelector(String querySelector) {
        this.querySelector = querySelector;
    }


    @Override
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
        startScraping();

    }



    public void startScraping() throws IOException {
        System.out.println(" =========== Amazon Scrapper Started ===========");
        List<Product> productList = hibernateUtil.getProductList();
        List<ProductPrice> storedProducts = hibernateUtil.getProductPriceList();

        for (Product product : productList) {
            System.out.println("Scaping new product" + product.getProductName());
            this.setCrawlURL("https://www.amazon.co.uk/s?k=");
            String crawlURLEnd = "&i=amazonfresh";
            // set crawl query
            this.setCrawlQuery(product.getProductName());

            // jsoup scrapping
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery() + crawlURLEnd).get();
            Elements scrapedProducts = doc.select(".s-search-results .s-result-item h2");

//            System.out.println(this.getCrawlURL()+this.getCrawlQuery()+crawlURLEnd);
            for(int i = 0; i < scrapedProducts.size(); i++) {
                System.out.println(scrapedProducts.get(i).text());
            }
//            Elements scrapedPrices = doc.select("#productLister .pricing .pricePerUnit");
//            Elements scrapedImages = doc.select("#productLister .productNameAndPromotions img");

            // create list product keywords
//            String productKeyWordsString = product.getProductKeywords();
//            List<String> productKeywords = getListOfKeywords(productKeyWordsString);


//            for (int i = 0; i < scrapedProducts.size(); i++) {
//                boolean productScrappedBefore = true;
//                boolean productMatch = true;
//                String priceString = scrapedPrices.get(i).text().replaceAll("[£|p|/unit|']", "");
//                double price = Double.parseDouble(priceString);
//                String scrapedProductDescription = scrapedProducts.get(i).text();
//                System.out.println(scrapedProductDescription);
//
//                // check if scrapped description match product keywords
//                for(String key : productKeywords) {
//                    if(!scrapedProductDescription.toLowerCase().contains(key)) {
//                        productMatch = false;
//                    }
//                }
//                if (productMatch) {
//                    System.out.println("product match");
//                    // get current products from db with same description, return empty list if nothing found
//                    List<ProductPrice> productPriceResults = hibernateUtil.getProductPriceByDescription(scrapedProductDescription);
//                    System.out.println(productPriceResults.size());
//                    // if product not found store it
//                    if (productPriceResults.size() == 0) {
//                        ProductPrice productPrice = new ProductPrice();
//                        productPrice.setProduct(product);
//                        productPrice.setProductPrice(price);
//                        productPrice.setProductDescription(scrapedProducts.get(i).text());
//                        productPrice.setPriceSource(this.getCrawlURL() + this.getCrawlQuery());
//                        Supermarket supermarket = this.getSupermarket();
//                        productPrice.setSupermarket(supermarket);
//                        hibernateUtil.saveProductPrice(productPrice);
//                        System.out.println("product added to db");
//                    } else if (productPriceResults.size() > 0) {
//                        // if price changes then update the product
//                        if (productPriceResults.get(0).getProductPrice() != price) {
//                            hibernateUtil.updateProductPrice(price, productPriceResults.get(0).getPriceId());
//                            System.out.println("Product Scrapped before and price changed");
//                        } else {
//                            System.out.println("Product scrapped before and price has not changed since then");
//                        }
//                    }
//                }
//            }
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
