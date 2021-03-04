<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="styles.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fresh2Eat</title>
<link href="css/style.css" rel="stylesheet">
</head>

<body class='display-welcome-body'>
	<div class='DWDiv'>
		<nav class="navbar navbar-light bg-light navDiv">
			<span class="navbar-brand mb-0 h1 text-success">Fresh2Eat</span> <span
				class='NavEnd col-2 d-flex'>
				<h6>
					Welcome....<span> <c:out value="${Username}" /></span>
				</h6> <span> <%@ include file="logout.jsp"%>
			</span>
			</span>
		</nav>

	</div>
	<div >
		<ul class="list-group list-group-flush ">
			<li class="list-group-item list-group-item-action active bg-color-transprant h4">Check
				your Details :-</li>
			<li class="list-group-item bg-color-transprant h5 ML-r4">User Name <span class='BL-1 PL-2 h5'><%=session.getAttribute("Username")%></span>
			</li>
			<li class="list-group-item bg-color-transprant h5 ML-r4">Customer Name <span
				class='BL-1 PL-2 h5'><%=session.getAttribute("CustomerName")%></span>
			</li>
			<li class="list-group-item bg-color-transprant h5 ML-r4">Customer Mobile <span
				class='BL-1 PL-2 h5'><%=session.getAttribute("CustomerMobile")%></span>
			</li>
		</ul>
	</div>

	<spring:form style="margin-left:12rem" method="post" action="shopping">
		<button class='btn btn-warning' type="submit" value="Next..">Next</button>
	</spring:form>
</body>
</html>