package myflat.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import myflat.dao.AnalysisKeeper;
import myflat.dao.FlatFilterDao;
import myflat.dao.MessageService;
import myflat.dao.jpa.SearchInterceptor;
import myflat.model.Amenities;
import myflat.model.BHK;
import myflat.model.Bathroom;
import myflat.model.Customer;
import myflat.model.Flat;
import myflat.srch.model.Area;
import myflat.utils.CommonUtils;

@Controller
public class ClientController {

	@Autowired
	private FlatFilterDao filterDao;

	@Autowired
	private AnalysisKeeper analysisKeeper;
	
	@Autowired
	private SearchInterceptor srchInterceptor;

	@Autowired
	private MessageService mailService;
	
	@RequestMapping({ "index.html" })
	public String userIndex(ModelMap models) {

		models.addAttribute("cities", filterDao.getCities());
		models.addAttribute("bathrooms", filterDao.getActiveBathrooms());
		Map<String, List<Object>> priceRange = filterDao.getFlatPriceRange();

		List<String> fromRange = new ArrayList<>();
		List<Object> from = priceRange.get("FROM");
		for (Object obj : from) {
			fromRange.add(String.valueOf(obj));
		}

		List<String> toRange = new ArrayList<>();
		List<Object> to = priceRange.get("TO");
		for (Object obj : to) {
			toRange.add(String.valueOf(obj));
		}

		models.addAttribute("fromRange", fromRange);
		models.addAttribute("toRange", toRange);

		return "index";
	}

	@RequestMapping(value = "getCitiesArea.html", method = RequestMethod.GET)
	public @ResponseBody String getCitiesArea(@RequestParam("cityId") Integer nCityId) {
		List<Flat> flats = filterDao.getAreasByCityId(nCityId);
		JSONArray areas = new JSONArray();
		
		for (Flat flat : flats) {
			if(!areas.toString().toLowerCase().contains(flat.getArea().toLowerCase()))
				areas.put(flat.getArea());
		}
		flats = null;
		return areas.toString();
	}

	@RequestMapping({ "srch.html" })
	public String srchResult(ModelMap models, @RequestParam("bthBtwn1") Integer bathrom1,
			@RequestParam("bthBtwn2") Integer bathrom2, @RequestParam("cityId") Integer cityId,
			@RequestParam("area") String area, @RequestParam("RsRangeFrom") String RsRangeFrom,
			@RequestParam("RsRangeTo") String RsRangeTo, @RequestParam(value = "page", defaultValue = "0") int nPage) {

		models.addAttribute("Amenities", filterDao.getActiveAmenities());

		List<Bathroom> bathrooms = filterDao.getActiveBathrooms();
		bathrooms.stream().filter(b -> {
			if (null == bathrom1 || null == bathrom2)
				return false;
			return true;
		}).forEach(bath -> {
			if ((bath.getId().intValue() == bathrom1.intValue()) || (bath.getId().intValue() == bathrom2.intValue()))
				bath.setSelected(true);
		});

		models.addAttribute("bathroom", bathrooms);
		List<BHK> bhks = filterDao.getActiveBhks();
		List<String> areas = filterDao.getDistinctAreas();

		List<Area> areaList = new ArrayList<>(0);

		areas.stream().forEach(ar -> {
			Area a = new Area();
			a.setAreaName(ar);
			if (ar.equals(area)) {
				a.setSelected(true);
			}
			areaList.add(a);
		});
		areas = null;

		models.addAttribute("bhk", bhks);
		models.addAttribute("area", areaList);

		List<Flat> srchResult = srchInterceptor.usingCityId(cityId).usingArea(Arrays.asList(area))
				.usingBathrooms(new Integer[] { bathrom1, bathrom2 }).usingPriceRangeFrom(RsRangeFrom)
				.usingPriceRangeTo(RsRangeTo).usingPage(nPage).process().toList();

		srchResult.stream().forEach(flat -> {
			flat.setThumbToString("");
		});
		models.addAttribute("result", srchResult);
		models.addAttribute("page", nPage);
		models.addAttribute("cityId", cityId);
		return "srch";
	}

