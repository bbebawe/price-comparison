/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bbebawe.pricecomparison.scrapers;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.bbebawe.pricecomparison.appconfig.AppConfig;
import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.hibernateutils.HibernateUtil;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author beshoy
 */
public class SainsburyScraper extends Scraper {
    private String querySelector;

    public SainsburyScraper() {
    }


    public String getQuerySelector() {
        return querySelector;
    }

    public void setQuerySelector(String querySelector) {
        this.querySelector = querySelector;
    }


    public void run() {
        try {
            this.scrape();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void scrape() throws IOException {
        ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
        HibernateUtil hibernateUtil = appContext.getBean("hibernateUtil", HibernateUtil.class);
        hibernateUtil.init();

        List<Category> categoryList = hibernateUtil.getCategoryList();
        Product productObj = new Product();
        ProductPrice productPrice = new ProductPrice();
        int supermarketId = this.getSupermarket().getSupermarketId();

        for (Category category : categoryList) {
            this.setCrawlQuery(category.getCategoryName());
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements products = doc.select("#productLister .productNameAndPromotions");
            Elements prices = doc.select("#productLister .pricing .pricePerUnit");
            Elements images = doc.select("#productLister .productNameAndPromotions img");
            int indexOfDash = category.getCategoryName().indexOf("-");
            String keyword1 = category.getCategoryName().substring(0, (indexOfDash-1));
            String keyword2 = category.getCategoryName().substring((indexOfDash+2), category.getCategoryName().length());
            System.out.println(keyword1);
            System.out.println(keyword2);

            for (int i = 0; i < products.size(); i++) {
                if (products.get(i).text().toLowerCase().contains(keyword1) && products.get(i).text().toLowerCase().contains(keyword2)) {
                    // set product object attributes
                    productObj.setProductName(category.getCategoryName());
                    productObj.setProductDescription(products.get(i).text());
                    productObj.setProductImage(images.get(i).attr("src"));
                    productObj.setCategoryId(category.getCategoryId());

                    String priceString = prices.get(i).text().replaceAll("[£|p|/unit|']", "");
                    double price = Double.parseDouble(priceString);
                    productPrice.setProductPrice(price);
                    productPrice.setSupermarketId(supermarketId);
                    productPrice.setProductId(543);
                    productPrice.setPriceSource(this.getCrawlURL() + this.getCrawlQuery());
                    productPrice.setCategoryId(category.getCategoryId());
                    System.out.println(price);

                    hibernateUtil.saveProduct(productObj);
                    hibernateUtil.saveProductPrice(productPrice);
                    System.out.println("done");
                } else {
                    System.out.println("No");
                }


            }

        }


//        Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
//        Elements products = doc.select("#productLister .productNameAndPromotions");
//        Elements prices = doc.select("#productLister .pricing .pricePerUnit");
//
//        for(Category category: categoryList) {
//
//        }


    }
}
