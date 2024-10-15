<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Details</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h1 {
            color: #3498db;
            text-align: center;
            font-size: 36px;
            margin-bottom: 30px;
            font-weight: 500;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
        }

        th, td {
            padding: 16px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #3498db;
            color: white;
            font-size: 18px;
            font-weight: bold;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #eaeaea;
        }

        table thead {
            border-bottom: 3px solid #3498db;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }
            th, td {
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <h1>Order Details</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Order Date</th>
            <th>Total Amount</th>
        </tr>
        <c:forEach var="order" items="${orderList}">
            <tr>
                <td>${order.id}</td>
                <td>${order.userId}</td>
                <td>${order.orderDate}</td>
                <td>${order.totalAmount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
