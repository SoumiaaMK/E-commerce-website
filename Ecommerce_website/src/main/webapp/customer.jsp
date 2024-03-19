<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ecommerce website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <%
        String name = null;
        boolean loginStatus = false;
        if (request.getAttribute("urname") != null) {
            name = (String) request.getAttribute("urname");
        }
        if (request.getAttribute("login_status") != null) {
            loginStatus = (boolean) request.getAttribute("login_status");
        }
        // Checking login status
        if (loginStatus) {
        %>
        <div class="row justify-content-center">
            <div class="col">
                <div class="text-center mb-3">Welcome Customer, <%= name %></div>
                <a href="ViewProductServlet" class="btn btn-primary me-2">View Product</a>
                <a href="LogoutServlet" class="btn btn-danger">Logout</a>
            </div>
        </div>
        <% } else { %>
        <div class="row justify-content-center">
            <div class="col">
                <div class="text-center mb-3">Login Failed</div>
                <a href="login.html" class="btn btn-primary">Try again</a>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
<% %>
