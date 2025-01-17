package com.bbebawe.pricecomparison.scrapers;

import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * The MorrisonsScraper class represents web scrapper to scrape Morrisons website.
 * The MorrisonsScraper extends Scraper class and implements its abstract methods.
 * The class runs in a thread execution and use JSoup to scrap Morrisons website.
 *
 * @see Scraper
 */
public class MorrisonsScraper extends Scraper {
    private String querySelector;


    /**
     * No argument Default constructor.
     */
    public MorrisonsScraper() {
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
    public void run() {
        while (true) {
            System.out.println(" =========== Morrisons Scrapper Started ===========");
            try {
                scrape();
                // put the thread to sleep.
                Thread.sleep(this.getCrawlDelay());
            } catch (IOException | InterruptedException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * The scrape method implements and overrides abstract class scrape method.
     *
     * @throws IOException {@link #scrape()}
     */
    @Override
    public void scrape() throws IOException {
        // get list of current products in db
        List<Product> productList = hibernateUtil.getProductList();

        for (Product product : productList) {
            // set crawl query
            this.setCrawlQuery(product.getProductName());

            // jsoup scrapping
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements scrapedProducts = doc.select(".fops-shelf .fops-item .fop-item .fop-content .fop-description h4");
            Elements scrapedProductsLinks = doc.select(".fops-shelf .fops-item .fop-item .fop-contentWrapper a");
            Elements scrapedPrices = doc.select(".fops-shelf .fops-item .fop-item .price-group-wrapper .fop-price");
            Elements scrapedImages = doc.select(".fops-shelf .fops-item .fop-item .fop-content .fop-img-wrapper .fop-img");

            // create list product keywords
            String productKeyWordsString = product.getProductKeywords();
            List<String> productKeywords = this.getProductKeywords(productKeyWordsString);

            for (int i = 0; i < scrapedProducts.size(); i++) {
                String scrapedProductDescription = scrapedProducts.get(i).text();
                boolean isProductMatch = productMatch(productKeywords, scrapedProductDescription);

                if (isProductMatch) {
                    System.out.println("product match");
                    String priceString = "0";
                    try {
                        priceString = scrapedPrices.get(i).text();
                    } catch (IndexOutOfBoundsException e) {
                        System.out.println("Could not get product price");
                        priceString = "0";
                    }
                    // try to convert price from penny to pound
                    double price = getProductPriceFromString(priceString);
                    // get current products from db with same description
                    List<ProductPrice> productPriceResults = hibernateUtil.getProductPriceByDescription(this.supermarket.getSupermarketId(), scrapedProductDescription);

                    // if product not found store it
                    if (productPriceResults.size() == 0) {
                        ProductPrice productPrice = new ProductPrice();
                        productPrice.setProduct(product);
                        productPrice.setProductPrice(price);
                        productPrice.setProductDescription(scrapedProductDescription);
                        productPrice.setPriceSource(this.supermarket.getSupermarketURL() + scrapedProductsLinks.get(i).attr("href"));
                        productPrice.setProductImage(this.supermarket.getSupermarketURL() + scrapedImages.get(i).attr("src"));
                        productPrice.setSupermarket(this.supermarket);
                        hibernateUtil.saveProductPrice(productPrice);
                        System.out.println("============= product added to db ==============");
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
