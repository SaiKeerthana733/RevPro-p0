package com.revShop.services;

import com.revShop.dao.CartDAO;
import com.revShop.models.Cart;
import com.revShop.models.Product;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

public class CartService {
    private CartDAO cartDAO;
    private Cart cart;
    private int userId; // Store userId for the current session
    private List<Product> availableProducts; // List of available products

    // Constructor for CartService, initializes with userId and available products
    public CartService(int userId, List<Product> availableProducts) {
        this.cartDAO = new CartDAO();
        this.userId = userId;
        this.availableProducts = availableProducts;
        this.cart = cartDAO.getCart(userId); // Fetch the cart for the user

        // Initialize the cart if it doesn't exist for the user
        if (this.cart == null) {
            this.cart = new Cart(userId); // Create a new cart instance
        }
    }

    // Add item to the cart
    public boolean addItemToCart(int productId, int quantity) {
        // Validate quantity
        if (quantity <= 0) {
            throw new IllegalArgumentException("Invalid quantity specified.");
        }

        // Check if the product is available in the available products list
        Optional<Product> productOpt = availableProducts.stream()
                .filter(p -> p.getId() == productId)
                .findFirst();

        if (productOpt.isPresent()) {
            Product product = productOpt.get();
            
            // Ensure the requested quantity does not exceed available quantity
            if (quantity > product.getQuantity()) {
                throw new IllegalArgumentException("Requested quantity exceeds available stock.");
            }

            // Check if the product is already in the cart
            if (cart.hasProduct(productId)) {
                // Update the quantity if it exists
                int currentQuantity = cart.getItems().get(productId);
                cart.addItem(productId, quantity); // Update the quantity (overwrite)
            } else {
                cart.addItem(productId, quantity); // Add new item to the cart
            }
            
            cartDAO.saveCart(cart, userId); // Save the updated cart in the DB
            return true;
        } else {
            throw new NoSuchElementException("Product with ID " + productId + " not available.");
        }
    }



    // Remove item from cart
    public boolean removeItemFromCart(int productId) {
        if (cart.hasProduct(productId)) {
            int currentQuantity = cart.getItems().get(productId);
            if (currentQuantity > 1) {
                // Decrease the quantity
                cart.addItem(productId, -1); // Decrement by 1
            } else {
                // Remove item if quantity is 1
                cart.removeItem(productId); // Remove item from the cart
            }
            cartDAO.saveCart(cart, userId); // Update cart in the database
            return true; // Item quantity changed or removed
        }
        return false; // Item not found in cart
    }

    // Get the cart for the current user
    public Cart getCart() {
        return cart;
    }

    // Return products in the cart along with available product info (quantity, etc.)
    public List<Product> getCartForUser() {
        return cart.getProducts(availableProducts);  // Return products based on available products
    }

    // Clear the cart for the current user
    public void clearCart() {
        cart.clearCart(); // Clear the cart instance
        cartDAO.clearCart(userId); // Remove the cart from the database
    }
}
