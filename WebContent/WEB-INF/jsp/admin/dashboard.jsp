<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:if test="${empty sessionScope.loginName}">
	<c:redirect url="/admin/login.html" />
</c:if>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Admin Dashboard</title>
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
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.validate.min.js"/>"></script>

<script src="<c:url value="/resources/js/admin/main.js"/>"></script>
<script src="<c:url value="/resources/js/admin/commonUtil.js"/>"></script>
<style type="text/css">
.navbar-brand {
	background: url(../resources/images/home/myflatlogo_.png) center/contain
		no-repeat;
	width: 100px;
	height: 60px;
}

#userMenu.dropdown {
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 200px;
}

.container {
	width: 1332px;
}

.dropdown-menu>li>a {
	color: #428bca;
}

.header-top ul li {
	list-style: none;
}

.dropdown {
	border-radius: 5px;
	box-shadow: none;
	width: 140px;
}

.dropdown ul.dropdown-menu {
	border-radius: 5px;
	box-shadow: none;
	margin-top: 15px;
	width: 140px;
}

.dropdown ul.dropdown-menu:before {
	content: "";
	border-bottom: 10px solid #fff;
	border-right: 10px solid transparent;
	border-left: 10px solid transparent;
	position: absolute;
	top: -10px;
	right: 16px;
	z-index: 10;
}

.dropdown ul.dropdown-menu:after {
	content: "";
	border-bottom: 12px solid #ccc;
	border-right: 12px solid transparent;
	border-left: 12px solid transparent;
	position: absolute;
	top: -12px;
	right: 14px;
	z-index: 10;
}

#header {
	background: url('../resources/images/admin/header_bg.jpg') no-repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-ms-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	border-bottom: 15px solid #f2f2f2;
}

#header .navbar-collapse ul.nav>li {
	margin-right: 20px;
	margin-top: 20px;
}

#header .navbar-collapse ul.nav>li>a {
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	font-size: 10pt;
	color: #ecf0f1;
}

#header .overlay {
	background: rgba(78, 143, 186, 0.25);
	padding-top: 50px;
	padding-bottom: 60px;
}

#header .navbar-collapse ul.nav li.active {
	background-color: #2880BA;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
}

#header .navbar-collapse ul.nav li a:hover, #header .navbar-collapse ul.nav li a:focus,
	#header .navbar-collapse ul.nav li a:active {
	background-color: rgba(41, 128, 185, 0.9);
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-ms-transition: all 1s ease;
	-o-transition: all 1s ease;
	transition: all 1s ease;
}

#header .navbar-collapse  li a:hover {
	color: #ecf0f1;
}

#header .navbar-collapse ul.nav>li {
	margin-right: 20px;
	margin-top: 20px;
}

#main {
	background-color: #f2f2f2;
	padding: 8px;
	margin-top: -55px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	border-bottom: 4px solid #ddd;
}

#home-content .col-lg-8 {
	margin-bottom: 25px;
}

#home-content .panel-default {
	border: 2px solid #fff;
}

#home-content .panel-default .panel-body {
	background-color: #ecf0f1;
}

.state-overview section.panel {
	border: none;
}

.state-overview .terques {
	background: #1abc9c;
}

.state-overview .symbol {
	width: 40%;
	padding: 25px 15px;
	-webkit-border-radius: 4px 0px 0px 4px;
	-moz-border-radius: 4px 0px 0px 4px;
	-ms-border-radius: 4px 0px 0px 4px;
	-o-border-radius: 4px 0px 0px 4px;
	border-radius: 4px 0px 0px 4px;
}

.state-overview .symbol, .state-overview .value {
	display: inline-block;
	text-align: center;
}

