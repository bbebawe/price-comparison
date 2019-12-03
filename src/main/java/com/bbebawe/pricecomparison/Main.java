package com.bbebawe.pricecomparison;

import com.bbebawe.pricecomparison.appconfig.AppConfig;
import com.bbebawe.pricecomparison.scrapers.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.IOException;

/**
 * Main Class Holds the main method for the application.
 * The main method executes other calls to ScraperManager and Spring Configuration
 *
 * @author Beshoy Bebawe
 */

// begin main class
public class Main {
    /**
     * Application main method, this is the entry point for the application which executes the application
     *
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws InterruptedException, IOException {

        ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
        ScraperManager scraperManager = appContext.getBean("scraperManager", ScraperManager.class);
        // call scrapper manager to starts scrapping
        scraperManager.startScraping();

    } // end main method
} // end main class
