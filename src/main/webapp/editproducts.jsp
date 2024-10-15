<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.revShop.models.Product" %>
<%
    Product product = (Product) request.getAttribute("product"); // Retrieve product from request
    String errorMessage = (String) request.getAttribute("errorMessage"); // Retrieve error message if any
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Solid background color */
            color: #333; /* Text color */
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #007BFF; /* Make the heading blue */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Subtle shadow for the heading */
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent white */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="number"], textarea {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        input[type="submit"] {
            background-color: #007BFF; /* Button color */
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 100%; /* Full width button */
        }
        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .error-message {
            color: red;
            margin-bottom: 20px;
            text-align: center;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
            text-align: center;
        }
        a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <h1>Edit Product</h1>

    <div class="container">
        <!-- Display error message if exists -->
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>
        
        <!-- Ensure product is not null before displaying the form -->
        <% if (product != null) { %>
            <form action="editproducts" method="post">
                <input type="hidden" name="id" value="<%= product.getId() %>"> <!-- Hidden field for product ID -->
                
                <label for="name">Product Name:</label>
                <input type="text" name="name" value="<%= product.getName() %>" required>

                <label for="price">Price:</label>
                <input type="number" name="price" value="<%= product.getPrice() %>" step="0.01" required>

                <label for="description">Description:</label>
                <textarea name="description" required><%= product.getDescription() %></textarea>

                <input type="submit" value="Update Product">
            </form>
        <% } else { %>
            <div class="error-message">Product not found.</div>
        <% } %>

        <a href="productList">Cancel</a> <!-- Link to return to product list -->
    </div>
</body>
</html>
