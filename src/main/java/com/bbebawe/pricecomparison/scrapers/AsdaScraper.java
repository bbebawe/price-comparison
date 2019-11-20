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

import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

/**
 * @author beshoy
 */
public class AsdaScraper extends Scraper {
    private String querySelector;
    ChromeOptions options = new ChromeOptions();

    public AsdaScraper() {
    }

    public AsdaScraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String crawlQuery, Supermarket supermarket, String querySelector) {
        super(threadName, crawlDelay, scraperName, crawlURL, crawlQuery, supermarket);
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
        System.out.println(" =========== Asda Scrapper Started ===========");
        scrape();
    }

    @Override
    public void scrape() {
        List<Product> productList = hibernateUtil.getProductList();

        // run driver headless - not needed if we want default options
        options.setHeadless(true);
        //Create instance of web driver
        WebDriver driver = new ChromeDriver(options);

        for (Product product : productList) {
            // set crawl query
            this.setCrawlQuery(product.getProductName());

            // create list product keywords
            String productKeyWordsString = product.getProductKeywords();
            List<String> productKeywords = getListOfKeywords(productKeyWordsString);

            //Navigate Chrome to page.
            driver.get(this.getCrawlURL() + this.getCrawlQuery());

            //Wait for page to load
            try {
                Thread.sleep(3000);
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            // scrap product name, price and volume
            List<WebElement> scrapedProducts = driver.findElements(By.className("co-product__anchor"));
            List<WebElement> scrapedProductsVolume = driver.findElements(By.className("co-product__volume"));
            List<WebElement> scrapedProductsPrices = driver.findElements(By.className("co-product__price"));
            List<WebElement> scrapedProductsImages = driver.findElements(By.cssSelector(".co-product__image"));

            System.out.println(product.getProductName());

            for (int i = 0; i < scrapedProducts.size(); i++) {
                boolean productMatch = true;
                String scrapedProductDescription = scrapedProducts.get(i).getText() + " " + scrapedProductsVolume.get(i).getText();
                System.out.println(scrapedProductDescription);


                //  check if scrapped description match product keywords
                for (String key : productKeywords) {
                    if (!scrapedProductDescription.toLowerCase().contains(key)) {
                        productMatch = false;
                    }
                }

                if (productMatch) {
                    System.out.println("product match");
                    String priceString = "0";
                    try {
                        priceString = scrapedProductsPrices.get(i).getText();
                    } catch (IndexOutOfBoundsException e) {
                        System.out.println("Could not get product price");
                        priceString = "0";
                    }
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
                        productPrice.setPriceSource(scrapedProducts.get(i).getAttribute("href"));
                        productPrice.setProductImage(scrapedProductsImages.get(i).getAttribute("src"));

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

        //Exit driver and close Chrome
        driver.quit();
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
        // initial start and end substringg
        int startAt = 0;
        int endAt = indexList.get(0);

        for (int i = 0; i <= indexList.size(); i++) {
            if (i == indexList.size()) {
                endAt = keywordString.length();
            } else {
                endAt = indexList.get(i);
            }
            String word = keywordString.substring(startAt, endAt);
            if (word.contains(" pint")) {
                String replacedWord = word.replaceAll(" pint", "pt");
                word = replacedWord;
            }
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
