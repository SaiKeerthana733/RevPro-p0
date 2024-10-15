package com.revShop.dao;

import com.revShop.models.Cart;
import com.revShop.utils.DatabaseConnection;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDAO {
    public void saveCart(Cart cart, int userId) {
        String query = "INSERT INTO carts (user_id, product_id, quantity) VALUES (?, ?, ?) " +
                       "ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)";
        try (Connection connection = DatabaseConnection.getConnection()) {
            for (Map.Entry<Integer, Integer> entry : cart.getItems().entrySet()) {
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setInt(1, userId);
                    preparedStatement.setInt(2, entry.getKey());
                    preparedStatement.setInt(3, entry.getValue());
                    preparedStatement.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL exceptions
        }
    }

    public Cart getCart(int userId) {
        Cart cart = new Cart();
        String query = "SELECT product_id, quantity FROM carts WHERE user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                int quantity = resultSet.getInt("quantity");
                cart.addItem(productId, quantity); // Add items to the cart
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL exceptions
        }
        return cart; // Return the cart with products
    }

    public void clearCart(int userId) {
        String query = "DELETE FROM carts WHERE user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL exceptions
        }
    }
    public Cart getCartItem(int productId, int userId) {
        Cart cart = new Cart(userId); // Create a new Cart instance for the user
        String query = "SELECT quantity FROM carts WHERE product_id = ? AND user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, productId);
            preparedStatement.setInt(2, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int quantity = resultSet.getInt("quantity");
                cart.addItem(productId, quantity); // Add the product with its quantity to the cart
                return cart; // Return the cart with the specific item
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL exceptions
        }
        return null; // Return null if the item is not found
    }

    

    public boolean removeItem(int productId, int userId) {
        String queryGet = "SELECT quantity FROM carts WHERE product_id = ? AND user_id = ?";
        String queryUpdate = "UPDATE carts SET quantity = ? WHERE product_id = ? AND user_id = ?";
        String queryDelete = "DELETE FROM carts WHERE product_id = ? AND user_id = ?";

        try (Connection connection = DatabaseConnection.getConnection(); 
             PreparedStatement pstmtGet = connection.prepareStatement(queryGet);
             PreparedStatement pstmtUpdate = connection.prepareStatement(queryUpdate);
             PreparedStatement pstmtDelete = connection.prepareStatement(queryDelete)) {
             
            // Get the current quantity
            pstmtGet.setInt(1, productId);
            pstmtGet.setInt(2, userId);
            ResultSet rs = pstmtGet.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");
                if (currentQuantity > 1) {
                    // Decrease the quantity
                    pstmtUpdate.setInt(1, currentQuantity - 1);
                    pstmtUpdate.setInt(2, productId);
                    pstmtUpdate.setInt(3, userId);
                    pstmtUpdate.executeUpdate();
                    return true; // Item quantity decreased
                } else {
                    // Remove the item if the quantity is 1
                    pstmtDelete.setInt(1, productId);
                    pstmtDelete.setInt(2, userId);
                    pstmtDelete.executeUpdate();
                    return true; // Item removed
                }
            }
            return false; // Item not found in cart
        } catch (SQLException e) {
            e.printStackTrace(); // Log SQL exceptions
            return false; // Indicate failure
        }
    }
}
