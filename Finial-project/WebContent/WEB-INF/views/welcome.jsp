<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ include file="styles.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fresh2Eat</title>
<link href="css/style.css" rel="stylesheet">
</head>

<body class='customer-body-img'>
	<div class='welcomeDiv'>
		<nav class="navbar navbar-light bg-light navDiv">
			<span class="navbar-brand mb-0 h1 text-success">Fresh2Eat</span> 
			<span class='NavEnd col-2 d-flex'>
				<h5>
					Welcome....<span>${formBeanObject.getName()}</span>
				</h5>
			</span>
		</nav>
		<div class='container mt-4'>
			<spring:form commandName="CustomerBean" method="post"
				action="DisplayWelcome">
				<div class='form-group row'>
					<div class='form-group row'>
						<label class='col-sm-2 col-form-label h2 text-white'>CustomerName </label>
						<spring:input type="text"
							class="form-control uNameInput col-sm-10" path="CustomerName"
							placeholder="Enter CustomerName" required='' />
					</div>
					<br>
					<div class='form-group row'
						style='display: flex; align-items: baseline;'>
						<label class='col-sm-2 col-form-label h2 text-white'>CustomerMobile</label>
						<spring:input type="mobile"
							class="form-control uPassInput col-sm-10" path="CustomerMobile"
							placeholder="Enter CustomerMobile" required='' />
					</div>

					<input class='btn btn-Warning' type="submit" value="Submit">
				</div>
			</spring:form>
		</div>



	</div>

</body>
</html>