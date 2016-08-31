<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Flat</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/bootstrap-select.min.css"/>"
	rel="stylesheet" type="text/css" />


<!-- Awesome Font  for Checkbox css	 -->
<link href="<c:url value="/resources/css/build.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css" />


<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<style type="text/css">
.navbar-brand {
	background: url('resources/images/home/myflatlogo_.png') center/contain
		no-repeat;
	width: 150px;
	height: 70px;
}

.navbar-fixed-top {
	min-height: 70px;
}

.navbar-nav>li>a {
	padding-top: 0px;
	padding-bottom: 0px;
	line-height: 70px;
}

@media ( max-width : 670px) {
	.navbar-nav>li>a {
		line-height: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	#site-footer {
		height: auto;
	}
	.row-fluid .span4 {
		width: auto;
	}
	.ibr-subscribe-form .input-block-level {
		color: black;
		width: 200px !important;
	}
}

.navbar {
	background-color: rgba(255, 255, 255, 0.92) none repeat scroll 0% 0%;
	background: rgba(255, 255, 255, 0.92) none repeat scroll 0% 0%;
	border-color: transparent;
}

.navbar li {
	color: #000
}

.container {
	width: 90%;
}

body {
	font-family: "Open Sans", Arial, Helvetica, sans-serif;
	font-size: 14px;
	line-height: 1.7em;
	overflow-x: hidden;
}

#site-footer {
	background: #4683B1 none repeat scroll 0% 0%;
	color: #FFF;
	font-size: 15px;
	line-height: 24px;
	position: relative;
}

#site-footer .top-box {
	background: #4683B1 none repeat scroll 0% 0%;
	padding: 20px 0px 94px;
}

#site-footer .title::before, #site-footer .widget-title::before {
	background: #4683B1 none repeat scroll 0% 0%;
	bottom: -2px;
	content: "";
	display: block;
	height: 2px;
	left: 0px;
	margin: 0px;
	position: absolute;
	opacity: 0.6;
	width: 16px;
}

.footer {
	display: table-row;
	height: 1px;
}

#site-footer .title, #site-footer .widget-title {
	border-bottom: 3px solid #E3E3E3;
	font-size: 25px;
	font-weight: normal;
	line-height: 30px;
	margin: 0px 0px 15px;
	padding: 0px 0px 14px;
	position: relative;
	font-variant: small-caps;
}

#site-footer ul {
	list-style: outside none none;
	margin-left: 0px;
}

#site-footer a {
	border: 0px none;
	color: #FFF;
}

.input-block-level {
	height: 35px;
	width: 275px;
}

body {
	font-family: "Open Sans", Arial, Helvetica, sans-serif;
	font-size: 14px;
	line-height: 1.7em;
	overflow-x: hidden;
}

#site-footer {
	background: #4683B1 none repeat scroll 0% 0%;
	color: #FFF;
	font-size: 15px;
	line-height: 24px;
	position: relative;
}

#site-footer .top-box {
	background: #4683B1 none repeat scroll 0% 0%;
	padding: 20px 0px 94px;
}

#site-footer .title::before, #site-footer .widget-title::before {
	background: #4683B1 none repeat scroll 0% 0%;
	bottom: -2px;
	content: "";
	display: block;
	height: 2px;
	left: 0px;
	margin: 0px;
	position: absolute;
	opacity: 0.6;
	width: 16px;
}

.footer {
	display: table-row;
	height: 1px;
}

#site-footer .title, #site-footer .widget-title {
	border-bottom: 3px solid #E3E3E3;
	font-size: 25px;
	font-weight: normal;
	line-height: 30px;
	margin: 0px 0px 15px;
	padding: 0px 0px 14px;
	position: relative;
	font-variant: small-caps;
}

#site-footer ul {
	list-style: outside none none;
	margin-left: 0px;
}

#site-footer a {
	border: 0px none;
	color: #FFF;
}

.input-block-level {
	height: 35px;
	width: 275px;
}

@media ( max-width :670px) {
	.caption>h4>a {
		display: none;
	}
}

.scrollable {
	overflow-y: auto;
}

.thumbnail .caption {
	padding: 2px;
	color: #333;
}
</style>

<script src="<c:url value="/resources/js/client/clientSrch.js"/>"></script>
<script type="text/javascript">
	
	function validateData(){
		if($("#txtname").val()==""){
			alert("Please enter the details properly");
			
			return false;
		}
		if($("#txtMob").val() ==""){
			alert("Please enter the details properly");
			return false;
		}
		
		var mob = $("#txtMob").val();
		var reg = /^\d+$/;
		console.log(mob+"-"+reg.test(mob));
		if(reg.test(mob) == false){
			alert("InValid Phone/Mobile Number");
			return false;
		}
	}
