package com.bbebawe.pricecomparison.hibernateutils;

import com.bbebawe.pricecomparison.categories.Category;
import com.bbebawe.pricecomparison.products.Product;
import com.bbebawe.pricecomparison.products.ProductPrice;
import com.bbebawe.pricecomparison.supermarkets.Supermarket;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

public class HibernateUtil {

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public HibernateUtil() {

    }


    /* ======================================================================== */
    // product utils
    // get product list
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

    // save product
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

    public Product getProductByDescription(String description) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        String hql = "FROM Product pr WHERE pr.productDescription = :description";
        Query query = session.createQuery(hql);
        query.setParameter("description", description);
        // get list of available categories
        Product product = (Product) query.getResultList().get(0);

        //Close the session and release database connection
        session.close();
        return product;
    }
    /* ======================================================================== */

    // product price util
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

    public List<ProductPrice> getProductPriceList() {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        // get list of available categories
        List<ProductPrice> productPriceList = (ArrayList<ProductPrice>) session.createQuery("from ProductPrice ").getResultList();

        //Close the session and release database connection
        session.close();
        return productPriceList;
    }


    public ProductPrice getProductPriceById(int id) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();


        String hql = "FROM ProductPrice obj WHERE obj.product.productId = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        // get list of available categories
        ProductPrice productPrice = (ProductPrice) query.getResultList().get(0);

        //Close the session and release database connection
        session.close();
        return productPrice;

    }

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

    public List<ProductPrice> getProductPriceByDescription(String description) {
        //Get a new Session instance from the session factory
        Session session = sessionFactory.getCurrentSession();

        //Start transaction
        session.beginTransaction();

        String hql = "FROM ProductPrice pr WHERE pr.productDescription = :description";
        Query query = session.createQuery(hql);
        query.setParameter("description", description);
        // get list of available categories

        List<ProductPrice> results = query.getResultList();

        //Close the session and release database connection
        session.close();
        return results;
    }

    /* ======================================================================== */

    /* Supermarket utils */
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


    /***********************************************************************/
    /* Category Utils */
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

    /* ======================================================================== */

    public void shutDown() {
        this.sessionFactory.close();
    }
}
