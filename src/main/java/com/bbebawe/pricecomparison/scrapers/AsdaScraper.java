
package com.bbebawe.pricecomparison.scrapers;


import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.ArrayList;
import java.util.List;

/**
 * The AsdaScraper class represents web scrapper to scrape Asda website.
 * The AsdaScraper extends Scraper class and implements its abstract methods.
 * The class runs in a thread execution and use Selenium with google chrome driver to scrap Asda website.
 *
 * @see Scraper
 */
public class AsdaScraper extends Scraper {
    private String querySelector;
    ChromeOptions options = new ChromeOptions();

    /**
     * No argument Default constructor.
     */
    public AsdaScraper() {
    }

    /**
     * Second constructor.
     *
     * @param threadName
     * @param crawlDelay
     * @param scraperName
     * @param crawlURL
     * @param crawlQuery
     * @param supermarket
     * @param querySelector
     */
    public AsdaScraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String crawlQuery, Supermarket supermarket, String querySelector) {
        super(threadName, crawlDelay, scraperName, crawlURL, crawlQuery, supermarket);
        this.querySelector = querySelector;
    }

    /**
     * get scrapper query selector.
     *
     * @return scrapper query selector.
     */
    public String getQuerySelector() {
        return querySelector;
    }

    /**
     * sets scrapper query selector.
     *
     * @param querySelector
     */
    public void setQuerySelector(String querySelector) {
        this.querySelector = querySelector;
    }

    /**
     * The run method is an implementation of Thread class method.
     * The method calls a loop which keeps scrapping the website while the application is running.
     * The method implements Thread execution and causes the Thread to sleep for certain time.
     */
    @Override
    public void run() {
        while (true) {
            System.out.println(" =========== Asda Scrapper Started ===========");
            try {
                scrape();
                // put the thread to sleep
                Thread.sleep(this.getCrawlDelay());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * The scrape method implements and overrides abstract class scrape method.
     * {@link #scrape()}
     */
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
            List<String> productKeywords = getProductKeywords(productKeyWordsString);

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
                String scrapedProductDescription = scrapedProducts.get(i).getText() + " " + scrapedProductsVolume.get(i).getText();
                System.out.println(scrapedProductDescription);
                boolean isProductMatch = productMatch(productKeywords, scrapedProductDescription);

                if (isProductMatch) {
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

    /**
     * The productMatch method implements and overrides abstract class productMatch method.
     *
     * @param productKeywords
     * @param scrapedProductDescription
     * @return true if product match and false if product not match.
     * {@link #productMatch(List, String)}
     */
    @Override
    public boolean productMatch(List<String> productKeywords, String scrapedProductDescription) {
        boolean productMatch = true;
        for (String key : productKeywords) {
            if (!scrapedProductDescription.toLowerCase().contains(key)) {
                productMatch = false;
            }
        }
        return productMatch;
    }


    /**
     * The getProductKeywords method implements and overrides abstract class getProductKeywords method.
     *
     * @param keywordString
     * @return list of product keywords.
     * {@link #getProductKeywords(String)}
     */
    @Override
    public List<String> getProductKeywords(String keywordString) {
        // lists keywords and index of , character
        List<String> keywords = new ArrayList<String>();
        List<Integer> indexList = new ArrayList<Integer>();

        // get the indexes of , when it appears in the string
        for (int i = 0; i < keywordString.length(); i++) {
            if (keywordString.charAt(i) == ',') {
                indexList.add(i);
            }
        }
        // initial start and end substring
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

    /**
     * The getProductPriceFromString method implements and overrides abstract class getProductPriceFromString method.
     *
     * @param priceString
     * @return product price
     * {@link #getProductPriceFromString(String)}
     */
    @Override
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
