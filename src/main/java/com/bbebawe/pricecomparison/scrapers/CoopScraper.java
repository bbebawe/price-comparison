///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.bbebawe.pricecomparison.scrapers;
//
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//import com.bbebawe.pricecomparison.products.Product;
//import com.bbebawe.pricecomparison.supermarkets.Supermarket;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.select.Elements;
//
///**
// * @author beshoy
// */
//public class CoopScraper extends Scraper {
//    private String querySelector;
//
//    public CoopScraper() {
//    }
//
//    public CoopScraper(String threadName, int crawlDelay, String scraperName, String crawlURL, String crawlQuery, Supermarket supermarket, String querySelector) {
//        super(threadName, crawlDelay, scraperName, crawlURL, crawlQuery, supermarket);
//        this.querySelector = querySelector;
//    }
//
//
//    public String getQuerySelector() {
//        return querySelector;
//    }
//
//    public void setQuerySelector(String querySelector) {
//        this.querySelector = querySelector;
//    }
//
//
//    @Override
//    public void run() {
//        for (int i = 0; i < 5; i++) {
//            try {
//                this.scrape();
//            } catch (IOException ex) {
//                Logger.getLogger(AldiScraper.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            try {
//                this.currentThread().sleep(this.getCrawlDelay());
//            } catch (InterruptedException ex) {
//                Logger.getLogger(AldiScraper.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//    }
//
//    @Override
//    public void scrape() throws IOException {
//        Document doc = Jsoup.connect(this.getCrawlURL() + this.getCrawlQuery()).get();
//        Elements products = doc.select(this.querySelector);
//        System.out.println("Scrapped from " + this.getScraperName() + " " + products.get(0).text());
//        System.out.println("----------------------");
//    }
//}
