<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
       body {
    background-image: url('images/login.jpg'); 
    font-family: Arial, sans-serif; 
    background-color: #f4f4f4; 
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    margin: 0; /* Remove default margin */
    padding: 50px 0; /* Top and bottom padding */
    height: 100vh; /* Full viewport height */
}

form {
    width: 90%; /* Adjusted width for better responsiveness */
    max-width: 400px; 
    margin: auto; 
    background: rgba(255, 255, 255, 0.9); /* Semi-transparent white for vibrancy */
    padding: 30px; 
    border-radius: 10px; 
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); /* Increased shadow for depth */
}

input, button {
    display: block; 
    width: calc(100% - 20px); /* Adjust for padding */
    padding: 12px; 
    margin-bottom: 15px; 
    border-radius: 5px; /* Rounded corners */
    border: 1px solid #ccc; /* Border for inputs */
    transition: border 0.3s; /* Transition for border color */
}

input:focus {
    border: 1px solid #4CAF50; /* Highlight border on focus */
}

button {
    background-color: #4CAF50; 
    color: white; 
    border: none; 
    cursor: pointer; 
    font-weight: bold; /* Bold font for button */
    transition: background-color 0.3s; /* Smooth transition for hover */
}

button:hover {
    background-color: #45a049; 
}

.error-message {
    color: red; 
    font-weight: bold; /* Bold error messages for emphasis */
}

/* Additional styling for responsiveness */
@media (max-width: 600px) {
    form {
        padding: 20px; /* Reduced padding for smaller screens */
    }

    input, button {
        padding: 10px; /* Reduced padding for inputs and buttons */
    }
}


    </style>
</head>
<body>
    <h1 style="font-size: 36px; font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Login</h1>




    <!-- Display error message if present -->
    <c:if test="${not empty errorMessage}">
        <p class="error-message">${errorMessage}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>
    </form>

    <p style="font-size: 18px; font-family: 'Arial', sans-serif; color: #333; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);">
    New user? <a href="register.jsp" style="color: #4CAF50; text-decoration: none; font-weight: bold;">Register here</a></p>
</body>
</html>
