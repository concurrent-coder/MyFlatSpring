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
	var nCityId=${cityId};
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
			<div class="col-md-3">
				<div class="scrollable">
					<a href="#" class="list-group-item active ">Area</a>
					<ul class="list-group">
						<c:if test="${not empty area}">
							<c:forEach items="${area}" var="b">
								<li class="list-group-item"><c:if test="${b.selected}">
										<input type="checkbox" class="styled" id="${b.areaName}"
											value="${b.areaName}" onchange="getSrchResult();"
											checked="checked" name="chkArea" />
									</c:if> <c:if test="${not b.selected}">
										<input type="checkbox" class="styled" value="${b.areaName}"
											id="${b.areaName}" onchange="getSrchResult()" name="chkArea" />
									</c:if> <label for="${b.areaName}"> ${b.areaName} </label></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>

				<div class="scrollable">
					<!-- 				style="height:260px" -->
					<!-- 				> -->
					<a href="#" class="list-group-item active">Amenities </a>
					<ul class="list-group">
						<c:if test="${not empty Amenities}">
							<c:forEach items="${Amenities}" var="a">
								<li class="list-group-item"><input type="checkbox"
									onchange="getSrchResult()" class="styled" value="${a.id}"
									id="${a.id}" name="chkAmenities" /> <label for="${a.id}">
										${a.amenitiesName} </label></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.div -->
				<div class="scrollable">
					<a href="#" class="list-group-item active ">BHK(s)</a>
					<ul class="list-group">
						<c:if test="${not empty bhk}">
							<c:forEach items="${bhk}" var="b">
								<li class="list-group-item"><c:if test="${b.selected}">
										<input type="checkbox" class="styled" id="${b.id}"
											value="${b.id}" onchange="getSrchResult()" checked="checked"
											name="chkBHKs" />
									</c:if> <c:if test="${not b.selected}">
										<input type="checkbox" class="styled"
											id="${b.bhkName}+${b.id}" onchange="getSrchResult()"
											name="chkBHKs" value="${b.bhkName }" />
									</c:if> <label for="${b.bhkName}+${b.id}"> ${b.bhkName} </label></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.div -->
				<div class="scrollable">
					<a href="#" class="list-group-item active">Bathroom </a>
					<ul class="list-group">
						<c:if test="${not empty bathroom}">
							<c:forEach items="${bathroom}" var="b">
								<li class="list-group-item"><c:if test="${b.selected}">
										<input type="checkbox" class="styled" id="${b.id}"
											value="${b.id}" onchange="getSrchResult()" checked="checked"
											name="chkBathroom" />
									</c:if> <c:if test="${not b.selected}">
										<input type="checkbox" class="styled" id="${b.id}"
											value="${b.id}" onchange="getSrchResult()" name="chkBathroom" />
									</c:if> <label for="${b.id}"> ${b.bathroomName} </label></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.div -->

			</div>
			<!-- /.col -->
			<div class="col-md-9">
				<div class="row" id="srchResult">
					<!--  Dynamic Result -->

					<c:if test="${not empty result}">
						<c:forEach items="${result}" var="r">
							<div class="col-md-4 text-center col-sm-6 col-xs-6">
								<div class="thumbnail">
									<img src="data:image/jpeg;base64,${r.thumbToString}" />
									<div class="caption">
										<h4>
											<a href="flatDtl.html?flatId=${r.id}">${r.title} </a>
										</h4>
										<p>
											<a href="flatDtl.html?flatId=${r.id}" class="btn btn-primary"
												role="button">See Details</a>
										</p>
									</div>
								</div>
							</div>
							<!-- /.col -->
						</c:forEach>
					</c:if>
				</div>

				<c:if test="${not empty result}">
					<!-- /.row -->
					<div class="row">
						<ul class="pagination alg-right-pad">
							<c:if test="${not empty page }">
								<li><a href="#" onclick="setPage(0);">«</a></li>
								<li><a href="#" onclick="setPage(${page});">${page+1 }</a></li>
								<li><a href="#" onclick="setPage(${page+1});">${page+2}</a></li>
								<li><a href="#" onclick="setPage(${page+2});">${page+3}</a></li>
								<li><a href="#" onclick="setPage(${page+1});">»</a></li>
							</c:if>
						</ul>
					</div>
					<!-- /.row -->
				</c:if>
				<c:if test="${empty result}">
				<div class="alert alert-warning" role="alert">No information found under the given Location, please try again</div>
				</c:if>
			</div>
		</div>
		<!-- /.row -->
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