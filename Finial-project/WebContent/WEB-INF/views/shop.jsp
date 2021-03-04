<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.ArraytemDTO"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fresh2Eat</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<div class='shopNavDiv'>
		<nav class="navbar navbar-light bg-light navDiv">
			<span class="navbar-brand mb-0 h1 text-success">Fresh2Eat</span> <span
				class='NavEnd col-2 d-flex'>
				<h5 class='AS-flexend'>
					Hello...<span><%=session.getAttribute("CustomerName") %></span>
				</h5> 
				<span><%@ include file="logout.jsp"%></span>
			</span>
		</nav>
	</div>

	<h3 class='ml-2 mt-4 mb-4 text-center' style='font-family: -webkit-body'>Pick & Get </h3>

	<spring:form action="itemsubmit" method="post">
		<div class='shopCard d-flex Margin-B2'>
			<%-- <c:forEach begin="0" end="${String.valueOf(Items.getItemImage().length)}" var="i" >		 --%>	
			<c:forEach begin="0" end="${itemsLength}" var="i" >			
			<div class="card Margin-LR05 rounded" style="width: 18rem;">
				<img class="card-img-top" src=<c:out value="${Items.getItemImage()[i]}" /> style='height: 200px;object-fit: cover' alt="Fruits">
				<div class="card-body">
					<span class='card-body-top'>
						<input type="checkbox" name=<c:out value="${Items.getItemId()[i]}" />
						value=<c:out value="${Items.getItemDescription()[i]}" /> />
						<h5 class="card-title ml-3"><c:out value="${Items.getItemDescription()[i]}" /></h5>
					</span >
					<span class='card-body-top'>
						Purchasing Count : <input class='purchasing-count' type="number" min="0" name=<c:out value="${Items.getItemDescription()[i]}" /> />
					</span>
					<span style='display: flex;justify-content: flex-end;margin-top:5%'>
						<!-- <Price> Price Tag</Price> -->
						<code class="btn btn-secondary" style='padding: 0 0.5em;display: flex;align-items: center;cursor:auto'>
						<svg style='margin-right: 5px;' xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tag" viewBox="0 0 16 16">
						  <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z"/>
						  <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586l7 7L13.586 9l-7-7H2v4.586z"/>
						</svg>
						<c:out value="${Items.getPrice()[i]}" /></code>
					</span>
					
				</div>
			</div>
			</c:forEach>

		</div>
		<div class='TA-center'>
			<Button class="btn btn-primary" type="submit" value="ok">Purchase</Button>
		</div>
		
	</spring:form>


</body>
</html>