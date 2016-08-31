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
#addbhk td {
	padding-top: 4px;
	padding-bottom: 4px;
}

#addbhk .error {
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
		$("#addbhk").validate({
			errorPlacement : function() {
				return false;
			},
			submitHandler : function(form) {
				$("#btnSubmit").attr("disabled", "disabled");
				var bhks = $("#addbhk").serialize();
				finalURL = "/MyFlatSpring/admin/addBhks.html";
				$.ajax({
					url : finalURL,
					type : 'POST',
					datatype : 'application/json',
					data : bhks,
					success : function(data) {
						$("#btnSubmit").removeAttr("disabled");
						$("#home-content").html(data);
					}
				});
			}
		});
	});

	function ToggleActive(bhkId, ele) {
		finalURL = "/MyFlatSpring/admin/updateBhks.html";
		$.ajax({
			url : finalURL,
			type : 'POST',
			datatype : 'application/json',
			data : {
				"bhkId" : bhkId,
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
		<!-- start:view bhks -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-search"></i> BHK(s)
				</h3>
			</div>
			<div class="panel-body table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Active</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty Bhk}">
							<c:forEach items="${Bhk}" var="bhk">
								<tr>
									<td>${bhk.bhkName}</td>
									<td><label class="switch switch-yes-no"> 
									<input class="switch-input"
											type="checkbox"
											<c:choose>
								               <c:when test="${bhk.active}">checked="true"</c:when>  
								               <c:when test="${not bhk.active}">false</c:when>
							              	</c:choose>
											onclick="ToggleActive('<c:out value="${bhk.id}"/>',this);"
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
		<!-- start:creates new bhks -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-plus"></i> Add BHK
				</h3>
			</div>
			<div class="panel-body">
				<form:form id="addbhk" modelAttribute="bhk">
					<table width="100%">
						<tr>
							<td style="padding: 2px;"><input required name="bhkName" class="form-control"
									placeholder="BHK Name (Like : 3BHK)" type="text">
							</td>
						</tr>
						<tr>
							<td align="right">
								<button type="submit" id="btnSubmit" class="btn btn-primary">Submit</button>
							</td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>