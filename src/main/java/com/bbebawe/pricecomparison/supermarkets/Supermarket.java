package com.bbebawe.pricecomparison.supermarkets;

import com.bbebawe.pricecomparison.products.ProductPrice;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * The Product Supermarket represent a Supermarket object, the class implements Serializable interface.
 * The Supermarket class maps to supermarket entity in the database.
 */
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

    /**
     * Default No argument constructor.
     */
    public Supermarket() {

    }

    /**
     * second constructor.
     *
     * @param supermarketId
     * @param supermarketName
     * @param supermarketURL
     * @param supermarketImage
     */
    public Supermarket(int supermarketId, String supermarketName, String supermarketURL, String supermarketImage) {
        this.supermarketId = supermarketId;
        this.supermarketName = supermarketName;
        this.supermarketURL = supermarketURL;
        this.supermarketImage = supermarketImage;
    }

    /**
     * gets supermarket id.
     *
     * @return supermarket id.
     */
    public int getSupermarketId() {
        return supermarketId;
    }

    /**
     * sets supermarket id.
     *
     * @param supermarketId
     */
    public void setSupermarketId(int supermarketId) {
        this.supermarketId = supermarketId;
    }

    /**
     * get supermarket name.
     *
     * @return supermarket name.
     */
    public String getSupermarketName() {
        return supermarketName;
    }

    /**
     * sets supermarket name.
     *
     * @param supermarketName
     */
    public void setSupermarketName(String supermarketName) {
        this.supermarketName = supermarketName;
    }

    /**
     * gets supermarket URL.
     *
     * @return supermarket URL.
     */
    public String getSupermarketURL() {
        return supermarketURL;
    }

    /**
     * sets supermarket URL.
     *
     * @param supermarketURL
     */
    public void setSupermarketURL(String supermarketURL) {
        this.supermarketURL = supermarketURL;
    }

    /**
     * gets supermarket image.
     *
     * @return supermarket image.
     */
    public String getSupermarketImage() {
        return supermarketImage;
    }

    /**
     * sets supermarket image.
     *
     * @param supermarketImage
     */
    public void setSupermarketImage(String supermarketImage) {
        this.supermarketImage = supermarketImage;
    }

}
