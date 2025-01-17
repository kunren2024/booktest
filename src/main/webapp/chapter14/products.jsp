<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Selection</title>
</head>
<body>
    <h2>Select a Product</h2>
    <select name="products">
        <%= request.getAttribute("productOptions") %>
    </select>
</body>
</html>
