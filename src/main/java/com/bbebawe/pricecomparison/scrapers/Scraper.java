
package com.bbebawe.pricecomparison.scrapers;


import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;

import java.io.IOException;
import java.util.List;

/**
 * The Scrapper is an abstract class that represents a web scrapper that can be used to scrap data from certain website.
 * Scrapper extends Thread class to enable Scrappers to run in a multithreaded execution.
 * Scrapper has four methods that must be implemented by extending classes.
 */
public abstract class Scraper extends Thread {

    private String threadName;
    private int crawlDelay;
    private String scraperName;
    private String crawlURL;
    private String crawlQuery;
    protected Supermarket supermarket;
    protected HibernateUtil hibernateUtil;


    /**
     * No argument Default constructor.
     */
    public Scraper() {
    }

    /**
     * Scrapper second constructor, takes six parameters to create new object.
     *
     * @param threadName
     * @param crawlDelay
     * @param scraperName
     * @param crawlURL
     * @param crawlQuery
     * @param supermarket
     */
    public Scraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String crawlQuery, Supermarket supermarket) {
        this.crawlDelay = crawlDelay;
        this.scraperName = scraperName;
        this.crawlURL = crawlURL;
        this.crawlQuery = crawlQuery;
        this.supermarket = supermarket;
        this.threadName = threadName;
    }

    /**
     * Scrapper third constructor, takes five parameters to create new object.
     *
     * @param threadName
     * @param crawlDelay
     * @param scraperName
     * @param crawlURL
     * @param supermarket
     */
    public Scraper(String threadName, int crawlDelay, String scraperName, String crawlURL, Supermarket supermarket) {
        this.crawlDelay = crawlDelay;
        this.scraperName = scraperName;
        this.crawlURL = crawlURL;
        this.crawlQuery = "";
        this.supermarket = supermarket;
        this.threadName = threadName;
    }

    /**
     * Class getter to return Hibernate Utils.
     *
     * @return hibernateUtil.
     */
    public HibernateUtil getHibernateUtil() {
        return hibernateUtil;
    }

    /**
     * Class setter to set Hibernate Utils.
     *
     * @param hibernateUtil
     */
    public void setHibernateUtil(HibernateUtil hibernateUtil) {
        this.hibernateUtil = hibernateUtil;
    }

    /**
     * class getter to return Thread Name.
     *
     * @return threadName.
     */
    public String getThreadName() {
        return threadName;
    }

    /**
     * class setter to set Thread Name.
     *
     * @param threadName
     */
    public void setThreadName(String threadName) {
        this.threadName = threadName;
    }

    /**
     * class getter to get Scrapper Crawl Delay.
     *
     * @return crawlDelay.
     */
    public int getCrawlDelay() {
        return crawlDelay;
    }

    /**
     * class setter to set Scrapper Crawl Delay.
     *
     * @param crawlDelay
     */
    public void setCrawlDelay(int crawlDelay) {
        this.crawlDelay = crawlDelay;
    }

    /**
     * class getter to get Scrapper Name.
     *
     * @return scraperName.
     */
    public String getScraperName() {
        return scraperName;
    }

    /**
     * class setter to set Scraper Name.
     *
     * @param scraperName
     */
    public void setScraperName(String scraperName) {
        this.scraperName = scraperName;
    }

    /**
     * class getter to get Scarper Crawl URL.
     *
     * @return crawlURL.
     */
    public String getCrawlURL() {
        return crawlURL;
    }

    /**
     * class setter to set Scarper Crawl URL.
     *
     * @param crawlURL
     */
    public void setCrawlURL(String crawlURL) {
        this.crawlURL = crawlURL;
    }

    /**
     * class getter to get Scarper Crawl Query.
     *
     * @return crawlQuery.
     */
    public String getCrawlQuery() {
        return crawlQuery;
    }

    /**
     * class setter to set Scarper Crawl Query.
     *
     * @param crawlQuery
     */
    public void setCrawlQuery(String crawlQuery) {
        this.crawlQuery = crawlQuery;
    }

    /**
     * class getter to get Scrapper Supermarket.
     *
     * @return supermarket.
     */
    public Supermarket getSupermarket() {
        return supermarket;
    }

    /**
     * class setter to set Scrapper Supermarket.
     *
     * @param supermarket
     */
    public void setSupermarket(Supermarket supermarket) {
        this.supermarket = supermarket;
    }

    /**
     * Abstract method used to scrape supermarket website by using JSoup or Selenium.
     * The method use instance variable to set scrapping options such as crawl query, crawl delay and crawl URL.
     * The method calls other methods to retrieve product list from the database.
     * The method crawl websites inside a product loop to ensure that the website is scrapped for each single product in the database.
     * The method is responsible for calling other method to process description text and find matched products.
     * The method adds product to the database if the product has not been scrapped before.
     * The method checks for price changes if the product has been scrapped before.
     *
     * @throws IOException
     * @throws InterruptedException
     */
    public abstract void scrape() throws IOException, InterruptedException;

    /**
     * The method takes a list of product keywords and product description.
     * The method loops over the list of keywords to find all the keywords in the product description.
     *
     * @param productKeywords
     * @param scrapedProductDescription
     * @return true if product description matches product keywords and false if product description does not matches product keywords.
     */
    public abstract boolean productMatch(List<String> productKeywords, String scrapedProductDescription);

    /**
     * The method takes string of keywords with comma serrated words.
     * The method uses the location of the comma between the words to indicate the start and end of a keyword.
     * The method return a list of keywords based on the location of the comma.
     *
     * @param keywordString
     * @return list of keywords generated from product description string.
     */
    public abstract List<String> getProductKeywords(String keywordString);

    /**
     * The method takes price string and return price as double number.
     * The method extracts the price from the string which contains currency and volume characters.
     * The method converts the price to pounds if it was in penny.
     *
     * @param priceString
     * @return price in pound.
     */
    public abstract double getProductPriceFromString(String priceString);


}
