<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            background-image: linear-gradient(to right, #6dd5ed, #2193b0);
            font-family: 'Poppins', sans-serif;
            color: #2d3436;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #ffffff;
            font-size: 36px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            letter-spacing: 1.5px;
        }

        /* Compact Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(160px, 1fr)); /* Smaller grid for compact cards */
            gap: 20px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        /* Compact Product Card */
        .product-card {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
            padding: 10px; /* Reduced padding for smaller size */
            text-align: center;
            font-size: 12px; /* Smaller font size */
            max-width: 160px; /* Set max width for compact appearance */
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        /* Decrease image size */
        .product-card img {
            width: 100%;
            object-fit: cover;
            height: 140px; /* Reduced height for images */
            border-radius: 10px 10px 0 0;
        }

        .product-card h3 {
            font-size: 14px; /* Smaller product title */
            color: #0984e3;
            margin: 8px 0;
        }

        .product-card p {
            font-size: 12px;
            color: #636e72;
            line-height: 1.4;
            margin-bottom: 6px;
        }

        .product-card .price {
            font-size: 14px;
            color: #00b894;
            font-weight: bold;
            margin: 10px 0;
        }

        .product-card a {
            display: inline-block;
            text-decoration: none;
            color: #ffffff;
            background-color: #0984e3;
            padding: 6px 12px; /* Smaller button size */
            border-radius: 5px;
            font-size: 12px;
            transition: background-color 0.3s ease;
        }

        .product-card a:hover {
            background-color: #74b9ff;
        }

        .add-product {
            display: inline-block;
            margin: 10px;
            padding: 8px 20px;
            background-color: #d63031;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .add-product:hover {
            background-color: #e17055;
        }

        .error-message {
            color: #e74c3c;
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .search-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-input {
            padding: 8px;
            width: 250px;
            font-size: 14px;
            border: 2px solid #0984e3;
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .search-button {
            padding: 8px 16px;
            background-color: #0984e3;
            color: white;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            margin-left: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-input:focus {
            border-color: #74b9ff;
        }

        .search-button:hover {
            background-color: #74b9ff;
        }

        .user-role-badge {
            display: inline-block;
            padding: 8px 15px;
            font-size: 14px;
            color: #ffffff;
            background-color: #2d3436;
            border-radius: 30px;
            font-weight: bold;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: center;
        }

        .no-products {
            text-align: center;
            font-size: 16px;
            color: #b2bec3;
        }
    </style>
</head>
<body>
    <h1>Product List</h1>
    <div class="search-container">
        <form method="get" action="${pageContext.request.contextPath}/productList">
            <input type="text" name="search" placeholder="Search for products..." class="search-input" value="${param.search}" />
            <button type="submit" class="search-button">Search</button>
        </form>
    </div>

    <p class="user-role-badge">
        User Role: ${sessionScope.userRole}
    </p>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            <p>${errorMessage}</p>
        </div>
    </c:if>

    <c:if test="${sessionScope.userRole eq 'seller'}">
        <a href="${pageContext.request.contextPath}/createProduct" class="add-product">Add New Product</a>
    </c:if>

    <div class="product-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="Image of ${product.name}" />

                <h3>${product.name}</h3>
                <p>${product.description}</p>
                <p class="price">$${product.price}</p>
                <a href="${pageContext.request.contextPath}/productdetails?productId=${product.id}">View</a>

                <c:if test="${sessionScope.userRole eq 'seller'}">
                    <a href="${pageContext.request.contextPath}/editproducts?id=${product.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/deleteProduct?id=${product.id}"
                       onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </c:if>
            </div>
        </c:forEach>

        <c:if test="${empty products}">
            <p class="no-products">No products available.</p>
        </c:if>
    </div>
</body>
</html>
