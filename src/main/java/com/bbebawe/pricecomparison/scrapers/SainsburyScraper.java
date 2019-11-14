/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bbebawe.pricecomparison.scrapers;


import java.io.IOException;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;

import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

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
//        firsTimeScrap();
updateScrapped();


    }

    public void updateScrapped() throws IOException {
        List<Category> categoryList = hibernateUtil.getCategoryList();

        for (Category category : categoryList) {
            this.setCrawlQuery(category.getCategoryName());
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements products = doc.select("#productLister .productNameAndPromotions");
            Elements prices = doc.select("#productLister .pricing .pricePerUnit");
            Elements images = doc.select("#productLister .productNameAndPromotions img");

            int indexOfDash = category.getCategoryName().indexOf("-");
            String keyword1 = category.getCategoryName().substring(0, (indexOfDash - 1));
            String keyword2 = category.getCategoryName().substring((indexOfDash + 2), category.getCategoryName().length());
            for (int i = 0; i < products.size(); i++) {
                Product productObj = new Product();
                ProductPrice productPrice = new ProductPrice();
                if (products.get(i).text().toLowerCase().contains(keyword1) && products.get(i).text().toLowerCase().contains(keyword2)) {
                    String description = products.get(i).text();
                    Product product = hibernateUtil.getProductByDescription(description);
                    ProductPrice currentProductPrice = hibernateUtil.getProductPriceById(product.getProductId());
                    String priceString = prices.get(i).text().replaceAll("[£|p|/unit|']", "");
                    double price = Double.parseDouble(priceString);
                   if(currentProductPrice.getProductPrice() != price) {
                       System.out.println("They are not equal");
                       hibernateUtil.updateProductPrice(price, product.getProductId());
                   }
                } else {
                    System.out.println("No");
                }
            }
        }
    }

    public void firsTimeScrap() throws IOException {
        List<Category> categoryList = hibernateUtil.getCategoryList();

        for (Category category : categoryList) {
            this.setCrawlQuery(category.getCategoryName());
            Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
            Elements products = doc.select("#productLister .productNameAndPromotions");
            Elements prices = doc.select("#productLister .pricing .pricePerUnit");
            Elements images = doc.select("#productLister .productNameAndPromotions img");

            int indexOfDash = category.getCategoryName().indexOf("-");
            String keyword1 = category.getCategoryName().substring(0, (indexOfDash - 1));
            String keyword2 = category.getCategoryName().substring((indexOfDash + 2), category.getCategoryName().length());
            System.out.println(keyword1);
            System.out.println(keyword2);


            for (int i = 0; i < products.size(); i++) {
                Product productObj = new Product();
                ProductPrice productPrice = new ProductPrice();
                if (products.get(i).text().toLowerCase().contains(keyword1) && products.get(i).text().toLowerCase().contains(keyword2)) {
                    // set product object attributes
                    productObj.setProductName(category.getCategoryName());
                    productObj.setProductDescription(products.get(i).text());
                    productObj.setProductImage(images.get(i).attr("src"));
                    productObj.setCategoryId(category.getCategoryId());
                    productPrice.setProduct(productObj);

                    String priceString = prices.get(i).text().replaceAll("[£|p|/unit|']", "");
                    double price = Double.parseDouble(priceString);
                    productPrice.setProductPrice(price);
                    productPrice.setPriceSource(this.getCrawlURL() + this.getCrawlQuery());
                    System.out.println(price);

                    Supermarket supermarket = this.getSupermarket();
                    productPrice.setSupermarket(supermarket);
                    hibernateUtil.saveProductPrice(productPrice);
                    System.out.println("done");
                } else {
                    System.out.println("No");
                }
            }
        }
    }

}
