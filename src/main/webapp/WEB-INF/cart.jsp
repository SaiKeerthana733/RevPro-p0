<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('images/carrr.jpg'); /* Add your background image here */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h1, h2 {
            color: #ffffff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            transition: color 0.3s ease-in-out;
        }

        h1:hover, h2:hover {
            color: #ffd700;
        }

        table {
            width: 90%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }

        table:hover {
            transform: scale(1.02);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #4CAF50;
            color: white;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        td {
            background-color: rgba(255, 255, 255, 0.8);
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        #total {
            font-size: 24px;
            margin-top: 20px;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            transition: color 0.3s ease-in-out;
        }

        #total:hover {
            color: #ff4500;
        }

        form {
            text-align: center;
            margin-top: 30px;
        }

        input[type="text"], input[type="number"] {
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #4CAF50;
        }

        input[type="submit"], button {
            padding: 10px 20px;
            margin-top: 10px;
        }

        .alert {
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
            font-size: 18px;
        }

        .alert-success {
            background-color: #dff0d8;
            color: #3c763d;
        }

        .alert-danger {
            background-color: #f2dede;
            color: #a94442;
        }
    </style>
</head>
<body>
    <h1>Your Shopping Cart</h1>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <c:choose>
        <c:when test="${empty cart.getItems()}">
            <p style="text-align: center; font-size: 18px; color: white;">Cart</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Remove</th>
                </tr>
                <c:set var="totalPrice" value="0" />
                <c:forEach var="entry" items="${cart.getItems().entrySet()}">
                    <tr>
                        <td>${availableProducts[entry.key].productName}</td>
                        <td>$${availableProducts[entry.key].price}</td>
                        <td>${entry.value}</td>
                        <td>$${availableProducts[entry.key].price * entry.value}</td>
                        <td>
                            <form action="removeFromCart" method="post">
                                <input type="hidden" name="productId" value="${entry.key}">
                                <button type="submit">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <c:set var="totalPrice" value="${totalPrice + (availableProducts[entry.key].price * entry.value)}" />
                </c:forEach>
            </table>
            <p id="total">Total Price: $<c:out value="${totalPrice}" /></p>
        </c:otherwise>
    </c:choose>

    <h2>Add Product to Cart</h2>
    <form action="cart" method="post" style="text-align: center; margin-left: -2in;">
        <label for="productId">Product ID:</label>
        <input type="text" id="productId" name="productId" required>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required min="1" value="1">
        <input type="hidden" name="action" value="add">
        <button type="submit">Add to Cart</button>
    </form>
</body>
</html>
