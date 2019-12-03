
package com.bbebawe.pricecomparison.products;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * The Product class represent a product object, the class implements Serializable interface.
 * The Product class maps to product entity in the database.
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

    @Column(name = "product_query")
    private String productQuery;

    @Column(name = "product_keywords")
    private String productKeywords;

    @Column(name = "category_id")
    private int categoryId;

    @Column(name = "product_volume")
    private String productVolume;

    @OneToMany(mappedBy = "product")
    private Set<ProductPrice> productPrices = new HashSet<ProductPrice>();

    /**
     * Default No argument constructor.
     */
    public Product() {
    }

    /**
     * gets product id.
     *
     * @return product id.
     */
    public int getProductId() {
        return productId;
    }

    /**
     * sets product id.
     *
     * @param productId
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * gets product name.
     *
     * @return product name.
     */
    public String getProductName() {
        return productName;
    }

    /**
     * sets product name.
     *
     * @param productName
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * get product query.
     *
     * @return product query.
     */
    public String getProductQuery() {
        return productQuery;
    }

    /**
     * sets product query.
     *
     * @param productQuery
     */
    public void setProductQuery(String productQuery) {
        this.productQuery = productQuery;
    }

    /**
     * gets product keywords.
     *
     * @return product keywords.
     */
    public String getProductKeywords() {
        return productKeywords;
    }

    /**
     * sets product keywords.
     *
     * @param productKeywords
     */
    public void setProductKeywords(String productKeywords) {
        this.productKeywords = productKeywords;
    }

    /**
     * gets product category id.
     *
     * @return product category id.
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * sets product category id.
     * @param categoryId
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * gets product volume.
     * @return product volume.
     */
    public String getProductVolume() {
        return productVolume;
    }

    /**
     * stets product volume.
     * @param productVolume
     */
    public void setProductVolume(String productVolume) {
        this.productVolume = productVolume;
    }

    /**
     * gets product price.
     * @return product price.
     */
    public Set<ProductPrice> getProductPrices() {
        return productPrices;
    }

    /**
     * sets product price
     * @param productPrices
     */
    public void setProductPrices(Set<ProductPrice> productPrices) {
        this.productPrices = productPrices;
    }

    /**
     * The getProductInfo method return product description as string.
     *
     * @return product description.
     */
    public String getProductInfo() {
        String productInfo = "Product Id: " + this.getProductId() + "\n-----------\n" + "Product Name: " +
                this.getProductName() + "\n-----------\n" + "Product Category: " + this.getCategoryId();
        return productInfo;
    }
}
