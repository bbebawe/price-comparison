package com.bbebawe.pricecomparison.products;

import java.util.List;

public class ScrapedProduct {

    private List<Product> products;
    private  List<ProductPrice> productPrices;

    public ScrapedProduct() {
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<ProductPrice> getProductPrices() {
        return productPrices;
    }

    public void setProductPrices(List<ProductPrice> productPrices) {
        this.productPrices = productPrices;
    }
}