</script>
</head>
<body>

	<nav id="myNavbar" class="navbar navbar-default" style="top:0px"
		role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar" style="background-color: black;"></span> <span
					style="background-color: black;" class="icon-bar"></span> <span
					class="icon-bar" style="background-color: black;"></span>
			</button>
			<a class="navbar-brand" href="index.html"></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.html">Home</a></li>
				<li><a href="contact-us.html">Contact Us</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div class="container">

		<div class="row">
			<div class="col-md-6">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/MyFlatSpring/getImage/${flat.flatImg1Name}.jpg"
								alt="..." style="height: 320px; width: 700px">
							<div class="carousel-caption">${flat.title}-View-I</div>
						</div>
						<div class="item">
							<img src="/MyFlatSpring/getImage/${flat.flatImg2Name}.jpg"
								alt="..." style="height: 320px; width: 700px">
							<div class="carousel-caption">${flat.title}-View-II</div>
						</div>
						<div class="item">
							<img src="/MyFlatSpring/getImage/${flat.flatImg3Name}.jpg"
								alt="..." style="height: 320px; width: 700px">
							<div class="carousel-caption">${flat.title}-View-III</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> </a> <a
						class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> </a>
				</div>
				<hr>
				<c:if test="${not empty dealer}">
					<div class="alert alert-success fade in table-responsive"
						role="alert">
						<h4>We thank you for trusting us, please find dealer information</h4>
						<table width="100%">
							<tr>
								<td><b>Full Name</b></td>
								<td>${dealer.firstName },${dealer.lastName}</td>
							</tr>
							<tr>
								<td><b>Email </b></td>
								<td>${dealer.email}<i title="" data-original-title=""
									class="fa fa-envelope fa-1x"></i>
								</td>
							</tr>
							<tr>
								<td><b>Mobile </b></td>
								<td>${dealer.phoneNumber}<i title="" data-original-title=""
									class="fa fa-phone fa-1x"></i>
								</td>
							</tr>
						</table>
					</div>
				</c:if>
				<c:if test="${empty dealer}">
					<div class="panel panel-danger">
						<div class="panel-body">
							<form class="form-inline" action="getDealerInfo.html" 
								method="post">
								<div class="form-group">
									<label class="sr-only" for="exampleInputAmount">Amount
										(in dollars)</label>
									<div class="input-group">
										<div class="input-group-addon">Name</div>
										<input style="width: 200px" placeholder="enter your name"
											id="txtname" name="txtname" type="text">
										<div class="input-group-addon">+91</div>
										<input type="text" style="width: 200px"
											placeholder="enter your mobile number" id="txtMob"
											name="txtMob"> <input type="hidden"
											value="${uidFromServer}" name="uids"> <input
											type="hidden" value="${flat.id}" name="flatId">
									</div>
								</div>
								<button type="submit" class="btn btn-primary" onclick="return validateData();">Get
									Dealer Info</button>
								<br> <i title="" data-original-title=""
									class="fa fa-exclamation fa-2x"></i> <small>Please note
									that numbers will not be shared nor will be used for messaging
									purpose.</small>
							</form>
						</div>
					</div>
				</c:if>
			</div>
			<div class="col-md-6">
				<div class="col-md-12">
					<h1>${flat.title}</h1>
					<h4>
						<span class="label label-primary"> By
							${flat.dealer.firstName} ${flat.dealer.lastName}</span> <span
							class="label label-info">${flat.city.city}</span> <br> <br>
						<span class="label label-success">Area : ${flat.area}</span>

					</h4>
					<div class="panel panel-default">
						<div class="panel-body">
							<p>${flat.description}</p>
						</div>
					</div>


					<!--  advance -->
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="false" aria-controls="collapseOne"> ..more
										details </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<div class="table-responsive table">
										<table class="table">
											<tr>
												<td>Amenities</td>
												<td>
													<%
														int i = 0;
													%> <c:forEach items="${amenities}" var="a">
														<span class="label label-default">${a.amenitiesName}</span>
														<%
															if (i == 2) {
														%>
														<br>
														<%
															}
																i++;
														%>
													</c:forEach>
												</td>
												<td>Bathroom(s)</td>
												<td>${flat.bathroom.bathroomName }</td>
											</tr>

											<tr>
												<td>BHK type</td>

												<td>${flat.bhk.bhkName }</td>
												<td>Price Range</td>
												<td><i class="fa fa-inr fa-1x"></i> ${flat.priceFrom }
													- ${flat.priceTo}</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<hr>

	<footer id="site-footer" class="bg-light" role="contentinfo">
	<div class="row">
		<div class="container">
			<div class="col-sm-12">
				<footer>
				<p>© Copyright 2016 SAMARS</p>
				</footer>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>