<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Buyer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body { 
            background-color: #f5f5f5; /* Soft gray background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            color: #333; 
            margin: 0;
            padding: 0;
        }
        
        /* Styling the header section */
        .header {
            background-color: #4CAF50; /* Green background */
            padding: 20px;
            text-align: center;
            border-bottom: 5px solid #388E3C; /* Darker green bottom border */
        }

        .header img {
            max-width: 80px;
            display: block;
            margin: 0 auto 10px;
        }

        .header h1 {
            color: #fff;
            margin: 10px 0;
            font-size: 24px;
            font-weight: 600;
        }

        /* Creating navigation bar */
        .nav-tabs {
            display: flex;
            justify-content: space-around;
            background-color: #00796B; /* Teal background */
            padding: 15px 0;
            border-radius: 8px;
        }

        .nav-tabs a {
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .nav-tabs a:hover {
            background-color: #004D40;
            color: #b2dfdb; /* Light teal text on hover */
        }

        /* Active tab styling */
        .nav-tabs a.active {
            background-color: #004D40;
            border-radius: 5px;
        }

        /* Main container */
        .container { 
            padding: 30px; 
            max-width: 900px; 
            margin: 40px auto; 
            background-color: #fff; 
            border-radius: 8px; 
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            border: 2px solid #4CAF50; /* Green border */
        }

        /* Content styling */
        .container p {
            font-size: 18px; /* Larger font size */
            line-height: 1.8; /* Improved line height for readability */
            color: #555; /* Dark gray text */
            background-color: #e0f7fa; /* Light cyan background */
            padding: 25px; /* Padding inside the paragraph */
            border-radius: 5px; /* Rounded corners */
            border-left: 6px solid #00796B; /* Teal left border for accent */
        }

        /* Responsive styling */
        @media (max-width: 600px) {
            .nav-tabs a {
                font-size: 14px;
                padding: 10px;
            }

            .header h1 {
                font-size: 20px;
            }

            .container {
                padding: 15px;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>

<!-- Header Section -->
<div class="header">
    <img src="images/imp.jpeg" alt="Your Logo"/>
    <h1>Welcome, ${sessionScope.username}</h1> <!-- Displaying the user's email -->
</div>

<!-- Navigation Tabs -->
<div class="nav-tabs">
    <a href="${pageContext.request.contextPath}/profile" aria-label="View Profile"><i class="fas fa-user"></i> Profile</a>
    <a href="${pageContext.request.contextPath}/productList" aria-label="View Products"><i class="fas fa-info-circle"></i> View Products</a>
    <a href="${pageContext.request.contextPath}/productdetails?productId=${product.id}" aria-label="View Product Details"><i class="fas fa-info-circle"></i> Product Details</a>
    <a href="${pageContext.request.contextPath}/cart" aria-label="View Cart"><i class="fas fa-shopping-cart"></i> View Cart</a>
    <a href="${pageContext.request.contextPath}/checkout" aria-label="Checkout"><i class="fas fa-credit-card"></i> Checkout</a>
    <a href="${pageContext.request.contextPath}/history" aria-label="View Order History"><i class="fas fa-history"></i> Order History</a>
    <a href="logout.jsp" aria-label="Logout" onclick="return confirm('Are you sure you want to logout?');"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<!-- Content Section -->
<div class="container">
    <p>Select an option from the tabs above to get started.</p>
</div>

</body>
</html>
