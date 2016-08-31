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
<script src="<c:url value="/resources/js/bootstrap-select.js"/>"></script>

<script src="<c:url value="/resources/js/client/clientSrch.js"/>"></script>


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
	.featured-box .fa-4x {
		font-size: 1em;
	}
	.featured-box div {
		padding-left: 10px !important;
	}
	.ibr-subscribe-form .input-block-level {
		color: black;
		width: 200px !important;
	}
	.container {
		width: auto !important;
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
	}
	.jumbotron .inner {
		width: 400px;
		z-index: 10;
		height: 250px;
		padding: 20px 30px;
		color: #FFF;
		background: rgba(3, 3, 3, 0.79) none repeat scroll 0% 0%;
		line-height: 1.8em;
		margin: 60px 40px -200px 0px;
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

.jumbotron {
	padding-top: 50px;
	background:
		url("resources/images/home/interior_design_room_house_home_1280x600.jpg")
		no-repeat center center fixed;
	height: 500px;
	background-size: cover;
}

.inner {
	width: 600px;
	z-index: 10;
	height: 250px;
	padding: 20px 30px;
	float: right;
	color: #FFF;
	/*     background: rgba(51, 51, 51, 0.9) none repeat scroll 0% 0%; */
	background: rgba(3, 3, 3, 0.79) none repeat scroll 0% 0%;
	line-height: 1.8em;
	color: #FFF;
	/*     background: rgba(51, 51, 51, 0.9) none repeat scroll 0% 0%; */
	background: rgba(3, 3, 3, 0.79) none repeat scroll 0% 0%;
	line-height: 1.8em;
	margin: 60px 40px -200px 0px;
}

.navbar-right {
	float: right !important;
	margin-right: 0px;
}

.dropdown-menu open {
	width: 140px;
}

.dropdown-menu inner {
	width: 140px;
}

.inner .box {
	float: left;
	width: 48%;
	padding: 8px 1px 2px;
}

.inner .box.right {
	float: right;
}

.inner .box .btn {
	background: #E3E3E3 none repeat scroll 0% 0%;
	color: #111;
	font-weight: bold;
}

.clearfix {
	padding: 20px;
}

.custom-dropdown {
	-moz-appearance: none;
	border: 0px none !important;
	color: #BDBDBD;
	font-size: 14px;
	padding: 10px;
	cursor: pointer;
	background: rgba(119, 119, 119, 0.64)
		url("resources/images/home/icons/drop-down-arrow.png") no-repeat
		scroll right center/40px 37px;
	font-weight: bold;
	width: 100%;
}

.featured-box {
	padding: 20px;
	border: 1px solid #DDD;
	background: transparent
		linear-gradient(to bottom, #FFF 0%, #F4F4F4 100%) repeat scroll 0% 0%;
}

.featured-box i {
	display: inline-block;
	border-radius: 60px;
	box-shadow: 0px 0px 2px #888;
	padding: 10px;
	position: absolute;
	color: #2880BA;
	border: 2px solid #2880BA;
}

.featured-box .text {
	padding-left: 100px;
}

.span4 {
	width: 370px;
}

[class*="span"] {
	float: left;
	min-height: 1px;
	margin-left: 30px;
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

nav ul, nav ol {
	list-style: outside none none;
	margin: 0px;
}

ul, ol {
	padding: 0px;
	margin: 0px 0px 26px 40px;
}

#site-footer a {
	border: 0px none;
	color: #FFF;
}

.input-block-level {
	height: 35px;
	width: 275px;
}
</style>

</head>
<body>
	<nav id="myNavbar" class="navbar navbar-default navbar-fixed-top"
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
				<li class="active"><a href="index.html">Home</a></li>
				<li><a href="contact-us.html">Contact Us</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="jumbotron">
		<div class="inner">
			<form id="frmSrch" method="POST" action="srch.html">
				<div style="width: 100%">
					<div class="box">
						<c:if test="${not empty cities}">
							<select id="drpCities" class="custom-dropdown" name="cityId"
								onchange="getAreas();">
								<option selected="selected" value="">Location</option>
								<c:forEach items="${cities}" var="c">
									<option id="${c.id}" value="${c.id}">${c.city}</option>
								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty cities}">
							<select id="drpCities" class="custom-dropdown" name="cityId"
								onchange="getAreas();">
								<option value="Ahmedabad">Ahmedabad</option>
								<option value="Pune">Pune</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Bangalore">Bangalore</option>
							</select>
						</c:if>
					</div>
					<div class="box right">
						<select id="drpAreas" class="custom-dropdown" name="area">
							<option selected="selected" value="">Select Area</option>
						</select>
					</div>
					<div class="clearfix"></div>
					<div class="box">
						<div class="box">
							<select id="drpBathroomsBtw1" class="custom-dropdown"
								name="bthBtwn1">
								<option selected="selected" value="">Bathrooms</option>
								<c:if test="${not empty bathrooms}">
									<c:forEach items="${bathrooms}" var="c">
										<option id="${c.id}" value="${c.id}">${c.bathroomName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="box right">
							<select id="drpBathroomsBtw2" class="custom-dropdown"
								name="bthBtwn2">
								<option selected="selected" value="">Bathrooms</option>
								<c:if test="${not empty bathrooms}">
									<c:forEach items="${bathrooms}" var="c">
										<option id="${c.id}" value="${c.id}">${c.bathroomName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="box right">
						<div class="box">
							<select id="drpRsFrom" class="custom-dropdown" name="RsRangeFrom">
								<option selected="selected" value="">From Rs.</option>
								<c:if test="${not empty fromRange}">
									<c:forEach items="${fromRange}" var="c">
										<option id="${c}" value="${c}">${c}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="box right">
							<select id="drpRsTo" class="custom-dropdown" name="RsRangeTo">
								<option selected="selected" value="">To Rs.</option>
								<c:if test="${not empty toRange}">
									<c:forEach items="${toRange}" var="c">
										<option id="${c}" value="${c}">${c}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="box right">
						<button type="submit"
							style="font-weight: bold; font-size: 18px; border-radius: 7px; border: 3px solid transparent;"
							class="btn btn-block find-all-properties">Find Apartment</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 	After Filter -->
	<div class="container">
		<div class="row-fluid">
			<div class="span4">
				<div class="featured-box">
					<i class="fa fa-thumbs-up fa-4x"></i>
					<div class="text">
						<h2>Perfect Match</h2>
						Aparments with your matching ammeneties in major cities of
						Maharashtra Karnatka and Gujarat
					</div>
				</div>
			</div>

			<div class="span4">
				<div class="featured-box">
					<i class="fa fa-users fa-4x"></i>
					<div class="text">
						<h2>Many Dealers</h2>
						Thousands of owners are now linked with for apartment on Rent.
						Conact directly to you owner.
					</div>
				</div>
			</div>

			<div class="span4">
				<div class="featured-box">
					<i class="fa fa-magic fa-4x"></i>
					<div class="text">
						<h2>Easy To Find</h2>
						Aparments that you can search in major cities of Maharashtra
						Karnatka and Gujarat
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>

	<footer id="site-footer" class="bg-light" role="contentinfo">
	<div class="top-box">
		<div class="container">
			<div class="row">
				<div class="span2 footer-navigation">
					<h3 class="title">Welcome</h3>
					<nav role="navigation">
					<div class="menu-welcome-container">
						<ul id="menu-welcome" class="menu">
							<li><a href="contact-us.html">Contact Us</a></li>
						</ul>
					</div>
					</nav>
				</div>
				<!-- .footer-navigation -->

				<div class="span4 about-us">
					<a href="about-us.jsp" class="about-us-link no-border">
						<h3 class="title">About Us</h3>
						<div class="text">Flat Room Real Estate Agency provides home
							sellers and buyers with an innovative real estate solution. All
							our agents have years of experience in the areas they serve,
							allowing you to save thousands, without compromising on service.</div>
					</a>
				</div>
				<!-- .about-us -->

				<div class="span3 contact-us">
					<h3 class="title">Contact Us</h3>
					<ul>
						<li>Phone: 111-222-555, 123-227-587</li>
						<li>Address: 112 Archdale, 2B Charleston, New York City, USA</li>
						<li>Email: <a href="mailto:example@gmail.com">mailto:example@gmail.com</a></li>
					</ul>
				</div>
				<!-- .contact-us -->

				<div class="span3 sidebar">
					<aside class="ibr-subscribe-widget widget">
					<h3 class="widget-title">Newsletter</h3>
					<p>Sign up for our newsletter to be always up to date.</p>
					<div class="ibr-subscribe-form" style="color: black;">
						<input class="input-block-level" name="mail"
							placeholder="Enter your email adress..." type="email"> <input
							class="btn submit" value="Go" type="button">
						<div class="enquire-status"></div>
					</div>
					</aside>
					<div class="aside-border"></div>
				</div>
				<!-- .sidebar -->
			</div>


		</div>
	</div>
	<!-- .top-box -->

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