package com.bbebawe.pricecomparison.products;

import com.bbebawe.pricecomparison.supermarkets.Supermarket;

import javax.persistence.*;
import java.io.Serializable;

/**
 * The Product Price class represent a product price object, the class implements Serializable interface.
 * The Product class maps to product_price entity in the database.
 */
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

    @Column(name = "product_description")
    private String productDescription;

    @Column(name = "product_image")
    private String productImage;

    /**
     * gets product price id.
     *
     * @return product price id.
     */
    public int getPriceId() {
        return priceId;
    }

    /**
     * sets product price id.
     *
     * @param priceId
     */
    public void setPriceId(int priceId) {
        this.priceId = priceId;
    }

    /**
     * get product object.
     *
     * @return product object.
     */
    public Product getProduct() {
        return product;
    }

    /**
     * sets product object
     *
     * @param product
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * gets supermarket object.
     *
     * @return supermarket object.
     */
    public Supermarket getSupermarket() {
        return supermarket;
    }

    /**
     * sets supermarket object.
     *
     * @param supermarket
     */
    public void setSupermarket(Supermarket supermarket) {
        this.supermarket = supermarket;
    }

    /**
     * gets product price.
     *
     * @return product price.
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * sets product price.
     *
     * @param productPrice
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    /**
     * gets product price source.
     *
     * @return product price source.
     */
    public String getPriceSource() {
        return priceSource;
    }

    /**
     * sets product price source.
     *
     * @param priceSource
     */
    public void setPriceSource(String priceSource) {
        this.priceSource = priceSource;
    }

    /**
     * gets product description.
     *
     * @return product description.
     */
    public String getProductDescription() {
        return productDescription;
    }

    /**
     * set product description.
     *
     * @param productDescription
     */
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    /**
     * gets product image.
     *
     * @return product image.
     */
    public String getProductImage() {
        return productImage;
    }

    /**
     * sets product image.
     *
     * @param productImage
     */
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    /**
     * The getProductPriceInfo method return product price description as string.
     *
     * @return product price description.
     */
    public String getProductPriceInfo() {
        return "Product Id: " + this.getProduct().getProductId() + " Supermarket Id: " + this.getSupermarket().getSupermarketId() + " Category Id: " +
                this.getProduct().getCategoryId() + " Product Price: " + this.getProductPrice() + " Price Source: " + this.getPriceSource();
    }
}