.state-overview .symbol i {
	color: #fff;
	font-size: 50px;
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	-ms-border-radius: 100%;
	-o-border-radius: 100%;
	border-radius: 100%;
	-webkit-border: 2px dotted #fff;
	-moz-border: 2px dotted #fff;
	-ms-border: 2px dotted #fff;
	-o-border: 2px dotted #fff;
	border: 2px dotted #fff;
	width: 85px;
	height: 85px;
	padding-top: 17px;
}

.state-overview .value {
	width: 58%;
	padding-top: 31px;
}

.state-overview .value {
	float: right;
}

.state-overview .symbol, .state-overview .value {
	display: inline-block;
	text-align: center;
}

.state-overview .value h1 {
	font-weight: 300;
}

.state-overview .value h1, .state-overview .value p {
	margin: 0;
	padding: 0;
	color: #c6cad6;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Open Sans", sans-serif;
	font-weight: 400;
	margin-top: 5px;
	margin-bottom: 5px;
}

.state-overview .value h1, .state-overview .value p {
	margin: 0;
	padding: 0;
	color: #c6cad6;
}

.state-overview .red {
	background: #e74c3c;
}

.state-overview .symbol {
	width: 40%;
	padding: 25px 15px;
	-webkit-border-radius: 4px 0px 0px 4px;
	-moz-border-radius: 4px 0px 0px 4px;
	-ms-border-radius: 4px 0px 0px 4px;
	-o-border-radius: 4px 0px 0px 4px;
	border-radius: 4px 0px 0px 4px;
}

.state-overview .symbol, .state-overview .value {
	display: inline-block;
	text-align: center;
}

#dvLoading {
	background: #000 url(images/loader.gif) no-repeat center center;
	height: 100px;
	width: 100px;
	position: fixed;
	z-index: 1000;
	left: 50%;
	top: 50%;
	margin: -25px 0 0 -25px;
}

#divLoading {
	display: none;
}

#divLoading.show {
	display: block;
	position: fixed;
	z-index: 100;
	background-image: url('../resources/images/admin/ajax-loader.gif');
	background-color: #000;
	opacity: 0.6;
	background-repeat: no-repeat;
	background-position: center;
	left: 0;
	bottom: 0;
	right: 0;
	top: 0;
}

.state-overview .value h1, .state-overview .value p {
	margin: 0;
	padding: 0;
	color: #051c62;
	font-family: unset;
}
</style>

