/**
 * used for admin Dashboard purpose..
 */

$(document).ready(function() {
	console.log("****** aha! so you know how to debug ********");
});

document.onreadystatechange = function(e) {
	$("div#divLoading").addClass('show');
	if (document.readyState === 'complete') {
		$("div#divLoading").removeClass('show');
	}
};

function getDealers(ele) {
	var urlPath = "/dealers.html";
	$("#dashboardMenu li").removeClass("active");
	getterController(urlPath, ele);
};

function getterController(href, ele) {
	$("div#divLoading").addClass('show');
	var finalURL = "";
	finalURL = "/MyFlatSpring/admin" + href;
	$.ajax({
		url : finalURL,
		type : 'GET',
		success : function(data) {
			$("#home-content").html(data);
			$(ele).parent('li').attr('class', 'active');
			$("div#divLoading").removeClass('show');
		}
	});
};

function getAmenities(ele) {
	var urlPath = "/amenities.html";
	$("#dashboardMenu li").removeClass("active");
	getterController(urlPath, ele);
};

function getBHKs(ele) {
	var urlPath = "/bhks.html";
	$("#dashboardMenu li").removeClass("active");
	getterController(urlPath, ele);
};

function getBathrooms(ele) {
	var urlPath = "/bathrooms.html";
	$("#dashboardMenu li").removeClass("active");
	getterController(urlPath, ele);
};

function getFlats(ele) {
	var urlPath = "/flats.html";
	$("#dashboardMenu li").removeClass("active");
	getterController(urlPath, ele);
};

