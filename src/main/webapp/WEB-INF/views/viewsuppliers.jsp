<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>View Suppliers</title>
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
	<h2>View Suppliers</h2>
	<div class="container">
		<div ng-app="myApp" ng-controller="customersCtrl">
			<input type="text" class="form-control" ng-model="searchBy.supname" />
			<table class="table table-striped table-hover">
				<tr>
					<th>Id</th>
					<th>Supplier Name</th>
					<th>Supplier Location</th>
					<th>Action</th>
				</tr>
				<tr ng-repeat="z in names | filter:searchBy">
					<td>{{z.supid}}</td>
					<td>{{z.supname}}</td>
					<td>{{z.suplocation}}</td>
					<td><a
						href="${pageContext.servletContext.contextPath}/ViewSupplier?id={{z.id}}" class="btn btn-info"><span>View</span></a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a
								href="${pageContext.servletContext.contextPath}/editsupplier?id={{z.id}}" class="btn btn-primary"><span>Edit</span></a>
							<a
								href="${pageContext.servletContext.contextPath}/deletesupplier?id={{z.id}}" class="btn btn-danger"><span>Delete</span></a>
						</sec:authorize></td>
				</tr>
			</table>
			<a href="AddSupplier" class="btn btn-info">Add Supplier</a>


		</div>

		<script>
			var app = angular.module('myApp', []);
			app.controller('customersCtrl', function($scope, $http) {
				$http.get("listsup").then(function(response) 
						{
					$scope.names = response.data;
				});
			});
		</script>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
