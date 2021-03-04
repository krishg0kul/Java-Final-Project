<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="styles.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fresh2Eat</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body class='login-body-img'>
	<div class='loginDiv'>
		<nav class="navbar navbar-light bg-light navDiv">
			<span class="navbar-brand mb-0 h1 text-success">Fresh2Eat</span>
		</nav>
		<div class='jumbotron'>
			<h2 style='color: brown; text-transform: capitalize;'> <c:out value="${process}"></c:out>  </h2>
			<spring:form class='py-2' commandName="formBeanObject" method="post"
				action="/finalproj/welcome">
				<div class='form-group row'>
					<label for="Name" class='col-sm-2 col-form-label h2'>User</label>
					<input type="text" name="Name" id="Name" class="form-control uNameInput col-sm-10" required placeholder="Enter username" />
					<%-- <spring:input type="name"
						class="form-control uNameInput col-sm-10" path="Name"
						placeholder="Enter username" required='' /> --%>
				</div>
				<br>
				<div class='form-group row'
					style='display: flex; align-items: baseline;'>
					<label for="Password" class='col-sm-2 col-form-label h2'>Password</label>
					<%-- <spring:input type="password"
						class="form-control uPassInput col-sm-10" path="Password"
						placeholder="Enter password" required='' /> --%>
					<input type="password"
						class="form-control uPassInput col-sm-10" name="Password"
						placeholder="Enter password" required id="Password" />
				</div>
				<br>
				<input class='btn btn-success' type="submit" value="Submit" />
			</spring:form>
		</div>
	</div>
</body>
</html>