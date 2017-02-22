<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link xmlns:sec="http://www.springframework.org/security/tags">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script><html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All products</title>
</head>
<body>
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
        <li><a href="viewproducts">EditProduct</a></li>                        
      </ul>
    </li>
    <li><a class="dropdown-toggle" data-toggle="dropdown">Manage Suppliers<span class="caret"></span></a>
      <ul class="dropdown-menu">
        
        <li><a href="AddSupplier">AddSupplier</a></li>
        <li><a href="viewsuppliers">ViewSuppliers</a></li>
        <li><a href="viewsuppliers">EditSupplier</a></li>                        
      </ul></li>
     
  </ul>
</div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    <li><a href="contact"><span class="glyphicon glyphicon-phone"></span>Contact Us</a></li>
    </ul>
  </div>
</nav>
<h2>View Products</h2>
<div class="container">
<div ng-app="myApp" ng-controller="customersCtrl">
<input type="text" class="form-control" ng-model="searchBy.Name"/>
<table class="table table-hover table-bordered">
  <tr>
       <th>Product Image</th>
       <th>Product Id</th>
       <th>Product Name</th>
       <th>Product Price</th>
       <th>Product Description</th>
       <th>Action</th>
  </tr>
  <tr ng-repeat="x in names | filter:searchBy">
    <td><img src='<x:url value="/resources/images/{{x.image}}"/>'style="width:200;height:200;"/> </td>
    <td>{{x.Id}}</td>
    <td>{{x.Name}}</td>
    <td>{{x.Price}}</td>
    <td>{{x.Description}}</td>
    <td>    
    <a href="${pageContext.servletContext.contextPath}/viewproduct?id={{x.Id}}"><span class="glyphicon glyphicon-info-sign"></span></a>
     <a href="${pageContext.servletContext.contextPath}/cartview?id={{x.Id}}"><span class="glyphicon glyphicon-shopping-cart"></span></a>
    
	<sec:authorize access="hasRole('ROLE_ADMIN')">
   <a href="${pageContext.servletContext.contextPath}/editproduct?id={{x.Id}}" class="btn btn-primary"><span>Edit</span></a>
	<a href="${pageContext.servletContext.contextPath}/deleteproduct?id={{x.Id}}" class="btn btn-danger"><span>Delete</span></a>
   </sec:authorize>
   </td>  
  </tr>
</table>
<a href="addproduct" class="btn btn-info">Add Product</a>
<script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
    $http.get("list")
    .then(function (response) {$scope.names = response.data;});
});
</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>