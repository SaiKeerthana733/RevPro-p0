package com.revShop.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.revShop.services.CartService;
import com.revShop.models.Cart; // Assuming you have a Cart class to represent the shopping cart
import com.revShop.services.ProductService;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private CartService cartService;
    private ProductService productService; // Declare ProductService

    @Override
    public void init() throws ServletException {
        // Initialize ProductService
        productService = new ProductService(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Get userId from session
        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect if user is not logged in
            return;
        }

        // Initialize CartService
        cartService = new CartService(userId, productService.getAvailableProducts()); 

        // Retrieve cart items for the user
        Cart cart = cartService.getCart(); // Fetch the Cart object
        request.setAttribute("cartItems", cart.getItems()); // Assuming getItems() returns a List<CartItem>
        request.setAttribute("availableProducts", productService.getAvailableProducts()); // Add available products to request
        request.getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Ensure user is logged in
        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect if user is not logged in
            return;
        }

        String action = request.getParameter("action"); // Get action (add/remove)
        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity"); // Get quantity from the request

        // Reinitialize CartService for the current user
        cartService = new CartService(userId, productService.getAvailableProducts());

        if (productIdStr != null) {
            try {
                int productId = Integer.parseInt(productIdStr);

                if ("remove".equals(action)) {
                    // Handle item removal
                    boolean removed = cartService.removeItemFromCart(productId); // Remove item from cart
                    if (removed) {
                        request.setAttribute("successMessage", "Item removed successfully!");
                    } else {
                        request.setAttribute("errorMessage", "Item not found in cart!");
                    }
                } else if ("add".equals(action)) {
                    // Handle item addition
                    if (quantityStr != null) {
                        try {
                            int quantity = Integer.parseInt(quantityStr); // Parse quantity entered by the user
                            if (quantity > 0) { // Ensure quantity is positive
                                boolean added = cartService.addItemToCart(productId, quantity); // Add item to the cart with user-defined quantity
                                if (added) {
                                    request.setAttribute("successMessage", "Item added successfully!");
                                } else {
                                    request.setAttribute("errorMessage", "Requested quantity exceeds available stock.");
                                }
                            } else {
                                request.setAttribute("errorMessage", "Quantity must be greater than zero!");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("errorMessage", "Invalid quantity!");
                        }
                    } else {
                        request.setAttribute("errorMessage", "Quantity is required!");
                    }
                } else {
                    request.setAttribute("errorMessage", "Invalid action!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid product ID!");
            }
        } else {
            request.setAttribute("errorMessage", "Product ID is required!");
        }

        // Prepare the cart data for JSP
        Cart cart = cartService.getCart(); // Fetch the Cart object
        request.setAttribute("cartItems", cart.getItems()); // Assuming getItems() returns a List<CartItem>
        request.setAttribute("availableProducts", productService.getAvailableProducts()); // Set available products for the JSP

        // Forward to the cart page to display success or error messages
        request.getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
    }
}
