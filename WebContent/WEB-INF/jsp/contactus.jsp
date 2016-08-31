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

.panel-heading {
    background-color: #4683B1;
    text-anchor: start;
    color: white;
}

.panel {
	border: 1px solid #A8B9C8;
}

.divLocation{
    height: 300px;
    background: transparent url("./resources/images/admin/header_bg.jpg") no-repeat fixed center center / cover;
}
</style>

<script src="<c:url value="/resources/js/client/clientSrch.js"/>"></script>
<script type="text/javascript">
	var nCityId = $
	{
		cityId
	};
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
				<li class="active"><a href="contact-us.html">Contact Us</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div class="container">

		<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="panel">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-map-marker fa-2x" title="" data-original-title=""></i>
							Location
						</h4>
					</div>
					<div class="panel-body">
						<!-- gMap script container !Do not remove!! -->
						<div id="mapImage" class="divLocation"></div>
						<!-- gMap script container !Do not remove!! -->
					</div>
				</div>
			</div>
		</div>

		<hr>
		<c:if test="${not empty responseMessage }">
				<div class="alert alert-success" role="alert">${responseMessage}</div>
		</c:if>
		<div class="row">
			<div class="col-sm-4 col-lg-4">
				<div class="panel">
					<div class="panel-heading">
						<h3>
							<i class="fa fa-building fa-1x" title="" data-original-title=""></i>
							Our office
						</h3>
					</div>
					<div class="panel-body">
						<address>
							<strong>${company.officeName}</strong><br> ${company.line1}, ${company.line2}<br>
							${company.city.city}, ${company.state.state}  ${company. zipCode}<br> <i class="icon-phone-sign"></i>
							+91 ${company.phoneNumber}
						</address>
					</div>
				</div>

			</div>
			<div class="col-12 col-lg-8">

				<div class="panel">
					<div class="panel-heading">
						<h3 class="">
							<i class="fa fa-envelope-o fa-1x" title="" data-original-title=""></i>
							Feel free to contact us
						</h3>
					</div>
					<div class="panel-body">
						<!-- CONTACT FORM https://github.com/jonmbake/bootstrap3-contact-form -->

						<form role="form" id="feedbackForm" action="sendMessage.html" method="POST">
							<div class="form-group">
								<input class="form-control" id="name" name="name"
									placeholder="Name" type="text"> <span
									class="help-block" style="display: none;">Please enter
									your name.</span>
							</div>
							<div class="form-group">
								<input class="form-control" id="email" name="email"
									placeholder="Email Address" type="email"> <span
									class="help-block" style="display: none;">Please enter a
									valid e-mail address.</span>
							</div>
							<div class="form-group">
								<textarea rows="7" cols="70" class="form-control" id="message"
									name="message" placeholder="Message"></textarea>
								<span class="help-block" style="display: none;">Please
									enter a message.</span>
							</div>




							<button type="submit" id="feedbackSubmit"
								class="btn btn-primary btn-lg"
								style="display: block; margin-top: 10px;">Send Feedback</button>
						</form>
						<!-- END CONTACT FORM -->
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