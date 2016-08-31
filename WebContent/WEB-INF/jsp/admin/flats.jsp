<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:if test="${empty sessionScope.loginName}">
	    <c:redirect url="/admin/login.html"/>
	</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<c:url value="/resources/js/bootstrap-typeahead.js"/>"></script>

<!--  Multiselect CSS and JS -->

<link href="<c:url value="/resources/css/bootstrap-multiselect.css"/>"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/bootstrap-multiselect.js"/>"></script>

<style type="text/css">
#addFlat td {
	padding-top: 4px;
	padding-bottom: 4px;
}

#addFlat .error {
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
	var cityMap = {};
	var cityArray = [];

	var stateMap = {};
	var stateArray = [];

	var dealerMap = {};
	var dealerArray = [];

	$(document)
			.ready(
					function() {

						$('#txtCity')
								.typeahead(
										{
											source : function(query, process) {
												$
														.ajax({
															url : '/MyFlatSpring/admin/getActiveCities',
															type : 'GET',
															headers : {
																Accept : "application/json"
															},
															data : 'q=' + query,
															success : function(
																	data) {
																cityMap = {};
																cityArray = [];
																for ( var i in data) {
																	cityMap[i] = data[i];
																	cityArray
																			.push(i);
																}
																process(cityArray);
															}
														});
											}
										});

						$('#txtState')
								.typeahead(
										{
											source : function(query, process) {
												$
														.ajax({
															url : '/MyFlatSpring/admin/getActiveStates',
															type : 'GET',
															headers : {
																Accept : "application/json"
															},
															data : 'q=' + query,
															success : function(
																	data) {
																stateMap = {};
																stateArray = [];
																for ( var i in data) {
																	stateMap[i] = data[i];
																	stateArray
																			.push(i);
																}
																process(stateArray);
															}
														});
											}
										});

						$('#txtDealer')
								.typeahead(
										{
											source : function(query, process) {
												$
														.ajax({
															url : '/MyFlatSpring/admin/getActiveDealers',
															type : 'GET',
															headers : {
																Accept : "application/json"
															},
															data : 'q=' + query,
															success : function(
																	data) {
																dealerMap = {};
																dealerArray = [];
																for ( var i in data) {
																	dealerMap[i] = data[i];
																	dealerArray
																			.push(i);
																}
																process(dealerArray);
															}
														});
											}
										});

						$("#addFlat")
								.validate(
										{
											errorPlacement : function() {
												return false;
											},
											submitHandler : function(form) {

												var isDealer = (dealerMap[$(
														"#txtDealer").val()] > 0);
												if (isDealer == false) {
													alert("Please select proper dealer, or add before selection");
													$("#txtDealer").addClass(
															"error");
													return false;
												}

												var num = isNumber($(
														"#txtPriceFrom").val());
												if (num == false) {
													return false;
												}

												num = isNumber($("#txtPriceTo")
														.val());
												if (num == false) {
													return false;
												}

												$("#btnSubmit").attr(
														"disabled", "disabled");
												var flats = $("#addFlat")
														.serialize();

												var cityId = cityMap[$(
														"#txtCity").val()];
												if (cityId > 0) {
													flats += "&cityId="
															+ cityId;
												}
												var stateId = stateMap[$(
														"#txtState").val()];
												if (stateId > 0) {
													flats += "&stateId="
															+ stateId;
												}
												flats += "&dealerId="
														+ dealerMap[$(
																"#txtDealer")
																.val()];

												var myFile = document
														.getElementById('fileinput');

												$('#myAddFlatModal').modal(
														'hide');
												finalURL = "/MyFlatSpring/admin/addFlats.html";
												$
														.ajax({
															url : finalURL,
															type : 'POST',
															datatype : 'application/json',
															data : flats,
															success : function(
																	data) {
																$("#btnSubmit")
																		.removeAttr(
																				"disabled");
																$(
																		"#home-content")
																		.html(
																				data);

															},
															error : function(e) {
																console.log(e);
															}
														});
											}
										});

					});

	function ToggleActive(flatId, ele) {
		finalURL = "/MyFlatSpring/admin/updateFlats.html";
		$.ajax({
			url : finalURL,
			type : 'POST',
			datatype : 'application/json',
			data : {
				"flatId" : flatId,
				"status" : $(ele).is(':checked')
			},
			success : function(data) {
			}
		});
	}

	$('#drpAmenities').multiselect({
		enableClickableOptGroups : true,
		maxHeight : '300',
		buttonWidth : '235',

		onChange : function(element, checked) {
			var brands = $('#drpAmenities option:selected');
			var selected = [];
			$(brands).each(function(index, brand) {
				selected.push([ $(this).val() ]);
			});

		}
	});
	
	function setModal(id,title){
		$("#myModalImgUploadLabel").html("Upload Image - "+title);
		$("#flatId").val(id);
		$("#btnImgUpload").attr("disabled","disabled");
	}
	
	var files = [];
	$("#imgFlatfile").change(function(event){
	    var file = this.files[0];
	    var name = file.name;
	    var size = file.size;
	    var type = file.type;
	    
	    var isInvalid = false;
	    
	    if(size>2750655)
	    	isInvalid = true;
	    
	    if(type!="image/jpeg")
	    	isInvalid = true;
	    
	    $("#btnImgUpload").attr("disabled","disabled");
	    if(isInvalid){
	    	alert("either file size is greater than 2MB or invalid file type");
	    }else{
	    	$("#btnImgUpload").removeAttr("disabled");
	    }
	    files=event.target.files;
	});
	
	$('#btnImgUpload').click(function(){
		var oMyForm = new FormData();
		oMyForm.append("file", files[0]);
		oMyForm.append("flatId", $("#flatId").val());
	    $.ajax({
	        url: 'uploadFlatImg',  //Server script to process data
	        type: 'POST',
	        xhr: function() {  // Custom XMLHttpRequest
	            var myXhr = $.ajaxSettings.xhr();
	            if(myXhr.upload){ // Check if upload property exists
	                myXhr.upload.addEventListener('div.imgProgressbar',progressHandlingFunction, false); 
	            	// For handling the progress of the upload
	            }
	            return myXhr;
	        },
	        //Ajax events
	        success: completeHandler,
	        error: errorHandler,
	        // Form data
	        data: oMyForm,
	        //Options to tell jQuery not to process data or worry about content-type.
	        cache: false,
	        contentType: false,
	        processData: false
	    });
	});
	
	function progressHandlingFunction(e){
	    if(e.lengthComputable){
	        $('#imgProgressbar').attr({"aria-valuenow":e.loaded,"aria-valuemax":e.total,"width":e.loaded});
	    }
	}
	
	function completeHandler(){
		$('#myFlatImgUpload').modal('hide');
		alert("image upload Successfullt!");
	}
	
	function errorHandler(e){
		alert("Error in uploading, either file size is too big.");
	}
