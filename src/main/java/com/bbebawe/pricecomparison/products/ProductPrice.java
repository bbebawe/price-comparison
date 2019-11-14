package com.bbebawe.pricecomparison.products;

import com.bbebawe.pricecomparison.supermarkets.Supermarket;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "product_price")
public class ProductPrice implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "price_id")
    private int priceId;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "supermarket_id")
    private Supermarket supermarket;

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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Supermarket getSupermarket() {
        return supermarket;
    }

    public void setSupermarket(Supermarket supermarket) {
        this.supermarket = supermarket;
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

    public String getProductPriceInfo() {
        return "Product Id: " + this.getProduct().getProductId() + " Supermarket Id: " + this.getSupermarket().getSupermarketId() + " Category Id: " +
                this.getProduct().getCategoryId() + " Product Price: " + this.getProductPrice() + " Price Source: " + this.getPriceSource();
    }
}