</head>
<body>
	<!-- 	main -->
	<div id="wrapper">
		<div class="header-top">
			<!-- start navbar -->
			<nav class="navbar navbar-fixed-top" role="navigation"
				style="margin-bottom: 0px; height: 60px; background: transparent -moz-linear-gradient(center top , rgb(255, 255, 255) 0%, rgb(229, 229, 229) 100%) repeat scroll 0% 0%;">
			<div class="container">
				<!-- start navbar-header -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar" style="background-color: black;"></span> <span
							style="background-color: black;" class="icon-bar"></span> <span
							class="icon-bar" style="background-color: black;"></span>
					</button>
					<a class="navbar-brand" href="dashboard.html"></a>
				</div>
				<!-- end navbar-header -->
				<ul id="userMenu" class="nav navbar-nav navbar-right top-menu">
					<li class="dropdown"><a aria-expanded="false" href="#"
						class="dropdown-toggle" data-toggle="dropdown">${sessionScope.loginName}<span
							class="fa fa-sort-desc pull-right"></span></a>
						<ul class="dropdown-menu">
							<li class="divider"></li>
							<li><a href="logOut.html">Logout<span
									style="line-height: 0px;"
									class="fa fa-sign-out pull-right fa-1x"></span></a></li>
						</ul></li>
				</ul>
			</div>
			</nav>
			<!--  After Title with Dropdown -->
			<div id="header">
				<div class="overlay">
					<nav style="margin-top: 36px;" class="navbar" role="navigation">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="btn-block btn-drop navbar-toggle"
								data-toggle="collapse" data-target=".navbar-ex1-collapse">
								<strong>MENU</strong>
							</button>
							<button type="button" class="btn-block btn-drop navbar-toggle"
								data-toggle="collapse" data-target=".navbar-ex1-collapse">
								<strong>MENU</strong>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div style="" class="collapse navbar-collapse navbar-ex1-collapse">
							<ul id="dashboardMenu" class="nav navbar-nav">
								<li class="active"><a href="dashboard.html">
										<div class="text-center">
											<i title="" data-original-title=""
												class="fa fa-dashboard fa-3x"></i><br> Dashboard
										</div>
								</a></li>
								<li><a href="#NewFlat" onclick="getFlats(this);">
										<div class="text-center">
											<i title="" data-original-title=""
												class="fa fa-building-o fa-3x"></i><br> New Flat
										</div>
								</a></li>
								<li><a href="#Dealers" onclick="getDealers(this);">
										<div class="text-center">
											<i title="" data-original-title="" class="fa fa-users fa-3x"></i><br>
											Dealers
										</div>
								</a></li>
								<li class="dropdown"><a aria-expanded="false"
									class="dropdown-toggle" data-toggle="dropdown" href="#">
										<div class="text-center">
											<i title="" data-original-title="" class="fa fa-list fa-3x"></i><br>
											Filter Options <span class="caret"></span>
										</div>
								</a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#Amenities" onclick="getAmenities(this);"><i
												title="" data-original-title="" class="fa fa-list-alt"></i>
												Amenities </a></li>
										<li><a href="#BHKs" onclick="getBHKs(this);"><i
												class="fa fa-bed"></i> BHK</a></li>
										<li><a href="#Bathrooms" onclick="getBathrooms(this);"><i
												title="" data-original-title="" class="fa fa-columns"></i>
												Bathrooms</a></li>

									</ul></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					</nav>
				</div>
			</div>
			<!-- 		END OF HEADERS AND MENU -->
			<!-- 			START OF DASHBOARD -->
			<div class="container">
				<div id="main">
					<!-- start:breadcrumb -->
					<!-- end:breadcrumb -->
					<div class="row" id="home-content">
						<div class="col-lg-8">
							<!-- start:state overview -->
							<div class="row state-overview">
								<div class="col-lg-6 col-sm-6">
									<section class="panel">
									<div class="symbol terques">
										<i title="" data-original-title=""
											class="fa fa-graduation-cap"></i>
									</div>
									<div class="value">
										<h1 class="count">${newCust}</h1>
										<p>New Users</p>
									</div>
									</section>
								</div>
								<div class="col-lg-6 col-sm-6">
									<section class="panel">
									<div class="symbol red">
										<i title="" data-original-title="" class="fa fa-gift"></i>
									</div>
									<div class="value">
										<h1 class=" count2">${TotalCust}</h1>
										<p>Total users visited</p>
									</div>
									</section>
								</div>
							</div>
							<!-- end:state overview -->
							<!--custom chart start-->
						</div>
						<div class="col-lg-4">
							<!-- start:user info -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<header class="panel-title">
									<div class="text-center">
										<strong>Admin</strong>
									</div>
									</header>
								</div>
								<div class="panel-body">
									<div class="text-center" id="author">
										<img data-holder-rendered="true"
											src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzE0MHgxNDAKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNTJkYzNkYTIyMyB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE1MmRjM2RhMjIzIj48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQzLjUiIHk9Ijc0LjgiPjE0MHgxNDA8L3RleHQ+PC9nPjwvZz48L3N2Zz4="
											style="width: 140px; height: 140px;"
											data-src="holder.js/140x140" class="img-circle" alt="140x140">
										<h3>${sessionScope.loginName}</h3>
									</div>
								</div>
							</div>
							<!-- end:user info -->
							<!-- start:new earning -->
							<div class="panel terques-chart"></div>
							<!-- end:new earning-->
							<!-- start:total earning-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="divLoading"></div>

	
</body>
</html>