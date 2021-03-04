<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ include file="styles.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Amazon</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<form action="processlogout" method="post">
		<button class='btn btn-primary' type="submit" value="Logout">Logout</button>
	</form>
</body>
</html>