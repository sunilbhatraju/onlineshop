<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Product Details</title>
</head>
<nav class="navbar navbar-inverse">
    <div class="navbar-header">
      <a class="navbar-brand" href="admin">Admin Home</a>
    </div>
    <div class="container">
  <ul class="nav nav-pills">
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown">Manage Products<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="addproduct">AddProduct</a></li>
        <li><a href="viewproducts">ViewProducts</a></li>
        <li><a href="editproduct">EditProduct</a></li>                        
      </ul>
    </li>
    <li><a class="dropdown-toggle" data-toggle="dropdown">Manage Suppliers<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="AddSupplier">AddSupplier</a></li>
        <li><a href="viewsuppliers">ViewSuppliers</a></li>
        <li><a href="editsupplier">EditSupplier</a></li>                        
      </ul></li>
  </ul>
</div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    <li><a href="contact"><span class="glyphicon glyphicon-phone"></span>Contact Us</a></li>
    </ul>
  </div>
</nav>
<h2>Supplier Details</h2>
      <div class="container">
            <table class="table table-bordered">
            <thead>
				<tr>
					<th>Id</th>
					<th>Supplier Name</th>
					<th>Supplier Location</th>
													
				</tr>
			</thead>
            <tr>
  			<td>${supplier.id}</td>
            <td>${supplier.supname}</td>
            <td>${supplier.suplocation}</td>       
            
            </tr>
            </table>
      </div>
      <jsp:include page="footer.jsp"></jsp:include>
   </body>
</html>
