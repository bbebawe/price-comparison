package com.bbebawe.pricecomparison.appconfig;

import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;


import com.bbebawe.pricecomparison.scrapers.SainsburyScraper;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.hibernate.event.spi.PreDeleteEvent;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// annotate the file to be used as configuration file for the beans
@Configuration
public class AppConfig {

    // HibernateUtil Bean
    @Bean(name = "hibernateUtil")
    public HibernateUtil getHibernateUtil() {
        HibernateUtil hibernateUtil = new HibernateUtil();
        return hibernateUtil;
    }

    /* ======================================================================== */
    // product Bean
    @Bean(name = "product")
    public Product getProduct() {
        Product product = new Product();
        return product;
    }

    /* ======================================================================== */
    // product price bean
    @Bean(name = "productPrice")
    public ProductPrice getProductPrice() {
        ProductPrice productPrice = new ProductPrice();
        return productPrice;
    }
    /* ======================================================================== */

    // category bean
    @Bean(name = "category")
    public Category getCategory() {
        Category category = new Category();
        return category;
    }

    /* ======================================================================== */

    // supermarket beans
    @Bean(name = "sainsbuysSupermarket")
    public Supermarket getSainsbury() {
        Supermarket sainsbury = new Supermarket();
        sainsbury.setSupermarketId(1);
        sainsbury.setSupermarketName("Sainsbury's");
        sainsbury.setSupermarketURL("https://www.sainsburys.co.uk/");
        sainsbury.setSupermarketImage("https://www.sainsburys.co.uk/assets/images/logos_logoImage_sainsburys-logo.svg");
        return sainsbury;
    }

    @Bean(name = "aldiSupermarket")
    public Supermarket getAldi() {
        Supermarket aldi = new Supermarket();
        aldi.setSupermarketId(2);
        aldi.setSupermarketName("ALdi");
        aldi.setSupermarketURL("https://www.aldi.co.uk/");
        aldi.setSupermarketImage("https://cdn.aldi-digital.co.uk/32FDVWu4Lhbxgj9Z3v03ji0pGJIp?&w=70&h=84");
        return aldi;
    }

    @Bean(name = "cooperativeSupermarket")
    public Supermarket getCooperative() {
        Supermarket cooperative = new Supermarket();
        cooperative.setSupermarketId(3);
        cooperative.setSupermarketName("Co-operative");
        cooperative.setSupermarketURL("https://www.coop.co.uk/products/");
        cooperative.setSupermarketImage("https://www.coop.co.uk/products");
        return cooperative;
    }

    @Bean(name = "amazonSupermarket")
    public Supermarket amazonPantry() {
        Supermarket amazonPantry = new Supermarket();
        amazonPantry.setSupermarketId(4);
        amazonPantry.setSupermarketName("Amazon Pantry");
        amazonPantry.setSupermarketURL("https://www.amazon.co.uk/Amazon-Pantry/b?ie=UTF8&node=5782660031");
        amazonPantry.setSupermarketImage("https://images-eu.ssl-images-amazon.com/images/G/02/pantry/pantry-shelf-logo._CB519689796_.png");
        return amazonPantry;
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
    @Bean
    public SainsburyScraper sainsburyScraper() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        sainsburyScraper.setThreadName("Sainsbury's Thread");
        sainsburyScraper.setScraperName("Sainsbury's Scraper");
        sainsburyScraper.setCrawlDelay(3000);
        sainsburyScraper.setCrawlURL("https://www.sainsburys.co.uk/webapp/wcs/stores/servlet/SearchDisplayView?catalogId=10241&storeId=10151&langId=44&langId=44&storeId=10151&catalogId=10241&categoryId=&parent_category_rn=&top_category=&pageSize=60&orderBy=RELEVANCE&searchTerm=");
        sainsburyScraper.setCrawlQuery("milk");
        sainsburyScraper.setQuerySelector(".category-item__title");
        sainsburyScraper.setSupermarket(getSainsbury());
        return sainsburyScraper;
    }

//    @Bean
//    public AmazonScraper amazonScraper() {
//        AmazonScraper amazonScraper = new AmazonScraper();
//        amazonScraper.setThreadName("Amazon Thread");
//        amazonScraper.setScraperName("Amazon Scraper");
//        amazonScraper.setCrawlDelay(5000);
//        amazonScraper.setCrawlURL("https://www.aldi.co.uk/search?text=");
//        amazonScraper.setCrawlQuery("milk");
//        amazonScraper.setQuerySelector(".category-item__title");
//        amazonScraper.setSupermarket(amazonPantry());
//        return amazonScraper;
//    }
//
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
