
package com.bbebawe.pricecomparison.categories;

import javax.persistence.*;
import java.io.Serializable;

/**
 * The Category class represents a product Category, the class implements Serializable interface.
 * The Category class maps to category entity in the database.
 */
@Entity
@Table(name = "category")
public class Category implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    /**
     * Category Id.
     */
    private int categoryId;
    /**
     * Category Name.
     */
    @Column(name = "category_name")
    private String categoryName;
    /**
     * Category Image.
     */
    @Column(name = "category_image")
    private String categoryImage;

    /**
     * Default No argument constructor.
     */
    public Category() {
    }

    /**
     * Second constructor Creates a new Student with the given category Id, Category Name and Category Image.
     *
     * @param categoryId    the category id
     * @param categoryName  the category name
     * @param categoryImage the category image
     */
    public Category(int categoryId, String categoryName, String categoryImage) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryImage = categoryImage;
    }

    /**
     * Return the Category id.
     *
     * @return Category id.
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * sets Category id.
     *
     * @param categoryId
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * Return the Category Name.
     *
     * @return Category Name.
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * sets Category Name.
     *
     * @param categoryName
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    /**
     * Return the Category Image.
     *
     * @return Category Image.
     */
    public String getCategoryImage() {
        return categoryImage;
    }

    /**
     * sets Category Image.
     *
     * @param categoryImage
     */
    public void setCategoryImage(String categoryImage) {
        this.categoryImage = categoryImage;
    }
}
