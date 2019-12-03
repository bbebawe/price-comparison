
package com.bbebawe.pricecomparison.hibernateutils;

import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * The HibernateUtil contains methods used to query and manipulate the database.
 */
public class HibernateUtil {

    private SessionFactory sessionFactory;

    /**
     * return session factory.
     *
     * @return session factory.
     */
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    /**
     * sets session factory.
     *
     * @param sessionFactory
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * Default No argument constructor.
     */
    public HibernateUtil() {
    }

    /**
     * The getProductList method query the database and return list of all products in the product table.
     *
     * @return lsit of all products in the database.
     */
    public List<Product> getProductList() {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        // get list of available categories
        List<Product> productList = (ArrayList<Product>) session.createQuery("from Product").getResultList();

        //Close the session and release database connection
        session.close();
        return productList;
    }

    /**
     * The saveProduct method is used to save product to the database.
     *
     * @param product
     */
    public void saveProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();
        //Start transaction
        session.beginTransaction();

        //Add Cereal to database - will not be stored until we commit the transaction
        session.save(product);

        //Commit transaction to save it to database
        session.getTransaction().commit();

        //Close the session and release database connection
        session.close();
        System.out.println("Product added to database with ID: " + product.getProductId());
    }


    /**
     * The getProductById is used to query the database to select product using its id.
     *
     * @param productId
     * @return product that matches the query id.
     */
    public Product getProductById(int productId) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        // get list of available categories
        Product product = (Product) session.createQuery("from Product pr where  pr.productId=productId").getResultList().get(0);

        //Close the session and release database connection
        session.close();
        return product;
    }


    /**
     * The saveProductPrice is used to save product into product_price table in the database.
     *
     * @param productPrice
     */
    public void saveProductPrice(ProductPrice productPrice) {
        Session session = sessionFactory.getCurrentSession();
        //Start transaction
        session.beginTransaction();

        //Add Cereal to database - will not be stored until we commit the transaction
        session.save(productPrice);

        //Commit transaction to save it to database
        session.getTransaction().commit();

        //Close the session and release database connection
        session.close();
        System.out.println("Product added to database with ID: " + productPrice.getProduct().getProductId());
    }

    /**
     * The updateProductPrice is used to update product in the product_price table.
     * Method is used when product price is changed.
     *
     * @param newPrice
     * @param id
     */
    public void updateProductPrice(double newPrice, int id) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();


        String hql = "UPDATE ProductPrice pr SET pr.productPrice = :newPrice WHERE pr.priceId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("newPrice", newPrice);
        query.setParameter("id", id);
        int result = query.executeUpdate();
        session.close();
        System.out.println("Updated : " + result);

    }

    /**
     * The getProductPriceByDescription is used to query the database and return all products from product_price table.
     * The method return all the products that matches the provides supermarket id and product description.
     *
     * @param supermarketId
     * @param description
     * @return
     */
    public List<ProductPrice> getProductPriceByDescription(int supermarketId, String description) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        String hql = "FROM ProductPrice pr WHERE pr.supermarket.supermarketId =: supermarketId AND pr.productDescription = :description";
        Query query = session.createQuery(hql);
        query.setParameter("supermarketId", supermarketId);
        query.setParameter("description", description);

        // get list of available products
        List<ProductPrice> results = query.getResultList();

        //Close the session and release database connection
        session.close();
        return results;
    }

    /**
     * The saveSupermarket is used to save supermarket object into supermarket table.
     *
     * @param supermarket
     */
    public void saveSupermarket(Supermarket supermarket) {
        Session session = sessionFactory.getCurrentSession();
        //Start transaction
        session.beginTransaction();

        //Add Cereal to database - will not be stored until we commit the transaction
        session.save(supermarket);

        //Commit transaction to save it to database
        session.getTransaction().commit();

        //Close the session and release database connection
        session.close();
        System.out.println("Supermarket Added: " + supermarket.getSupermarketId());
    }

    /**
     * The getCategoryList method is used to get category list from the database.
     *
     * @return category list.
     */
    public List<Category> getCategoryList() {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        // get list of available categories
        List<Category> categoryList = (ArrayList<Category>) session.createQuery("from Category").getResultList();

        //Close the session and release database connection
        session.close();
        return categoryList;
    }

    /**
     * The getCategoryById method is used to select category by id.
     *
     * @param categoryId
     * @return category selected by id.
     */
    public Category getCategoryById(int categoryId) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        // get list of available categories
        List<Category> category = (ArrayList<Category>) session.createQuery("from Category where categoryId=categoryId").getResultList();

        //Close the session and release database connection
        session.close();
        return category.get(0);
    }

    /**
     * The saveCategory method is used to save category into category table.
     *
     * @param category
     */
    public void saveCategory(Category category) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        session.save(category);
        //Commit transaction to save it to database
        session.getTransaction().commit();

        //Close the session and release database connection
        session.close();

        System.out.println("Category Saved");
    }

    /**
     * The shutDown method is used to close Session factory.
     */
    public void shutDown() {
        this.sessionFactory.close();
    }
}
