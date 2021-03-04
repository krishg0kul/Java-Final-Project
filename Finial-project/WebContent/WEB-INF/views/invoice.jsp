<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file="styles.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fresh2Eat-Invoice Page</title>
</head>
<body>
	<nav class="navbar navbar-light bg-light navDiv">
		<span class="navbar-brand mb-0 h1 text-success">Fresh2Eat</span> <span
			class='NavEnd col-2 d-flex'>
			<h5>
				Hello...<span><%=session.getAttribute("CustomerName")%></span>
			</h5> <span><%@ include file="logout.jsp"%></span>
		</span>
	</nav>
	<div class='container invoice-container'>
		<h1 class='text-center'>
			Thank you for shopping with us
			<span class='text-danger'>
				<c:out value="${ CustomerName}" />
			</span>
			
		</h1>
		
		<div>
			<h3 class='text-center mt-4'>Invoice</h3> 
			<div class='row text-right col-4 offset-8 d-flex mt-4 mb-4 ' style='justify-content: space-around;'>
				<form action="generatePdf" method="get" onSubmit='alert("PDF is read to Documents.")'>
					<input type="submit" value="Download PDF" />
					
				</form>
				<form action="generateXl" method="get" onSubmit='alert("Excel is read to Documents.")'>
					<input type="submit" value="Download Excel" />
				</form>
			</div>
			<div class='text-right'>
				<h6>
					<label class='text-info'>Mobile :</label><c:out value="${ CustomerMobile}" />
				</h6>
				<h6>
					<label class='text-info'>Date :</label><c:out value="${ today }" />
				</h6>
			</div>
			
			<table class="table">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Name</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Price</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="item" items="${selectedItems}">
					<tr>
						<th scope="row"><c:out value="${item.getSno()+1}" /></th>
						<td><c:out value="${item.getName()}" /></td>
						<td><c:out value="${item.getQuantity()}"/> Kg</td>
						<td><c:out value="${item.getPrice()}" /></td>
					</tr>
				</c:forEach>
				<tr class='font-weight-bold'>
					<td></td>
					<td></td>
					<td>Total Price</td>
					<td><c:out value="${totalamount}" /></td>
				</tr>
			  </tbody>
			</table>

		</div>
		<div class='text-center text-success'>
			<c:out value="${lastMsg}" />
		</div>
	</div>
	
	<footer class="footer">
		<div class='container text-center'>
			<span>&#169; Fresh2Eat</span>
		</div>
	</footer>
</body>
</html>