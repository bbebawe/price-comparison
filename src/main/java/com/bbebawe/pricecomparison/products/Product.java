/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bbebawe.pricecomparison.products;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * @author beshoy
 */
@Entity
@Table(name = "product")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int productId;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "product_keywords")
    private String productKeywords;

    @Column(name = "category_id")
    private int categoryId;

    @Column(name = "product_volume")
    private String productVolume;

    @OneToMany(mappedBy = "product")
    private Set<ProductPrice> productPrices = new HashSet<ProductPrice>();

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductKeywords() {
        return productKeywords;
    }

    public void setProductKeywords(String productKeywords) {
        this.productKeywords = productKeywords;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductVolume() {
        return productVolume;
    }

    public void setProductVolume(String productVolume) {
        this.productVolume = productVolume;
    }

    public Set<ProductPrice> getProductPrices() {
        return productPrices;
    }

    public void setProductPrices(Set<ProductPrice> productPrices) {
        this.productPrices = productPrices;
    }

    public String getProductInfo() {
        String productInfo = "Product Id: " + this.getProductId() + "\n-----------\n" + "Product Name: " +
                this.getProductName() + "\n-----------\n" +  "Product Category: " + this.getCategoryId();
        return productInfo;
    }
}
