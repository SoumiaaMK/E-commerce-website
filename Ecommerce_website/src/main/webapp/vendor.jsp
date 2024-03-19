<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ecommerce website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
        <div class="mb-4">
            <h3 class="text-center">Welcome Vendor, <%= name %></h3>
            <!-- Use JavaScript to redirect to ViewUploadedServlet -->
            <div class="text-center mb-3">
                <button class="btn btn-primary" onclick="window.location.href='ViewUploadedServlet?username=<%=name %>'">View Uploads</button>
            </div>
            <div class="text-center">
                <a href="LogoutServlet" class="btn btn-danger">Logout</a>
            </div>
        </div>
        <div class="d-flex justify-content-center align-items-center vh-100">
            <form action="UploadProductServlet?username=<%=name %>" method="post" enctype="multipart/form-data" class="w-50 bg-warning p-5">
                <input class="form-control mt-2" type="text" placeholder="Product Name" name="name">
                <input class="form-control mt-2" type="text" placeholder="Product Price" name="price">
                <textarea class="form-control mt-2" rows="5" placeholder="Product Details" name="detail"></textarea>
                <input class="form-control mt-2" type="text" placeholder="Product Code" name="code">
                <label class="ms-2 mt-2" for="category">Category</label>
                <select class="form-control" id="category" name="category">
                    <option value="electronics" >Electronics</option>
                    <option value="home applications">Home Applications</option>
                    <option value="fashion">Fashion</option>
                    <option value="books">Books</option>         
                </select>
                <label class="ms-2 mt-2" for="availability">Availability</label>
                <select class="form-control" id="availability" name="availability">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
                <input class="mt-2" type="file" id="pdt_img" name="pdt_img" accept=".jpg, .jpeg, .png">
                <div class="text-center mt-3">
                    <button class="form-control btn btn-success">Submit</button>
                </div>
            </form>
        </div>
        <% } else { %>
        <div class="text-center">
            <p class="text-danger">Login Failed</p>
            <a href="login.html" class="btn btn-primary">Try again</a>
        </div>
        <% } %>
    </div>
</body>
</html>
<% %> 
