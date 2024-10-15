<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Product</title>
    <style>
        body {
            background-image: linear-gradient(to bottom, #2193b0, #6dd5ed); /* Gradient background */
            color: #f5f6fa; /* Text color */
            font-family: 'Poppins', sans-serif; /* Custom font style */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 2.5em;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            letter-spacing: 1.2px;
        }

        form {
            background-color: rgba(0, 0, 0, 0.8); /* Dark semi-transparent background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 400px;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease;
        }

        form:hover {
            transform: scale(1.03);
        }

        label {
            font-weight: bold;
            margin: 10px 0 5px;
            font-size: 1.1em;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 15px;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus,
        input[type="file"]:focus {
            border-color: #00cec9;
            outline: none;
        }

        button {
            background-color: #00b894;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s;
            text-transform: uppercase;
        }

        button:hover {
            background-color: #00a482;
        }

        .error-message {
            color: #e74c3c;
            margin: 10px 0;
            text-align: center;
            font-weight: bold;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #f5f6fa;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: bold;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #00cec9;
        }

        textarea {
            resize: none; /* Disable resizing */
        }
    </style>
</head>
<body>
    <h1>Create Product</h1>

    <c:if test="${not empty errorMessage}">
        <p class="error-message">${errorMessage}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/createProduct" method="post" enctype="multipart/form-data">
        <div>
            <label for="name">Product Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter product name" required>
        </div>
        <div>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" placeholder="Enter price" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" placeholder="Enter product description" required></textarea>
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required>
        </div>
        <div>
            <label for="image">Product Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required>
        </div>
        <div>
            <button type="submit">Add Product</button>
        </div>
    </form>

    <a class="back-link" href="productList">Back to Product List</a>
</body>
</html>
