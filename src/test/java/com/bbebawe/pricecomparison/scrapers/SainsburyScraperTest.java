package com.bbebawe.pricecomparison.scrapers;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class SainsburyScraperTest {

    @DisplayName("<= Test getProductKeywords() get List of Keywords From String =>")
    @Test
    public void testGetProductKeywords() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        String keywordString = "milk,cheese,butter";
        assertEquals(Arrays.asList("milk", "cheese", "butter"), sainsburyScraper.getProductKeywords(keywordString),
                "Should Return list that contains milk, cheese and butter");
    }

    @DisplayName("<= Test getProductKeywords not to be Null =>")
    @Test
    public void testGetProductKeywordsNotToReturnNull() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        String productKeyWordsString = "orange,juice,950";
        List<String> productKeywords = sainsburyScraper.getProductKeywords(productKeyWordsString);
        assertNotNull(productKeywords, "List should not be null it should have three keywords");
    }

    @DisplayName("<= Test getProductKeywords to return number of KeyWords =>")
    @Test
    public void testGetProductKeywordsToReturnNumberOfKeyWords() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        String productKeyWordsString = "orange,juice,950,ml";
        List<String> productKeywords = sainsburyScraper.getProductKeywords(productKeyWordsString);
        assertEquals(4, productKeywords.size(), "List size should be 4 because the string has 4 keywords");
    }

    @DisplayName("<= Test getProductPriceFromString to Return Price in Pound From String =>")
    @Test
    public void testGetProductPriceInPoundsFromString() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        String priceString = "£1.10/unit";
        double price = sainsburyScraper.getProductPriceFromString(priceString);
        assertEquals(1.10, price, "Price should be 1.10");
    }

    @DisplayName("<= Test productMatch() to Return True If Product Match =>")
    @Test
    public void testProductMatchToReturnTrue() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        String scrappedProductDescription = "Sainsbury's British Whole Milk 3.4L (6 pint)";
        String productKeyWordsString = "whole,milk,6 pint";
        List<String> productKeywords = sainsburyScraper.getProductKeywords(productKeyWordsString);
        boolean isProductMatch = sainsburyScraper.productMatch(productKeywords, scrappedProductDescription);
        assertTrue(isProductMatch, "Should Return True because the Product String Contains all the Product Keywords");
    }

    @DisplayName("<= Test productMatch() to Return False If Product is Not Match =>")
    @Test
    public void testProductMatchToReturnFalse() {
        SainsburyScraper sainsburyScraper = new SainsburyScraper();
        String scrappedProductDescription = "Cravendale Purefilter Whole Milk 2L";
        String productKeyWordsString = "whole,milk,4 pint";
        List<String> productKeywords = sainsburyScraper.getProductKeywords(productKeyWordsString);
        boolean isProductMatch = sainsburyScraper.productMatch(productKeywords, scrappedProductDescription);
        assertFalse(isProductMatch, "Should Return False because the Product String Does not Contains all the Product Keywords");
    }

}