</script>

</head>
<body>
	<div class="col-lg-12">
		<!-- start:view flats -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-search"></i> Flat(s)

					<div style="float: right;">
						<button type="button" class="btn btn-info btn-xs"
							data-toggle="modal" data-target="#myAddFlatModal">
							<i class="fa fa-plus fa-2x"></i>
						</button>
					</div>
				</h3>
			</div>
			<div class="panel-body table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>City</th>
							<th>Active</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty flat}">
							<c:forEach items="${flat}" var="flat">
								<tr>
									<td><span type="button" class="btn btn-info btn-xs"
										onclick="setModal(${flat.id},'${flat.title}');"
										data-toggle="modal" data-target="#myFlatImgUpload"> <i
											class="fa fa-image fa-2x"></i>
									</span> ${flat.title}</td>
									<td>${flat.city.city}</td>
									<td><label class="switch switch-yes-no"> <input
											class="switch-input" type="checkbox"
											<c:choose>
								               <c:when test="${flat.active}">checked="true"</c:when>  
								               <c:when test="${not flat.active}">false</c:when>
							              	</c:choose>
											onclick="ToggleActive('<c:out value="${flat.id}"/>',this);" />
											<span class="switch-label" data-on="Yes" data-off="No"></span>
											<span class="switch-handle"></span>
									</label></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myFlatImgUpload" tabindex="-1"
		role="dialog" aria-labelledby="myModalImgUploadLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalImgUploadLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="progress" >
						<!-- <div id="imgProgressbar" class="progress-bar progress-bar-striped active"
							role="progressbar" aria-valuenow="45" aria-valuemin="0"
							aria-valuemax="100" style="width: 5%">
						</div> -->
					</div>
					<form id="frmImageUpload" enctype="multipart/form-data">
						<input type="hidden" id="flatId" name="flatId" value=""> <input
							id="imgFlatfile" name="imgFlatfile" type="file" /> <input
							type="button" id="btnImgUpload" value="Upload"
							class="btn btn-primary" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myAddFlatModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-plus"></i> Add flat detail.
							</h3>
						</div>
						<div class="panel-body table-responsive">
							<form:form id="addFlat" enctype="multipart/form-data">
								<table width="100%" class="table-condensed">
									<tr>
										<td>Title</td>
										<td colspan="4"><input id="txtTitle"
											class="span3 form-control" required name="title"
											placeholder="eg. name of Flat"
											style="width: 99%; padding: 2px;">
									</tr>
									<tr>
										<td>Description</td>
										<td colspan="4"><textarea id="txtDesc"
												style="width: 99%;" name="description" rows="5"
												placeholder="give complete description about flat"></textarea>
									</tr>
									<tr>
										<td>Area</td>
										<td><input id="txtArea" class="span3" name="area"
											placeholder="eg. C.G Road">
										<td>Bathroom(s)</td>
										<td><c:if test="${not empty bathroom}">
												<select id="drpBathroom" required name="bathroom">
													<c:forEach items="${bathroom}" var="bath">
														<option id="${bath.id}" value="${bath.id}">${bath.bathroomName}</option>
													</c:forEach>
												</select>
											</c:if> <c:if test="${empty bathroom}">
												<select disabled id="drpBathroom">
													<option value="-1">add new bathroom</option>
												</select>
											</c:if></td>
									</tr>
									<tr>
										<td>BHK</td>
										<td><c:if test="${not empty bhk}">
												<select id="drpBhk" required name="bhk">
													<c:forEach items="${bhk}" var="bhk">
														<option id="${bhk.id}" value="${bhk.id}">${bhk.bhkName}</option>
													</c:forEach>
												</select>
											</c:if> <c:if test="${empty bhk}">
												<select disabled id="drpBhk">
													<option value="-1">add BHK</option>
												</select>
											</c:if></td>
									</tr>
									<tr>
										<td>City</td>
										<td><input id="txtCity" class="span3"
											data-provide="typeahead" data-items="4" required name="city"
											type="text" autocomplete="off"></td>
										<td>State</td>
										<td><input id="txtState" class="span3" required
											name="state" data-provide="typeahead" data-items="4"
											type="text" autocomplete="off"></td>

									</tr>
									<tr>
										<td>Dealer</td>
										<td><input id="txtDealer" class="span3" required
											name="dealer" data-provide="typeahead" data-items="4"
											type="text" autocomplete="off"></td>

										<td>Amenities</td>
										<td><c:if test="${not empty amenities}">
												<select id="drpAmenities" required name="amenities"
													multiple="multiple">
													<optgroup label="Basic">
														<c:forEach items="${amenities}" var="ame">
															<option id="${ame.id}" value="${ame.id}">${ame.amenitiesName}</option>
														</c:forEach>
													</optgroup>
												</select>
											</c:if> <c:if test="${empty amenities}">
												<select disabled id="drpAmenities">
													<option value="-1">add new amenities</option>
												</select>
											</c:if></td>
									</tr>
									<tr>
										<td>Range :</td>
										<td><input id="txtPriceFrom" class="span3" required
											name="priceFrom" data-provide="typeahead" data-items="4"
											type="text" autocomplete="off"></td>
										<td>To :</td>
										<td><input id="txtPriceTo" class="span3" required
											name="priceTo" data-provide="typeahead" data-items="4"
											type="text" autocomplete="off"></td>
									</tr>
								</table>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="submit" id="btnSubmit" class="btn btn-primary">Submit</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /.modal -->

</body>
</html>