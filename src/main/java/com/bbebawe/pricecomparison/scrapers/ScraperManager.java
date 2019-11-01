package com.bbebawe.pricecomparison.scrapers;

import com.bbebawe.pricecomparison.appconfig.AppConfig;
import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class ScraperManager {
    private ArrayList<Scraper> scraperList;
    private HibernateUtil hibernateUtil;


    //
    public void initialiseScraperManager() {
        // get app context
        ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
        HibernateUtil hibernateUtil = appContext.getBean("hibernateUtil", HibernateUtil.class);
        hibernateUtil.init();
        // get scrapper list beans
//        this.scraperList.add((AldiScraper) appContext.getBean("aldiScraper"));
        this.scraperList.add((SainsburyScraper) appContext.getBean("sainsburyScraper"));
//        this.scraperList.add((AmazonScraper) appContext.getBean("amazonScraper"));
//        this.scraperList.add((CoopScraper) appContext.getBean("coopScraper"));
        // get hibernate util beans

    }

    public void startScraping() throws IOException {
        for (Scraper scraper : this.getScraperList()) {
                scraper.start();
            }
    }




    public ScraperManager() {
        this.scraperList = new ArrayList<Scraper>();
    }

    public ArrayList<Scraper> getScraperList() {
        return scraperList;
    }

    public void setScraperList(ArrayList<Scraper> scraperList) {
        this.scraperList = scraperList;
    }

}
