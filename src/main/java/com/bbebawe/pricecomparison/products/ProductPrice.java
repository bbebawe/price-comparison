package com.bbebawe.pricecomparison.products;

import javax.persistence.*;

@Entity
@Table(name = "product_price")
public class ProductPrice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "price_id")
    private  int priceId;
    @Column(name = "product_id")
    private int productId;

    @Column(name = "supermarket_id")
    private int supermarketId;

    @Column(name = "category_id")
    private int categoryId;

    @Column(name = "product_price")
    private double productPrice;

    @Column(name = "price_source")
    private String priceSource;

    public int getPriceId() {
        return priceId;
    }

    public void setPriceId(int priceId) {
        this.priceId = priceId;
    }


    public ProductPrice() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSupermarketId() {
        return supermarketId;
    }

    public void setSupermarketId(int supermarketId) {
        this.supermarketId = supermarketId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getPriceSource() {
        return priceSource;
    }

    public void setPriceSource(String priceSource) {
        this.priceSource = priceSource;
    }
}
