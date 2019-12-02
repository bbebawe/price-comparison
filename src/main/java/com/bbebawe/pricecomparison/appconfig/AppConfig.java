package com.bbebawe.pricecomparison.appconfig;

import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.scrapers.*;
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
        scraperManager.getScraperList().add((getTescoScraper()));
        scraperManager.getScraperList().add(getAsdaScraper());
        scraperManager.getScraperList().add(getAmazonFreshScraper());
        scraperManager.getScraperList().add(getMorrisonsScraper());
        return scraperManager;
    }

    // HibernateUtil Bean
    @Bean(name = "hibernateUtil")
    public HibernateUtil getHibernateUtil() {
        HibernateUtil hibernateUtil = new HibernateUtil();
        hibernateUtil.setSessionFactory(getSessionFactory());
        return hibernateUtil;
    }

    // Session Factory Bean
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

    // Sainsbury Supermarket Bean
    @Bean(name = "sainsbuysSupermarket")
    public Supermarket getSainsbury() {
        Supermarket sainsbury = new Supermarket();
        sainsbury.setSupermarketId(1);
        sainsbury.setSupermarketName("Sainsbury's");
        sainsbury.setSupermarketURL("https://www.sainsburys.co.uk/shop/gb/groceries/");
        sainsbury.setSupermarketImage("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Sainsbury%27s_Logo.svg/1280px-Sainsbury%27s_Logo.svg.png");
        return sainsbury;
    }

    // Morrisons Supermarket Bean
    @Bean(name = "morrisonsSupermarket")
    public Supermarket getMorrisons() {
        Supermarket morrisons = new Supermarket();
        morrisons.setSupermarketId(5);
        morrisons.setSupermarketName("Morrisons");
        morrisons.setSupermarketURL("https://groceries.morrisons.com");
        morrisons.setSupermarketImage("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Wm_Morrison_Supermarkets_logo.svg/1280px-Wm_Morrison_Supermarkets_logo.svg.png");
        return morrisons;
    }

    // AmazonFresh Supermarket Bean
    @Bean(name = "amazonFreshSupermarket")
    public Supermarket getAmazonFresh() {
        Supermarket amazonFresh = new Supermarket();
        amazonFresh.setSupermarketId(2);
        amazonFresh.setSupermarketName("Amazon Fresh");
        amazonFresh.setSupermarketURL("https://www.amazon.co.uk/Amazon-Fresh-UK-Grocery-Shopping/b?ie=UTF8&node=6723205031");
        amazonFresh.setSupermarketImage("https://images-eu.ssl-images-amazon.com/images/G/02/pantry/pantry-shelf-logo._CB519689796_.png");
        return amazonFresh;
    }

    // Asda Supermarket Bean
    @Bean(name = "asdaSupermarket")
    public Supermarket getAsda() {
        Supermarket asda = new Supermarket();
        asda.setSupermarketId(3);
        asda.setSupermarketName("Asda");
        asda.setSupermarketURL("https://groceries.asda.com");
        asda.setSupermarketImage("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/ASDALogo-2017.svg/1280px-ASDALogo-2017.svg.png");
        return asda;
    }

    // Tesco Supermarket Bean
    @Bean(name = "tescoSupermarket")
    public Supermarket getTesco() {
        Supermarket tesco = new Supermarket();
        tesco.setSupermarketId(4);
        tesco.setSupermarketName("Tesco");
        tesco.setSupermarketURL("https://www.tesco.com");
        tesco.setSupermarketImage("https://upload.wikimedia.org/wikipedia/commons/4/4d/Tescologo.svg");
        return tesco;
    }

    // Sainsbury Scrapper Bean
    @Bean(name = "sainsburyScraper")
    public SainsburyScraper getSainsburyScraper() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        sainsburyScraper.setThreadName("Sainsbury's Thread");
        sainsburyScraper.setScraperName("Sainsbury's Scraper");
        sainsburyScraper.setCrawlDelay(3000);
        sainsburyScraper.setCrawlURL("https://www.sainsburys.co.uk/webapp/wcs/stores/servlet/SearchDisplayView?catalogId=10241&storeId=10151&langId=44&langId=44&storeId=10151&catalogId=10241&categoryId=&parent_category_rn=&top_category=&pageSize=60&orderBy=RELEVANCE&searchTerm=");
        sainsburyScraper.setCrawlQuery("");
        sainsburyScraper.setQuerySelector("");
        sainsburyScraper.setSupermarket(getSainsbury());
        sainsburyScraper.setHibernateUtil(getHibernateUtil());
        return sainsburyScraper;
    }

    // Morrisons Scrapper Bean
    @Bean(name = "morrisonsScraper")
    public MorrisonsScraper getMorrisonsScraper() {
        MorrisonsScraper morrisonsScraper = new MorrisonsScraper();
        morrisonsScraper.setThreadName("Morrisons Thread");
        morrisonsScraper.setScraperName("Morrisons craper");
        morrisonsScraper.setCrawlDelay(3000);
        morrisonsScraper.setCrawlURL("https://groceries.morrisons.com/search?entry=");
        morrisonsScraper.setCrawlQuery("");
        morrisonsScraper.setQuerySelector("");
        morrisonsScraper.setSupermarket(getMorrisons());
        morrisonsScraper.setHibernateUtil(getHibernateUtil());
        return morrisonsScraper;
    }

    // AmazonFresh Scrapper Bean
    @Bean(name = "amazonFreshScraper")
    public AmazonScraper getAmazonFreshScraper() {
        AmazonScraper amazonScraper = new AmazonScraper();
        amazonScraper.setThreadName("Amazon Thread");
        amazonScraper.setScraperName("Amazon Scraper");
        amazonScraper.setCrawlDelay(5000);
        amazonScraper.setCrawlURL("https://www.amazon.co.uk/s?k=");
        amazonScraper.setCrawlQuery("");
        amazonScraper.setQuerySelector(".s-search-results");
        amazonScraper.setSupermarket(getAmazonFresh());
        amazonScraper.setHibernateUtil(getHibernateUtil());
        return amazonScraper;
    }

    // Asda Scrapper Bean
    @Bean(name = "asdaScraper")
    public AsdaScraper getAsdaScraper() {
        AsdaScraper asdaScraper = new AsdaScraper();
        asdaScraper.setThreadName("Asda Thread");
        asdaScraper.setScraperName("Asda Scraper");
        asdaScraper.setCrawlDelay(3000);
        asdaScraper.setCrawlURL("https://groceries.asda.com/search/");
        asdaScraper.setCrawlQuery("");
        asdaScraper.setQuerySelector("");
        asdaScraper.setSupermarket(getAsda());
        asdaScraper.setHibernateUtil(getHibernateUtil());
        return asdaScraper;
    }

    // Tesco Scrapper Bean
    @Bean(name = "tescoScraper")
    public TescoScraper getTescoScraper() {
        TescoScraper tescoScraper = new TescoScraper();
        tescoScraper.setThreadName("Tesco Thread");
        tescoScraper.setScraperName("Tesco Scraper");
        tescoScraper.setCrawlDelay(3000);
        tescoScraper.setCrawlURL("https://www.tesco.com/groceries/en-GB/search?query=");
        tescoScraper.setCrawlQuery("");
        tescoScraper.setQuerySelector("");
        tescoScraper.setSupermarket(getTesco());
        tescoScraper.setHibernateUtil(getHibernateUtil());
        return tescoScraper;
    }
}
