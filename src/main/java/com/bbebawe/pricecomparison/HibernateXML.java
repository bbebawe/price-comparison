///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.bbebawe.pricecomparison;
//
//import java.util.List;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.boot.MetadataSources;
//import org.hibernate.boot.registry.StandardServiceRegistry;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//
///**
// *
// * @author beshoy
// */
//public class HibernateXML {
//
//    private SessionFactory sessionFactory;
//
//    public HibernateXML() {
//
//    }
//
//    public void init() {
//        try {
//            //Create a builder for the standard service registry
//            StandardServiceRegistryBuilder standardServiceRegistryBuilder = new StandardServiceRegistryBuilder();
//
//            //Load configuration from hibernate configuration file
//            standardServiceRegistryBuilder.configure("resources/hibernate.cfg.xml");
//
//            //Create the registry that will be used to build the session factory
//            StandardServiceRegistry registry = standardServiceRegistryBuilder.build();
//
//            try {
//                //Create the session factory - this is the goal of the init method.
//                sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
//            } catch (Exception e) {
//                /* The registry would be destroyed by the SessionFactory,
//                        but we had trouble building the SessionFactory, so destroy it manually */
//                System.err.println("Session Factory build failed.");
//                e.printStackTrace();
//                StandardServiceRegistryBuilder.destroy(registry);
//            }
//
//            //Ouput result
//            System.out.println("Session factory built.");
//
//        } catch (Throwable ex) {
//            // Make sure you log the exception, as it might be swallowed
//            System.err.println("SessionFactory creation failed." + ex);
//        }
//    }
//
//    /**
//     * Closes Hibernate down and stops its threads from running
//     */
//    public void shutDown() {
//        sessionFactory.close();
//    }
//
//    public void addProduct() {
//        Session session = sessionFactory.getCurrentSession();
//
//        //Create an instance of a Cereal class
//        Product product = new Product();
//
//        //Set values of Cereal class that we want to add
//        product.setProductId(1);
//        product.setProductDescription("hi");
//        product.setCategoryId(1);
//        product.setProductImage("my image");
//        product.setProductName("Milk");
//        product.setBrandId(1);
//
//        //Start transaction
//        session.beginTransaction();
//
//        //Add Cereal to database - will not be stored until we commit the transaction
//        session.save(product);
//
//        //Commit transaction to save it to database
//        session.getTransaction().commit();
//
//        //Close the session and release database connection
//        session.close();
//        System.out.println("Product added to database with ID: " + product.getProductId());
//    }
//
//        /** Searches for Cereals whose price is 5.5 */
//    public void searchCereals(){
//        //Get a new Session instance from the session factory
//        Session session = sessionFactory.getCurrentSession();
//
//        //Start transaction
//        session.beginTransaction();
//
//        List<Product> productList = session.createQuery("from Product where name=milk").getResultList();
//        for(Product product : productList){
//            System.out.println(product.toString());
//        }
//
//        //Close the session and release database connection
//        session.close();
//    }
//
//
//    /** Deletes an object without a foreign key from the database
//        This will generate an error if there is a foreign key. */
//    public void deleteCerealSimple(){
//        //Create Cereal class with the ID that we want to delete
//        Product product = new Product();
//        product.setProductId(1);
//
//        //Get a new Session instance from the session factory
//        Session session = sessionFactory.getCurrentSession();
//
//        //Start transaction
//        session.beginTransaction();
//
//        //Update database to match class
//        session.delete(product);
//        session.getTransaction().commit();
//
//        //Close the session and release database connection
//        session.close();
//        System.out.println("Cereal updated in database. ID: " + product.getProductId());
//    }
//
//
//    /** Deletes a cereal in a way that will work with tables with foreign keys */
//    public void deleteCerealSafe(){
//        //Get a new Session instance from the session factory
//        Session session = sessionFactory.getCurrentSession();
//
//        //Start transaction
//        session.beginTransaction();
//
//        //Search for cereal in database that has ID of 6
//        Object persistentInstance = session.load(Product.class, 1);
//
//        //Delete object (and corresponding data) if we have found a match.
//        if (persistentInstance != null)
//            session.delete(persistentInstance);
//
//        //Update database
//        session.getTransaction().commit();
//
//        //Close the session and release database connection
//        session.close();
//        System.out.println("Cereal updated in database. ID: 6");
//    }
//}
