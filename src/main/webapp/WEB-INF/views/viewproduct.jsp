<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <a class="navbar-brand" href="admin">OnlineShop</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    <li><a href="contact"><span class="glyphicon glyphicon-phone"></span>Contact Us</a></li>
    </ul>
  </div>
</nav>
<h2>Product Details</h2>
      <div class="container">
            <table class="table table-hover table-bordered">
            <tr><td rowspan="5">
           
   <img src='<c:url value="/resources/images/${product.image}"/>'/>  </td></tr> 
  
  
            <tr><td>${product.id}</td></tr>
            <tr><td>${product.name}</td></tr>
            <tr><td>${product.price}</td></tr>
            <tr><td>${product.description}</td></tr>
            </table>
      </div>
  <jsp:include page="footer.jsp"></jsp:include>
      
   </body>
</html>
