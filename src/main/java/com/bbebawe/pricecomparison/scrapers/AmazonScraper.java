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
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void scrape() throws IOException {
        firsTimeScrap();

    }


    public void firsTimeScrap() throws IOException {
        ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
        List<Category> categoryList = this.getHibernateUtil().getCategoryList();
        int supermarketId = this.getSupermarket().getSupermarketId();
        Elements products = null;
        for (Category category : categoryList) {
            this.setCrawlQuery(category.getCategoryName());

            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            products = doc.select(".s-result-list .sg-col-inner");
        }

        for(Element elements : products) {
            System.out.println(elements.text());
        }
    }
}
