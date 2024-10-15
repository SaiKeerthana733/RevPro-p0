<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
    <title>Reviews for Product <%= request.getAttribute("productId") %></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #6dd5fa, #2980b9); /* Gradient background */
            color: #333;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: #fff;
            font-size: 36px;
            margin-bottom: 40px;
        }

        h2 {
            color: #f39c12;
            font-size: 28px;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background-color: #fff;
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        ul li strong {
            color: #3498db;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            max-width: 500px;
            margin: 0 auto;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            color: #2c3e50;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }

        hr {
            border: 0;
            border-top: 1px solid #e0e0e0;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <h1>Reviews for Product <%= request.getAttribute("productId") %></h1>

    <!-- Display Existing Reviews -->
    <ul>
        <c:forEach var="review" items="${reviews}">
            <li>
                <strong>User ID:</strong> ${review.userId} <br>
                <strong>Rating:</strong> ${review.rating} <br>
                <strong>Comment:</strong> ${review.comment} <br>
                <hr>
            </li>
        </c:forEach>
    </ul>

    <!-- Add Review Form -->
    <h2>Add Your Review</h2>
    <form action="AddReviewServlet" method="post">
        <input type="hidden" name="productId" value="<%= request.getAttribute("productId") %>">
        
        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId" required><br>

        <label for="rating">Rating:</label>
        <input type="number" id="rating" name="rating" min="1" max="5" required><br>

        <label for="comment">Comment:</label>
        <textarea id="comment" name="comment" required></textarea><br>

        <button type="submit">Submit Review</button>
    </form>
</body>
</html>
