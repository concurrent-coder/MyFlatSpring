<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:if test="${empty sessionScope.loginName}">
	<c:redirect url="/admin/login.html" />
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
#addAmenities td {
	padding-top: 4px;
	padding-bottom: 4px;
}

#addAmenities .error {
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
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px
		rgba(0, 0, 0, 0.15);
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
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px
		rgba(0, 0, 0, 0.2);
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
		$("#addAmenities").validate({
			errorPlacement : function() {
				return false;
			},
			submitHandler : function(form) {
				$("#btnSubmit").attr("disabled", "disabled");

				var amenities = $("#addAmenities").serialize();
				finalURL = "/MyFlatSpring/admin/addAmenities.html";
				$.ajax({
					url : finalURL,
					type : 'POST',
					datatype : 'application/json',
					data : amenities,
					success : function(data) {
						$("#btnSubmit").removeAttr("disabled");
						$("#home-content").html(data);
					},
					error: function (request, status, error) {
				        alert(request.responseText);
				    }
				});
			}
		});
	});

	function ToggleActive(amenitiesId, ele) {
		finalURL = "/MyFlatSpring/admin/updateAmenities.html";
		$.ajax({
			url : finalURL,
			type : 'POST',
			datatype : 'application/json',
			data : {
				"amenitiesId" : amenitiesId,
				"status" : $(ele).is(':checked')
			},
			success : function(data) {
			}
		});
	};
	
	function cleanFooter(){
		$("#footer").html("");
		$("#footer").html("<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>")
	}
	
	function deleteAmenities(id,name){
		cleanFooter();
		$("#msgToDisplay").html("Are you sure want to delete Amenity:: "+name + "?");
		$("#footer").append("<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteObject("+id+",'deleteAmenities.html')\">Delete</button>")
	};
	
	function updateAmenities(id,name){
		cleanFooter();
		$("#msgToDisplay").html("Change "+name+" to : <input style=\"width:180px\" id=\"txtInputToUpdate\" type=\"text\">");
		$("#footer").append("<button type=\"button\" class=\"btn btn-success\" onclick=\"upateObject("+id+",'updateAmenities.html','txtInputToUpdate')\">Update</button>")
	};
	
	function upateObject(id, urlPath,idToPickValue){
		$('#DynamicDelete').modal('hide');
		var target = $("#"+idToPickValue).val();
		finalURL = "/MyFlatSpring/admin/"+urlPath;
		$.ajax({
			url : finalURL,
			type : 'POST',
			datatype : 'application/json',
			data : {
				"amenitiesId":id,
				"name":target
			},
			success : function(data) {
				alert("Successfully Updated to "+target);
				$("#home-content").html(data);
			}
		});
	};
	
	function deleteObject(id,urlPath){
		$('#DynamicDelete').modal('hide');
		finalURL = "/MyFlatSpring/admin/"+urlPath;
		$.ajax({
			url : finalURL,
			type : 'POST',
			datatype : 'application/json',
			data : {
				"amenitiesId":id
			},
			success : function(data) {
				alert("Successfully Deleted!");
				$("#home-content").html(data);
			}
		});
		
	}
</script>

</head>
<body>
	<div class="col-lg-8">
		<!-- start:view amenities -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-search"></i> Amenities
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
						<c:if test="${not empty Amenities}">
							<c:forEach items="${Amenities}" var="amenities">
								<tr>
									<td>${amenities.amenitiesName}</td>
									<td><label class="switch switch-yes-no"> <input
											class="switch-input" type="checkbox"
											<c:choose>
								               <c:when test="${amenities.active}">checked="true"</c:when>  
								               <c:when test="${not amenities.active}">false</c:when>
							              	</c:choose>
											onclick="ToggleActive('<c:out value="${amenities.id}"/>',this);" />
											<span class="switch-label" data-on="Yes" data-off="No"></span>
											<span class="switch-handle"></span>
									</label></td>
									<td align="right">
										<button type="button" class="btn btn-danger"
											onclick="deleteAmenities(${amenities.id},'${amenities.amenitiesName}')"
											data-toggle="modal" data-target="#DynamicDelete">
											<i class="fa fa-trash-o" aria-hidden="true"></i>
										</button>
										<button type="button" class="btn btn-default"  data-target="#DynamicDelete"
										data-toggle="modal"
										onclick="updateAmenities(${amenities.id},'${amenities.amenitiesName}')"> 
											<i class="fa fa-pencil-square-o">edit</i>
										</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
		<!-- start:creates new amenities -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-plus"></i> Add Amenities
				</h3>
			</div>
			<div class="panel-body">
				<form:form id="addAmenities" modelAttribute="amenities">
					<table width="100%">
						<tr>
							<td style="padding: 2px;"><input required
								name="amenitiesName" class="form-control"
								placeholder="Amenities Name" type="text"></td>
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

	<div class="modal fade" id="DynamicDelete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h4 id="msgToDisplay">
						<!--  will display dynamic message -->
					</h4>
				</div>
				<div class="modal-footer" id="footer">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>