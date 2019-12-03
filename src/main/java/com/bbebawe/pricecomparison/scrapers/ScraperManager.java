package com.bbebawe.pricecomparison.scrapers;

import java.io.IOException;
import java.util.ArrayList;

/**
 * The ScraperManager class holds list of web scrappers which used to scrape supermarkets websites.
 * The class is responsible for managing and starting the web scrappers.
 */
public class ScraperManager {

    private ArrayList<Scraper> scraperList;

    /**
     * No argument Default constructor.
     */
    public ScraperManager() {
        this.scraperList = new ArrayList<Scraper>();
    }

    /**
     * return list of web scrappers.
     * @return list of web scrappers.
     */
    public ArrayList<Scraper> getScraperList() {
        return scraperList;
    }

    /**
     * sets list of web scrappers.
     * @param scraperList
     */
    public void setScraperList(ArrayList<Scraper> scraperList) {
        this.scraperList = scraperList;
    }

    /**
     * The startScraping calls start method for each scrapper in the scrapper list.
     * When start method is called the scrapper will start scrapping.
     * @throws IOException
     */
    public void startScraping() throws IOException {
        for (Scraper scraper : this.getScraperList()) {
            scraper.start();
        }
    }






}
