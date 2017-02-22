<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Add a product</title>
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
<h2>Add a Product</h2>
    <div class="container" ng-app="imgApp" ng-controller="imgCtrl">
    <c:url var="addproduct" value="addproduct"></c:url>
   <form:form commandName="Product" method="post" action="storeproduct" enctype="multipart/form-data">
       <table class="table table-bordered" >
       
                  
           <tr><td><form:label path="Name">Product Name :</form:label></td>
               <td><form:input path="Name"/>
               <font color="red"><form:errors path="Name"></form:errors></font></td>
           </tr>
           <tr><td><form:label path="Description">Product Description :</form:label></td>
               <td><form:input path="Description"/>
               <font color="red"><form:errors path="Description"></form:errors></font></td>
           </tr>           
           <tr><td><form:label path="Price">Product Price:</form:label></td>
               <td><form:input path="Price"/>
               <font color="red"><form:errors path="Price"></form:errors></font></td>
           </tr>       
           <tr><td><form:label path="quantity">Product Quantity :</form:label></td>
               <td><form:input path="quantity"/>
               <font color="red"><form:errors path="Quantity"></form:errors></font></td>
           </tr>           
           <tr><td><form:label path="img">Product Image:</form:label></td>
               <td><form:input path="img" type="file"/>
               <font color="red"><form:errors path="img"></form:errors></font></td>  
           </tr>
           <tr><td><form:label path="supplier">Supplier Name:</form:label></td>
               <td><select name="Supplier.supid">
   				 <option value="">---Select---</option>
   				 <c:forEach var="Supplier" items="${suppliers}">
   				 <option value="${Supplier.supid}">${Supplier.supname}</option>
    		</c:forEach>
    		</select></td></tr>
             
       </table>
       <td><input type="submit" value="Add Product" class="btn-success"/></td>
   </form:form> 
   </div>
   	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>