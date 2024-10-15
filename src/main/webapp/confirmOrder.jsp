<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.revShop.models.Product" %>
<%@ page import="com.revShop.models.Cart" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Order</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+KnujsR+5+bkz2jL1j6C9M4rkR48PTu3FkeD1+rD2/iG47Y" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            padding: 20px;
            color: #333;
        }

        h1 {
            color: #3498db;
            text-align: center;
            font-size: 36px;
            margin-bottom: 30px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        th, td {
            padding: 16px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eaeaea;
        }

        .total-row {
            background-color: #f2f2f2;
        }

        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .link {
            display: inline-block;
            margin-top: 20px;
            color: #3498db;
            font-size: 18px;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 12px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h1>Confirm Your Order</h1>

    <%
        // Retrieve products in cart and cart object
        List<Product> productsInCart = (List<Product>) request.getAttribute("productsInCart");
        Cart cart = (Cart) request.getAttribute("cart"); // Ensure you set the Cart object in ConfirmOrderServlet
        double totalPrice = 0;

        // Check if cart is not null and productsInCart is not empty
        if (cart != null && productsInCart != null && !productsInCart.isEmpty()) {
    %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Product product : productsInCart) {
                    // Get quantity from cart items
                    int quantity = cart.getItems().get(product.getId());
                    double productTotalPrice = product.getPrice() * quantity;
                    totalPrice += productTotalPrice;
            %>
                    <tr>
                        <td><%= product.getName() %></td>
                        <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                        <td><%= quantity %></td>
                        <td>$<%= String.format("%.2f", productTotalPrice) %></td>
                    </tr>
            <%
                }
            %>
                <tr class="total-row">
                    <td colspan="3" style="text-align: right;"><strong>Total Price:</strong></td>
                    <td>$<%= String.format("%.2f", totalPrice) %></td>
                </tr>
            </tbody>
        </table>

        <form action="placeOrder" method="post">
            <input type="hidden" name="userId" value="<%= cart.getUserId() %>"> <!-- Use getUserId from Cart -->
            <button type="submit" class="btn btn-primary">Confirm Order</button>
        </form>

        <a href="viewCart.jsp" class="link">Edit Cart</a> <!-- Link to edit cart if necessary -->
    <%
        } else {
    %>
        <p>No products in the cart. Please add items to your cart before confirming an order.</p>
    <%
        }
    %>
    
    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-GLhlTQ8iRAB3lGx0i1z7x9ErdGhF9gC1n/xr59A1J9jzVfakFPskvXusvfa0b3Xf" crossorigin="anonymous"></script>
</body>
</html>
