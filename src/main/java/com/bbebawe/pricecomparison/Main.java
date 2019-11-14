package com.bbebawe.pricecomparison;

import com.bbebawe.pricecomparison.appconfig.AppConfig;
import com.bbebawe.pricecomparison.scrapers.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.IOException;

public class Main {

    public static void main(String[] args) throws InterruptedException, IOException {
        ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
        ScraperManager scraperManager = appContext.getBean("scraperManager", ScraperManager.class);
        scraperManager.startScraping();
    }

}
