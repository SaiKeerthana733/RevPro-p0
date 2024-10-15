<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>RevShop - Welcome</title>
    <meta name="description" content="RevShop, your one-stop e-commerce platform for buyers and sellers">
    <meta name="keywords" content="e-commerce, online shopping, buy, sell, RevShop">
    <meta name="author" content="RevShop Team">
    <style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    body { 
        background-image: url('images/index.jpg'); 
        background-size: cover; 
        background-repeat: no-repeat; 
        background-position: center;
        font-family: 'Arial', sans-serif; 
        text-align: center; 
        display: flex;
        justify-content: flex-start; 
        align-items: center; 
        padding-left: 2in; 
    }

    .container { 
        padding: 50px; 
        background-color: rgba(255, 255, 255, 0.8); /* Optional: add a background for better readability */
        border-radius: 10px; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
    }

    /* Button Styles */
    .button {
        padding: 10px 20px;
        background-color: #4CAF50; 
        color: #ffffff;
        border: 2px solid #FF5733;
        border-radius: 5px;
        cursor: pointer;
        font-family: 'Arial', sans-serif;
        font-size: 1.2em;
        text-align: center;
        width: 200px;
        margin: 10px 0;
    }

    .button:hover {
        background-color: #45a049; 
        color: #ffffff;
        border-color: #FFC300; 
    }

    .vibrant-header {
        font-family: 'Arial', sans-serif;
        font-size: 2em;
        font-weight: bold;
        color: #FF5733;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); 
        text-align: center;
        margin: 20px 0;
    }

    /* Form Style */
    form {
        background: rgba(255, 255, 255, 0.5); /* Transparent white background */
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 400px;
        margin: 0 auto;
        color: #333;
    }

    /* Input fields */
    input[type="text"], input[type="password"], input[type="email"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
        color: #333;
    }

    /* Focused input fields */
    input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
        border-color: #FF5733;
        outline: none;
    }

    /* Form Heading */
    .form-heading {
        color: #FF5733;
        font-size: 1.5em;
        margin-bottom: 20px;
    }

    /* Form Button */
    .form-button {
        background-color: #FF5733;
        color: #fff;
        border: none;
        padding: 12px;
        border-radius: 5px;
        width: 100%;
        cursor: pointer;
    }

    .form-button:hover {
        background-color: #FF4500;
    }

    .form-link {
        color: #FF5733;
        text-decoration: none;
    }

    .form-link:hover {
        text-decoration: underline;
    }
    
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to RevShop</h1>
        <c:choose>
            <c:when test="${not empty sessionScope.loggedInUser}">
                <h2>Welcome back, ${sessionScope.loggedInUser}!</h2>
                <p>You are logged in as <strong>${sessionScope.userRole}</strong></p>

                <c:choose>
                    <c:when test="${sessionScope.userRole == 'buyer'}">
                        <button onclick="window.location.href='productList.jsp'" class="button">View Products</button>
                        <button onclick="window.location.href='cart.jsp'" class="button">View Cart</button>
                        <button onclick="window.location.href='orderHistory.jsp'" class="button">Order History</button>
                    </c:when>
                    <c:when test="${sessionScope.userRole == 'seller'}">
                        <button onclick="window.location.href='createProduct.jsp'" class="button">Add Product</button>
                        <button onclick="window.location.href='sellerDashboard.jsp'" class="button">Manage Inventory</button>
                        <button onclick="window.location.href='orders.jsp'" class="button">View Orders</button>
                    </c:when>
                </c:choose>
                <button onclick="window.location.href='logout.jsp'" class="button">Logout</button>
            </c:when>
            <c:otherwise>
                <h2 class="vibrant-header">Please log in or register:</h2>

                <form action="login.jsp" method="POST">
                    <div class="form-heading">Login</div>
                    <input type="email" name="email" placeholder="Enter your email" required>
                    <input type="password" name="password" placeholder="Enter your password" required>
                    <button type="submit" class="form-button">Login</button>
                    <p>Don't have an account? <a href="register.jsp" class="form-link">Register here</a></p>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
