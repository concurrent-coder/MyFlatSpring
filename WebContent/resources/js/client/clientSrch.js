/**
 * Understand a code is fine, but by doing copy&paste you're not going lie to
 * yourself!, Don't you?
 */

$(document).ready(function() {
	console.log("****** aha! so you know how to debug ********");
});

var nPage = 0;
var jsonSearch = {};

function getAreas() {

	var cityId = $("#drpCities").val();
	if (cityId < 0) {
		alert("Please select Location !");
		return false;
	}

	var finalURL = "";
	finalURL = "/MyFlatSpring/getCitiesArea.html";
	$.ajax({
		url : finalURL,
		type : 'GET',
		headers : {
			Accept : "application/json"
		},
		data : 'cityId=' + cityId,
		success : function(data) {
			var jsonArray = $.parseJSON(data);
			$("#drpAreas").html("");
			for (var i = 0; i < jsonArray.length; i++) {
				$("#drpAreas").append(
						"<option value='" + jsonArray[i] + "'>" + jsonArray[i]
								+ "</option>")
			}
		}
	});
};

function getSrchResult() {
	var jArea = [];
	var jAmenities = [];

	var jBHK = [];
	var jBathroom = [];

	$("input[name=chkArea]:checked").each(function() {
		jArea.push($(this).val());
	});
	jsonSearch["Area"] = jArea;

	$("input[name=chkAmenities]:checked").each(function() {
		jAmenities.push($(this).val());
	});
	jsonSearch["Amenities"] = jAmenities;

	$("input[name=chkBHKs]:checked").each(function() {
		jBHK.push($(this).val());
	});
	jsonSearch["BHK"] = jBHK;

	$("input[name=chkBathroom]:checked").each(function() {
		jBathroom.push($(this).val());
	});
	jsonSearch["Bathroom"] = jBathroom;

	searchFlat();
};

function setPage(p) {
	nPage = p;
	searchFlat();
};

function searchFlat() {
	jsonSearch["page"] = nPage;
	jsonSearch["cityid"] = nCityId;

	console.log(jsonSearch)

	// window.transfer("/MyFlatSpring/client/srch?srchJSON="+JSON.stringify(jsonSearch));

	var finalURL = "/MyFlatSpring/srchFilter.html";
	$
			.ajax({
				url : finalURL,
				type : 'GET',
				headers : {
					Accept : "application/json"
				},
				data : 'SrchFilter=' + JSON.stringify(jsonSearch),
				success : function(data) {
					var result = JSON.parse(data);
					
					var divSrch = "";

					for (var i = 0; i < result.length; i++) {
						divSrch += "<div class=\"col-md-4 text-center col-sm-6 col-xs-6\">"
						divSrch += "								<div class=\"thumbnail\">"
						divSrch += "									<img src=\"data:image/jpeg;base64,"+result[i].thmbLink+"\" alt=\"\">"
						divSrch += "									<div class=\"caption\">"
						divSrch += "										<h4>"
						divSrch += "											<a href=\"flatDtl.html?flatId="+result[i].id+"\">"+result[i].title+"</a>"
						divSrch += "										</h4>"
						divSrch += "										<p>"
						divSrch += "											<a href=\"flatDtl.html?flatId="+result[i].id+"\" class=\"btn btn-primary\"  role=\"button\">See Details</a>"
						divSrch += "										</p>"
						divSrch += "									</div>"
						divSrch += "								</div>"
						divSrch += "							</div>"
					}
					$("#srchResult").html(divSrch);
				}
			});
};

