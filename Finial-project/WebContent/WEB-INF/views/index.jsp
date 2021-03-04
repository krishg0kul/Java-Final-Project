<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file="styles.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome - Fresh2Eat</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<div class='LoginDiv'>
		<nav class="navbar navbar-light bg-light navDiv">
			<span class="navbar-brand mb-0 h1 text-success" >Fresh2Eat</span> <span
				class='NavEnd col-2 d-flex'> 
				<span > 
					<a href="user/login"><button class="btn btn-primary">Login</button></a>
						<a href="user/register"><button class="btn btn-primary">Register</button></a>
				</span>
			</span>
		</nav>
	</div>
	<div class="containter">

		<div id="carouselExampleIndicators" class="carousel slide carousel-login"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active "></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
				
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item ">
				<img class="d-block w-100" src="https://images.unsplash.com/photo-1523971436722-f144a6a5dc60?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8ZnJlc2glMjBmcnVpdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="First slide">
			  	<div class="carousel-caption d-none d-md-block">
			    	<h2> Welcome to Fresh2Eat </h2>
					<p> We provide best quality fruits and we are very happy that you have chose us to shop </p>
			  	</div>
				</div>
				<div class="carousel-item active">
					<img class="d-block w-100"  src="https://images.unsplash.com/photo-1474480109237-15a7ca8f0685?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI1fHxmcmVzaCUyMGZydWl0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="Second slide">
					<div class="carousel-caption d-none d-md-block">
				    	<h2> Welcome to Fresh2Eat </h2>
						<p> We provide best quality fruits and we are very happy that you have chose us to shop </p>
				  	</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="https://images.unsplash.com/photo-1521170251109-b81302c577c1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTl8fGZyZXNoJTIwZnJ1aXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="Third slide">
					<div class="carousel-caption d-none d-md-block">
				    	<h2> Welcome to Fresh2Eat </h2>
						<p> We provide best quality fruits and we are very happy that you have chose us to shop </p>
				  	</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="https://images.unsplash.com/photo-1478900799953-bf09659cc42e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njh8fGZyZXNoJTIwZnJ1aXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="Third slide">
					<div class="carousel-caption d-none d-md-block">
				    	<h2> Welcome to Fresh2Eat </h2>
						<p> We provide best quality fruits and we are very happy that you have chose us to shop </p>
				  	</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="https://images.unsplash.com/photo-1610917040803-1fccf9623064?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODF8fGZyZXNoJTIwZnJ1aXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="Third slide">
					<div class="carousel-caption d-none d-md-block">
				    	<h2> Welcome to Fresh2Eat </h2>
						<p> We provide best quality fruits and we are very happy that you have chose us to shop </p>
				  	</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> 
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>

	</div>
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 5000
    })
  });
 
</script>
</html>