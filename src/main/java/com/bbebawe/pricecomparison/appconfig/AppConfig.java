package com.bbebawe.pricecomparison.appconfig;

import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.scrapers.AmazonScraper;
import com.bbebawe.pricecomparison.scrapers.SainsburyScraper;
import com.bbebawe.pricecomparison.scrapers.ScraperManager;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// annotate the file to be used as configuration file for the beans
@Configuration
public class AppConfig {
    private SessionFactory sessionFactory;

    // ScraperManager Bean
    @Bean(name = "scraperManager")
    public ScraperManager getScraperManager() {
        ScraperManager scraperManager = new ScraperManager();
        scraperManager.getScraperList().add(getSainsburyScraper());
        return scraperManager;
    }

    // HibernateUtil Bean
    @Bean(name = "hibernateUtil")
    public HibernateUtil getHibernateUtil() {
        HibernateUtil hibernateUtil = new HibernateUtil();
        hibernateUtil.setSessionFactory(getSessionFactory());
        return hibernateUtil;
    }

    @Bean(name = "sessionFactory")
    SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                //Create a builder for the standard service registry
                StandardServiceRegistryBuilder standardServiceRegistryBuilder = new StandardServiceRegistryBuilder();

                //Load configuration from hibernate configuration file
                standardServiceRegistryBuilder.configure("resources/hibernate.cfg.xml");

                //Create the registry that will be used to build the session factory
                StandardServiceRegistry registry = standardServiceRegistryBuilder.build();

                try {
                    //Create the session factory - this is the goal of the init method.
                    sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
                } catch (Exception e) {
                /* The registry would be destroyed by the SessionFactory,
                        but we had trouble building the SessionFactory, so destroy it manually */
                    System.err.println("Session Factory build failed.");
                    e.printStackTrace();
                    StandardServiceRegistryBuilder.destroy(registry);
                }

                //output result
                System.out.println("Session factory built.");

            } catch (Throwable ex) {
                // Make sure you log the exception, as it might be swallowed
                System.err.println("SessionFactory creation failed." + ex);
            }
        }
        return sessionFactory;
    }



    // Sainsbury supermarket Bean
    @Bean(name = "sainsbuysSupermarket")
    public Supermarket getSainsbury() {
        Supermarket sainsbury = new Supermarket();
        sainsbury.setSupermarketId(1);
        sainsbury.setSupermarketName("Sainsbury's");
        sainsbury.setSupermarketURL("https://www.sainsburys.co.uk/");
        sainsbury.setSupermarketImage("https://www.sainsburys.co.uk/assets/images/logos_logoImage_sainsburys-logo.svg");
        return sainsbury;
    }

    // Aldi supermarket Bean
    @Bean(name = "aldiSupermarket")
    public Supermarket getAldi() {
        Supermarket aldi = new Supermarket();
        aldi.setSupermarketId(2);
        aldi.setSupermarketName("ALdi");
        aldi.setSupermarketURL("https://www.aldi.co.uk/");
        aldi.setSupermarketImage("https://cdn.aldi-digital.co.uk/32FDVWu4Lhbxgj9Z3v03ji0pGJIp?&w=70&h=84");
        return aldi;
    }

    // Cooperative supermarket Bean
    @Bean(name = "cooperativeSupermarket")
    public Supermarket getCooperative() {
        Supermarket cooperative = new Supermarket();
        cooperative.setSupermarketId(3);
        cooperative.setSupermarketName("Co-operative");
        cooperative.setSupermarketURL("https://www.coop.co.uk/products/");
        cooperative.setSupermarketImage("https://www.coop.co.uk/products");
        return cooperative;
    }

    // AmazonFresh supermarket Bean
    @Bean(name = "amazonFreshSupermarket")
    public Supermarket getAmazonPantry() {
        Supermarket amazonFresh = new Supermarket();
        amazonFresh.setSupermarketId(4);
        amazonFresh.setSupermarketName("Amazon Pantry");
        amazonFresh.setSupermarketURL("https://www.amazon.co.uk/Amazon-Pantry/b?ie=UTF8&node=5782660031");
        amazonFresh.setSupermarketImage("https://images-eu.ssl-images-amazon.com/images/G/02/pantry/pantry-shelf-logo._CB519689796_.png");
        return amazonFresh;
    }

    /* ======================================================================== */

    // scrapper beans
//    @Bean
//    public AldiScraper aldiScraper() {
//        AldiScraper aldiScraper = new AldiScraper();
//        aldiScraper.setThreadName("Aldi Thread");
//        aldiScraper.setScraperName("Aldi Scraper");
//        aldiScraper.setCrawlDelay(5000);
//        aldiScraper.setCrawlURL("https://www.aldi.co.uk/search?text=");
//        aldiScraper.setCrawlQuery("milk");
//        aldiScraper.setQuerySelector(".category-item__title");
//        aldiScraper.setSupermarket(getAldi());
//        return aldiScraper;
//    }
//
    @Bean(name = "sainsburyScraper")
    public SainsburyScraper getSainsburyScraper() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        sainsburyScraper.setThreadName("Sainsbury's Thread");
        sainsburyScraper.setScraperName("Sainsbury's Scraper");
        sainsburyScraper.setCrawlDelay(3000);
        sainsburyScraper.setCrawlURL("https://www.sainsburys.co.uk/webapp/wcs/stores/servlet/SearchDisplayView?catalogId=10241&storeId=10151&langId=44&langId=44&storeId=10151&catalogId=10241&categoryId=&parent_category_rn=&top_category=&pageSize=60&orderBy=RELEVANCE&searchTerm=");
        sainsburyScraper.setCrawlQuery("milk");
        sainsburyScraper.setQuerySelector(".category-item__title");
        sainsburyScraper.setSupermarket(getSainsbury());
        sainsburyScraper.setHibernateUtil(getHibernateUtil());
        sainsburyScraper.getHibernateUtil();
        return sainsburyScraper;
    }

    @Bean
    public AmazonScraper amazonScraper() {
        AmazonScraper amazonScraper = new AmazonScraper();
        amazonScraper.setThreadName("Amazon Thread");
        amazonScraper.setScraperName("Amazon Scraper");
        amazonScraper.setCrawlDelay(5000);
        amazonScraper.setCrawlURL("https://www.aldi.co.uk/search?text=");
        amazonScraper.setCrawlQuery("milk");
        amazonScraper.setQuerySelector(".category-item__title");
        amazonScraper.setSupermarket(getAmazonPantry());
        amazonScraper.setHibernateUtil(getHibernateUtil());
        amazonScraper.getHibernateUtil().setSessionFactory(getSessionFactory());
        return amazonScraper;
    }

//    @Bean
//    public CoopScraper coopScraper() {
//        CoopScraper coopScraper = new CoopScraper();
//        coopScraper.setThreadName("Aldi Thread");
//        coopScraper.setScraperName("Aldi Scraper");
//        coopScraper.setCrawlDelay(5000);
//        coopScraper.setCrawlURL("https://www.aldi.co.uk/search?text=");
//        coopScraper.setCrawlQuery("milk");
//        coopScraper.setQuerySelector(".category-item__title");
//        coopScraper.setSupermarket(getCooperative());
//        return coopScraper;
//    }
//
//    // HibernateUtil bean  (SessionFactory)
//    @Bean
//    public HibernateUtil hibernateUtil() {
//        HibernateUtil hibernateUtil = new HibernateUtil();
//        return hibernateUtil;
//    }

}
