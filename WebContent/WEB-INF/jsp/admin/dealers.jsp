<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:if test="${empty sessionScope.loginName}">
	    <c:redirect url="/admin/login.html"/>
	</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
#addDealerForm td {
	padding-top: 4px;
	padding-bottom: 4px;
}

#addDealerForm .error {
	border: 1px solid #f00;
}

@
-moz-document url-prefix () {fieldset {
	display: table-cell;
}

}

/* FOR YES_NO TOGGLE */
.switch {
	position: relative;
	display: block;
	vertical-align: top;
	width: 55px;
	height: 25px;
	padding: 3px;
	margin: 0 10px 10px 0;
	background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF 25px);
	border-radius: 18px;
	box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);
	cursor: pointer;
}

.switch-input {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
}

.switch-label {
	position: relative;
	display: block;
	height: inherit;
	font-size: 12px;
	text-transform: uppercase;
	background: #eceeef;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);
}

.switch-label:before, .switch-label:after {
	position: absolute;
	top: 50%;
	margin-top: -.5em;
	line-height: 1;
	-webkit-transition: inherit;
	-moz-transition: inherit;
	-o-transition: inherit;
	transition: inherit;
}

.switch-label:before {
	content: attr(data-off);
	right: 11px;
	color: #aaaaaa;
	text-shadow: 0 1px rgba(255, 255, 255, 0.5);
}

.switch-label:after {
	content: attr(data-on);
	left: 11px;
	color: #FFFFFF;
	text-shadow: 0 1px rgba(0, 0, 0, 0.2);
	opacity: 0;
}

.switch-input:checked ~ .switch-label {
	background: #99CE50;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);
}

.switch-input:checked ~ .switch-label:before {
	opacity: 0;
}

.switch-input:checked ~ .switch-label:after {
	opacity: 1;
}

.switch-input:checked ~ .switch-handle {
	left: 35px;
	box-shadow: -1px 1px 5px rgba(0, 0, 0, 0.2);
}
/* Transition
        ========================== */
.switch-label, .switch-handle {
	transition: All 0.3s ease;
	-webkit-transition: All 0.3s ease;
	-moz-transition: All 0.3s ease;
	-o-transition: All 0.3s ease;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addDealerForm").validate({
			errorPlacement : function() {
				return false;
			},
			submitHandler : function(form) {
				$("#btnSubmit").attr("disabled", "disabled");

				var dealer = $("#addDealerForm").serialize();
				finalURL = "/MyFlatSpring/admin/addDealer.html";
				$.ajax({
					url : finalURL,
					type : 'POST',
					datatype : 'application/json',
					data : dealer,
					success : function(data) {
						$("#btnSubmit").removeAttr("disabled");
						$("#home-content").html(data);
					}
				});
			}
		});
	});

	function ToggleNotification(userId, ele) {
		finalURL = "/MyFlatSpring/admin/updateDealer.html";
		$.ajax({
			url : finalURL,
			type : 'POST',
			datatype : 'application/json',
			data : {
				"userId" : userId,
				"status" : $(ele).is(':checked')
			},
			success : function(data) {
			}
		});
	}
</script>
</head>
<body>
	<div class="col-lg-8">
		<!-- start:view dealer -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-search"></i> Dealers
				</h3>
			</div>
			<div class="panel-body table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Phone Number</th>
							<th>Alert</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty Dealers}">
							<c:forEach items="${Dealers}" var="dealer">
								<tr>
									<td><a href="mailto:${dealer.email}?Subject=Message from Admin"> <i
											class="fa fa-paper-plane-o"
										> </i>
									</a></td>
									<td>${dealer.firstName}</td>
									<td>${dealer.lastName}</td>
									<td>${dealer.phoneNumber}</td>
									<td><label class="switch switch-yes-no"> <input class="switch-input"
											type="checkbox"
											<c:choose>
	  												<c:when test="${dealer.notify}">checked="true"</c:when>  
	  												<c:when test="${not dealer.notify}">false</c:when>
  												</c:choose>
											onclick="ToggleNotification('<c:out value="${dealer.id}"/>',this);"
										/> <span class="switch-label" data-on="Yes" data-off="No"></span> <span
											class="switch-handle"
										></span>
									</label></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
		<!-- start:creates new dealer -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-plus"></i> Add Dealer
				</h3>
			</div>
			<div class="panel-body">
				<form:form id="addDealerForm" modelAttribute="dealer">
					<table width="100%">
						<tr>
							<td style="padding: 2px;"><input required name="firstName" class="form-control"
								placeholder="First Name" type="text"
							></td>
							<td style="padding: 2px"><input required name="lastName" class="form-control"
								placeholder="Last Name" type="text"
							></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-envelope"
										style="color: rgb(44, 82, 115);"
									></i> <span></span></span> <input required class="form-control" id="email" name="email"
										placeholder="Email" type="email"
									>
								</div>
							<td>
						</tr>
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-phone-square"
										style="color: rgb(44, 82, 115);"
									></i> <span></span></span> <input required class="form-control" name="phoneNumber"
										placeholder="Phone Number"
									>
								</div>
							</td>
							<td align="right"><label style="font-size: smaller;"> <input path="notify"
									name="notify" type="checkbox"
								> Notify dealer
							</label>
								<button type="submit" id="btnSubmit" class="btn btn-primary">Submit</button></td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>