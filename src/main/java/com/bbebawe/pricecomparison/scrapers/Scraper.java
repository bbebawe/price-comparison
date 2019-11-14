/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bbebawe.pricecomparison.scrapers;


import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;

import java.io.IOException;

/**
 *
 * @author beshoy
 */
public abstract class Scraper extends Thread {

    private String threadName;
    private int crawlDelay;
    private String scraperName;
    private String crawlURL;
    private String crawlQuery;
    protected Supermarket supermarket;
    protected HibernateUtil hibernateUtil;


    public Scraper() {
    }

    public Scraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String crawlQuery, Supermarket supermarket) {
        this.crawlDelay = crawlDelay;
        this.scraperName = scraperName;
        this.crawlURL = crawlURL;
        this.crawlQuery = crawlQuery;
        this.supermarket = supermarket;
        this.threadName = threadName;
    }
    public Scraper(String threadName, int crawlDelay, String scraperName, String crawlURL, Supermarket supermarket) {
        this.crawlDelay = crawlDelay;
        this.scraperName = scraperName;
        this.crawlURL = crawlURL;
        this.crawlQuery = "";
        this.supermarket = supermarket;
        this.threadName = threadName;
    }

    public HibernateUtil getHibernateUtil() {
        return hibernateUtil;
    }

    public void setHibernateUtil(HibernateUtil hibernateUtil) {
        this.hibernateUtil = hibernateUtil;
    }

    public String getThreadName() {
        return threadName;
    }

    public void setThreadName(String threadName) {
        this.threadName = threadName;
    }

    public int getCrawlDelay() {
        return crawlDelay;
    }

    public void setCrawlDelay(int crawlDelay) {
        this.crawlDelay = crawlDelay;
    }

    public String getScraperName() {
        return scraperName;
    }

    public void setScraperName(String scraperName) {
        this.scraperName = scraperName;
    }

    public String getCrawlURL() {
        return crawlURL;
    }

    public void setCrawlURL(String crawlURL) {
        this.crawlURL = crawlURL;
    }

    public String getCrawlQuery() {
        return crawlQuery;
    }

    public void setCrawlQuery(String crawlQuery) {
        this.crawlQuery = crawlQuery;
    }

    public Supermarket getSupermarket() {
        return supermarket;
    }

    public void setSupermarket(Supermarket supermarket) {
        this.supermarket = supermarket;
    }

    public abstract void scrape() throws IOException;
}
