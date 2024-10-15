<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>Error</h1>
 <c:if test="${not empty errorMessage}">
        <p>${errorMessage}</p> <!-- Display the specific error message -->
        <form action="${pageContext.request.contextPath}/productdetails" method="get">
            <label for="productId">Enter Product ID:</label>
            <input type="text" name="productId" id="productId" required>
            <button type="submit">View Product Details</button>
        </form>
    </c:if>
    <a href="buyerDashboard.jsp">Go back</a>
</body>
</html>
