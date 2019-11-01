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
import org.hibernate.tool.schema.internal.exec.ScriptTargetOutputToStdout;

import java.util.ArrayList;
import java.util.List;

public class HibernateUtil {

    private SessionFactory sessionFactory;

    public HibernateUtil() {

    }

    // initialise hibernate util
    public void init() {
        try {
            //Create a builder for the standard service registry
            StandardServiceRegistryBuilder standardServiceRegistryBuilder = new StandardServiceRegistryBuilder();

            //Load configuration from hibernate configuration file
            standardServiceRegistryBuilder.configure("resources/hibernate.cfg.xml");

            //Create the registry that will be used to build the session factory
            StandardServiceRegistry registry = standardServiceRegistryBuilder.build();

            try {
                //Create the session factory - this is the goal of the init method.
                sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
            } catch (Exception e) {
                /* The registry would be destroyed by the SessionFactory,
                        but we had trouble building the SessionFactory, so destroy it manually */
                System.err.println("Session Factory build failed.");
                e.printStackTrace();
                StandardServiceRegistryBuilder.destroy(registry);
            }

            //output result
            System.out.println("Session factory built.");

        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("SessionFactory creation failed." + ex);
        }
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
        System.out.println("Product added to database with ID: " + productPrice.getProductId());
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
