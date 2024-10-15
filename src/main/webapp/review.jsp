<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews for Product <%= request.getAttribute("productId") %></title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #6dd5fa, #2980b9); /* Gradient background */
            padding: 20px;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: white;
            font-size: 36px;
            margin-bottom: 40px;
        }

        h2 {
            color: #f39c12;
            font-size: 28px;
            margin-top: 40px;
            text-align: center;
        }

        .review-item {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .review-item strong {
            color: #3498db;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            max-width: 600px;
            margin: 0 auto;
        }

        label {
            font-weight: bold;
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

        .review-list {
            max-width: 900px;
            margin: 0 auto;
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
    <div class="review-list">
        <c:forEach var="review" items="${reviews}">
            <div class="review-item">
                <strong>User ID:</strong> ${review.userId} <br>
                <strong>Rating:</strong> ${review.rating} <br>
                <strong>Comment:</strong> ${review.comment} <br>
                <hr>
            </div>
        </c:forEach>
    </div>

    <!-- Add Review Form -->
    <h2>Add Your Review</h2>
    <form action="AddReviewServlet" method="post">
        <input type="hidden" name="productId" value="<%= request.getAttribute("productId") %>">
        
        <div class="form-group">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="rating">Rating:</label>
            <input type="number" id="rating" name="rating" min="1" max="5" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="comment">Comment:</label>
            <textarea id="comment" name="comment" class="form-control" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Submit Review</button>
    </form>

    <!-- Bootstrap JS and dependencies (Optional if required for responsiveness or other features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