	@RequestMapping(value = "srchFilter.html", method = RequestMethod.GET)
	public @ResponseBody String SrchFilter(@RequestParam("SrchFilter") String jFilter) throws JSONException {

		JSONArray strResult = null;
		if (jFilter != null && !jFilter.isEmpty()) {
			JSONObject jSearch = new JSONObject(jFilter);

			strResult = srchInterceptor.usingCityId(jSearch.optInt("cityid")).usingArea(jSearch.optJSONArray("Area"))
					.usingBathrooms(jSearch.optJSONArray("Bathroom")).usingAmenities(jSearch.optJSONArray("Amenities"))
					.usingBHK(jSearch.optJSONArray("BHK")).usingPage(jSearch.optInt("page")).process().toJSONObject();
		}
		return strResult.toString();
	}

	@RequestMapping(value = "contact-us.html", method = RequestMethod.GET)
	public String loadContactUs(ModelMap model) {
		model.put("company", filterDao.getCompanyAddress());
		return "contactus";
	}

	@RequestMapping(value = "flatDtl.html", method = RequestMethod.GET)
	public String loadFlatDetails(HttpServletResponse response,HttpServletRequest request,
			@CookieValue(value = "idenUs4Dlr", defaultValue = "0") String cookie,
			@RequestParam("flatId") Long flatId, ModelMap model) {

		Flat flat = filterDao.getFlatById(flatId);
		model.addAttribute("flat", flat);
		List<Amenities> amenities = new ArrayList<Amenities>(flat.getAmenities());

		model.addAttribute("amenities", amenities);
		model.addAttribute("uidFromServer", UUID.randomUUID().toString());
		
		if((CommonUtils.validateUUID(cookie) || isCookieExpire(request))){
			model.addAttribute("dealer", flat.getDealer());
		}
		return "flatDtl";
	}
	
	private boolean isCookieExpire(HttpServletRequest request){
		Map cookieMap = new HashMap();
		if(request==null || request.getCookies()==null || request.getCookies().length==0)
			return false;
		
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie : cookies){
		    cookieMap.put(cookie.getName(), cookie);
		}
		
		if(cookieMap.get("idenUs4Dlr")==null)
			return false;
		
		return true;
	}

	@RequestMapping(value = "getDealerInfo.html", method = RequestMethod.POST)
	public void getDealerInfo(@RequestParam("txtMob") String customerMob, 
			@RequestParam("txtname") String usrName,
			ModelMap model,
			@RequestParam("uids") String uuidToValidate, @RequestParam("flatId") Long flatId,
			HttpServletResponse response,HttpServletRequest request) throws IOException {
		Cookie cookie = null;
		String cookieId = UUID.randomUUID().toString();
		
		if (null != uuidToValidate && CommonUtils.validateUUID(uuidToValidate)) {
			cookie = new Cookie("idenUs4Dlr", cookieId); // bake
																			// cookie
			cookie.setMaxAge(36000); // set expire time to 1000 sec
			response.addCookie(cookie); // put cookie in response
			
			{
				Customer cust = new Customer();
				cust.setCustomerName(usrName);
				cust.setPhoneNumber(customerMob);
				cust.setCreatedDate(new Date());
				cust.setModifiedDate(new Date());

				analysisKeeper.saveCustomerDetail(cust);
			}
		}

		response.sendRedirect("flatDtl.html?flatId="+flatId);
	}
	
	@RequestMapping(value="sendMessage.html",method = RequestMethod.POST)
	public String sendMessageToOwner(@RequestParam("name") String userName,@RequestParam("email") String email,
			@RequestParam("message") String message,ModelMap model){
		
		mailService.sendMessage(filterDao.getCompanyAddress().getCompanyEmail(), "Admin", "MyFlat - Contactus interest by "+userName, message,email);
		model.put("responseMessage", "Thank you "+ userName + " for contacting us. Will get back to you soon !");
		return loadContactUs(model);
	}

}
