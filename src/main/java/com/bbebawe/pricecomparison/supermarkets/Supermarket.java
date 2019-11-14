package com.bbebawe.pricecomparison.supermarkets;

import com.bbebawe.pricecomparison.products.ProductPrice;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "supermarket")
public class Supermarket implements Serializable {
    @Id
    @Column(name = "supermarket_id")
    private int supermarketId;

    @Column(name = "supermarket_name")
    private String supermarketName;

    @Column(name = "supermarket_url")
    private String supermarketURL;

    @Column(name = "supermarket_image")
    private String supermarketImage;

    @OneToMany(mappedBy = "supermarket")
    private Set<ProductPrice> productPrices = new HashSet<ProductPrice>();

    public Supermarket() {

    }

    public Supermarket(int supermarketId, String supermarketName, String supermarketURL, String supermarketImage) {
        this.supermarketId = supermarketId;
        this.supermarketName = supermarketName;
        this.supermarketURL = supermarketURL;
        this.supermarketImage = supermarketImage;
    }

    public int getSupermarketId() {
        return supermarketId;
    }

    public void setSupermarketId(int supermarketId) {
        this.supermarketId = supermarketId;
    }

    public String getSupermarketName() {
        return supermarketName;
    }

    public void setSupermarketName(String supermarketName) {
        this.supermarketName = supermarketName;
    }

    public String getSupermarketURL() {
        return supermarketURL;
    }

    public void setSupermarketURL(String supermarketURL) {
        this.supermarketURL = supermarketURL;
    }

    public String getSupermarketImage() {
        return supermarketImage;
    }

    public void setSupermarketImage(String supermarketImage) {
        this.supermarketImage = supermarketImage;
    }

}
