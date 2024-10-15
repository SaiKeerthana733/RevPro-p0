package com.revShop.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Cart {
    private int userId; // Store the userId associated with the cart
    private Map<Integer, Integer> itemQuantities; // Map of Product ID to Quantity

    // Constructor to initialize cart with a userId
    public Cart(int userId) {
        this.userId = userId;
        this.itemQuantities = new HashMap<>();
    }

    // Default constructor (if needed)
    public Cart() {
        this.itemQuantities = new HashMap<>();
    }

    // Add an item to the cart
    public void addItem(int productId, int quantity) {
        itemQuantities.put(productId, itemQuantities.getOrDefault(productId, 0) + quantity);
    }

    // Remove an item from the cart
    public void removeItem(int productId) {
        itemQuantities.remove(productId);
    }

    // Check if the cart contains a specific product
    public boolean hasProduct(int productId) {
        return itemQuantities.containsKey(productId);
    }

    // Get all items in the cart (Product ID and quantity)
    public Map<Integer, Integer> getItems() {
        return itemQuantities;
    }

    // Clear the cart (removes all items)
    public void clearCart() {
        itemQuantities.clear();
    }

    // Get products in the cart based on available products
    public List<Product> getProducts(List<Product> availableProducts) {
        return itemQuantities.entrySet().stream()
                .map(entry -> {
                    int productId = entry.getKey();
                    return availableProducts.stream()
                            .filter(product -> product.getId() == productId)
                            .findFirst()
                            .orElse(null); // Return null if the product is not found
                })
                .filter(product -> product != null) // Filter out nulls
                .collect(Collectors.toList());
    }

    // Get the userId associated with the cart
    public int getUserId() {
        return userId;
    }
}
