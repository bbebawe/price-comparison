package com.bbebawe.pricecomparison;

import com.bbebawe.pricecomparison.appconfig.AppConfig;
import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.scrapers.*;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.IOException;
import java.util.List;


/**
 * Hello world!
 */
public class Main {

    public static void main(String[] args) throws InterruptedException, IOException {
//        ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
//        HibernateUtil hibernateUtil = appContext.getBean("hibernateUtil", HibernateUtil.class);
//        hibernateUtil.init();
//        Supermarket marekt = appContext.getBean("sainsbuysSupermarket", Supermarket.class);
//        hibernateUtil.saveSupermarket(marekt);
        ScraperManager scraperManager = new ScraperManager();
        scraperManager.initialiseScraperManager();
        scraperManager.startScraping();
    }

}
