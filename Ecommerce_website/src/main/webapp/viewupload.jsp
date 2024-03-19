<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="view.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center items horizontally */
        }

        .pdt-card {
            width: calc(25% - 20px); /* Set the width of each card (25% of the container width minus margins) */
            margin: 10px;
            border: 2px solid grey;
            padding: 10px;
            display: inline-block;
            vertical-align: top;
        }

        /* Other styles remain unchanged */
        .pdt-img {
            width: 100%; /* Set the width of the image to fill the card */
            height: auto; /* Let the browser calculate the height to maintain aspect ratio */
            overflow: hidden; /* Hide any overflowing content */
        }

        .pdt-img img {
            width: 100%; /* Ensure the image fills the container */
            height: 100%; /* Ensure the image fills the container */
            object-fit: cover; /* Scale the image while preserving aspect ratio */
        }

        .price {
            font-size: 24px;
        }

        .price::before {
            content: "Rs.";
        }

        .name {
            font-size: 22px;
            font-weight: bold;
            color: black;
        }

        .detail {
            overflow: hidden; /* Hide overflow */
            max-height: 60px; /* Set the max height of the detail */
            transition: max-height 0.3s ease; /* Add smooth transition */
        }

        .read-more {
            display: block;
            cursor: pointer;
            color: blue;
        }

        .logout-link {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #ff3333; /* Changed logout link color */
            color: white; /* Changed text color to white */
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <% 
        List<Product> products = (List<Product>) request.getAttribute("products");
        for (Product product : products) {
    %>
    <div class="pdt-card">
        <div class="name"><%= product.getName() %></div>
        <div class="code"><%= product.getCode() %></div>
        <div class="pdt-img"><img src="<%= product.getImgPath() %>"></div>
        <div class="detail">
            <%= product.getDetail() %> <!-- Display initial details -->
        </div>
        <div class="read-more" onclick="toggleDetail(this)">Read More</div>
        <div class="price"><%= product.getPrice() %></div>
        <div class="text-center"><button class="btn btn-warning">Add to Cart</button></div>
        <br>
    </div>
    <% } %>
</div>

<div class="logout-link" onclick="window.location.href='LogoutServlet'">Logout</div>

<script>
    function toggleDetail(button) {
        var detail = button.previousElementSibling; // Get the detail element
        if (detail.style.maxHeight) {
            // If the detail is currently expanded, collapse it
            detail.style.maxHeight = null;
            button.innerHTML = 'Read More';
        } else {
            // If the detail is currently collapsed, expand it
            detail.style.maxHeight = detail.scrollHeight + 'px';
            button.innerHTML = 'Read Less';
        }
    }
</script>
</body>
</html>

