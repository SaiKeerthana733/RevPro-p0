<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> 
    <style>
        body { 
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%); /* Gradient background */
            font-family: 'Poppins', sans-serif; /* Modern font */
            color: #333; 
            margin: 0;
            padding: 0;
        }
        
        /* Styling the header section */
        .header {
            background-color: #002147;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header img {
            max-width: 120px;
            display: block;
            margin: 0 auto 10px;
            border-radius: 50%;
        }

        .header h1 {
            color: #fff;
            margin: 10px 0;
            font-size: 28px;
            font-weight: 600;
        }

        /* Creating navigation bar */
        .nav-tabs {
            display: flex;
            justify-content: space-around;
            background-color: #005792;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .nav-tabs a {
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            background-color: #007bb5;
            border-radius: 25px;
            transition: background-color 0.3s, color 0.3s, box-shadow 0.3s;
        }

        .nav-tabs a:hover {
            background-color: #005078;
            color: #fff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        /* Active tab styling */
        .nav-tabs a.active {
            background-color: #002147;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        /* Main container */
        .container { 
            padding: 40px; 
            max-width: 800px; 
            margin: 50px auto; 
            background-color: rgba(255, 255, 255, 0.95); 
            border-radius: 15px; 
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15); 
            border: 3px solid #005792; /* Deep blue border */
        }

        /* Content styling */
        .container p {
            font-size: 20px; /* Larger font size */
            line-height: 1.8; /* Improved line height */
            color: #333; /* Darker text color */
            background-color: #e0f7fa; /* Light teal background for the paragraph */
            padding: 20px; 
            border-radius: 10px; /* Smooth rounded corners */
            border-left: 6px solid #007bb5; /* Left border for emphasis */
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow inside */
        }

        /* Responsive styling */
        @media (max-width: 600px) {
            .nav-tabs a {
                font-size: 14px;
                padding: 10px;
            }

            .header h1 {
                font-size: 22px;
            }

            .container {
                padding: 25px;
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
    <a href="${pageContext.request.contextPath}/createProduct" aria-label="Add New Product"><i class="fas fa-plus"></i> Product Management</a>
    <a href="${pageContext.request.contextPath}/orders" aria-label="View Orders"><i class="fas fa-receipt"></i> View Orders</a>
    <a href="${pageContext.request.contextPath}/sellerViewsReviews.jsp" aria-label="View Reviews"><i class="fas fa-star"></i> View Reviews</a>
    <a href="logout.jsp" aria-label="Logout" onclick="return confirm('Are you sure you want to logout?');"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<!-- Content Section -->
<div class="container">
    <p>Select an option from the tabs above to manage your products and view information.</p>
</div>

</body>
</html>
