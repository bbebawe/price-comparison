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

    @Column(name = "product_description")
    private String productDescription;

    @Column(name = "product_image")
    private String productImage;

    @Column(name = "category_id")
    private int categoryId;

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

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }


    public String getProductInfo() {
        String productInfo = "Product Id: " + this.getProductId() + "\n-----------\n" + "Product Name: " +
                this.getProductName() + "\n-----------\n" + "Product Category: " + this.getCategoryId() +
                "\n-----------\n" + "Product Description: " + this.getProductDescription() + "\n-----------\n"
                + "Product Image: " + this.getProductImage() + "\n-----------\n";
        return productInfo;
    }
}
