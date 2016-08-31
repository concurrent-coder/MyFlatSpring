package myflat.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import myflat.dao.AnalysisKeeper;
import myflat.dao.FlatFilterDao;
import myflat.dao.UserDao;
import myflat.model.Amenities;
import myflat.model.BHK;
import myflat.model.Bathroom;
import myflat.model.City;
import myflat.model.Flat;
import myflat.model.State;
import myflat.model.User;
import myflat.model.UserType;
import myflat.utils.ImageUtil;

@Controller
public class WebController {

	public static final String IMG_PATH = "/WEB-INF/MyFlatImg/";

	@Autowired
	private UserDao userDao;

	@Autowired
	private AnalysisKeeper analysisKeeper;

	@Autowired
	private FlatFilterDao filterDao;

	@RequestMapping(value = "/admin/dashboard.html", method = RequestMethod.GET)
	public String adminDashboard(ModelMap models) {
		models.put("TotalCust", analysisKeeper.getTotalCustomers());

		models.put("newCust", analysisKeeper.getNewCustomers());

		models.put("RecentCust", analysisKeeper.getRecent5Customers());

		return "admin/dashboard";
	}

	/** Dealers Start */
	@RequestMapping(value = "/admin/dealers.html", method = RequestMethod.GET)
	public String getDealers(ModelMap models) {
		models.put("Dealers", userDao.getAllUsersByType(UserType.DEALER));
		return "admin/dealers";
	}

	@RequestMapping(value = "/admin/addDealer.html", method = RequestMethod.POST)
	public String addDealers(@ModelAttribute("SpringWeb") User user, HttpServletResponse httpResponse, ModelMap models)
			throws JSONException {
		String strStatus = "fail";
		if (user.getEmail() != null) {
			user.setUserType(UserType.DEALER);
			user.setUserName(user.getEmail());
			User CheckExists = userDao.getUserByEmailIdNType(user.getEmail(), UserType.DEALER.getUserType());
			strStatus = "success";
			if (null != CheckExists) {
				user.setId(CheckExists.getId());
				strStatus = "already";
			}
			user = userDao.addUser(user);
		}
		System.out.println("ADD DEALER STATUS : " + strStatus);
		return getDealers(models);
	}

	@RequestMapping(value = "/admin/updateDealer.html", method = RequestMethod.POST)
	public ResponseEntity<String> updateDealer(@RequestParam("userId") int uid,
			@RequestParam("status") boolean doNotify, HttpServletResponse httpResponse, ModelMap models)
			throws JSONException {

		User user = userDao.getUsersById(uid);
		user.setNotify(doNotify);

		userDao.addUser(user);
		return new ResponseEntity<String>("Updated successfully!", HttpStatus.OK);
	}

	/** Dealer Ends */

	/** Amenities Start */
	@RequestMapping(value = "/admin/amenities.html", method = RequestMethod.GET)
	public String getAmenities(ModelMap models) {
		models.put("Amenities", filterDao.getAllAmenities());
		return "admin/amenities";
	}

	@RequestMapping(value = "/admin/addAmenities.html", method = RequestMethod.POST)
	public String addAmenities(@ModelAttribute("SpringWeb") Amenities amenities, HttpServletResponse httpResponse,
			ModelMap models) throws Exception {
		if (null != amenities.getAmenitiesName() && amenities.getAmenitiesName().trim().length() > 0) {
			try {
				amenities = filterDao.addAmenities(amenities);
			} catch (Exception e) {
				throw new Exception("Unable to perform given operation, either name : "+amenities.getAmenitiesName()+" already exists");
			}
		}
		return getAmenities(models);
	}

	@RequestMapping(value = "/admin/deleteAmenities.html", method = RequestMethod.POST)
	public String delAmenities(@RequestParam("amenitiesId") Long id, ModelMap models) throws JSONException {
		filterDao.deleteAmenitiesById(id);

		return getAmenities(models);
	}

	@RequestMapping(value = "/admin/updateAmenities.html", method = RequestMethod.POST)
	public Object updateAmenities(@RequestParam("amenitiesId") Long amenitiesId,
			@RequestParam(value="status", defaultValue="false") boolean isActive, @RequestParam(value = "name", defaultValue = "") String name,
			HttpServletResponse httpResponse, ModelMap models) throws JSONException {

		Amenities amenities = filterDao.getAmenitiesById(amenitiesId);
		if (!name.isEmpty()) {
			amenities.setAmenitiesName(name);
		} else {
			amenities.setActive(isActive);
		}
		filterDao.addAmenities(amenities);
		
		if(!name.isEmpty())
			return getAmenities(models);
		
		return new ResponseEntity<String>("Updated successfully!", HttpStatus.OK);
	}

	/** Amenities Ends */

	/** BHKs Start */
	@RequestMapping(value = "/admin/bhks.html", method = RequestMethod.GET)
	public String getBHKs(ModelMap models) {
		models.put("Bhk", filterDao.getAllBhks());
		return "admin/bhks";
	}

	@RequestMapping(value = "/admin/addBhks.html", method = RequestMethod.POST)
	public String addBhks(@ModelAttribute("SpringWeb") BHK bhks, HttpServletResponse httpResponse, ModelMap models)
			throws JSONException {
		if (null != bhks.getBhkName() && bhks.getBhkName().trim().length() > 0) {
			bhks = filterDao.addBhk(bhks);
		}
		return getBHKs(models);
	}

	@RequestMapping(value = "/admin/updateBhks.html", method = RequestMethod.POST)
	public ResponseEntity<String> updateBhks(@RequestParam("bhkId") int bhkId, @RequestParam("status") boolean isActive,
			HttpServletResponse httpResponse, ModelMap models) throws JSONException {

		BHK bhk = filterDao.getBhkById(bhkId);
		bhk.setActive(isActive);

		filterDao.addBhk(bhk);
		return new ResponseEntity<String>("Updated successfully!", HttpStatus.OK);
	}

	/** BHKs End */

	/** Bathroom Start */
	@RequestMapping(value = "/admin/bathrooms.html", method = RequestMethod.GET)
	public String getBathrooms(ModelMap models) {
		models.put("Bathroom", filterDao.getAllBathrooms());
		return "admin/bathrooms";
	}

	@RequestMapping(value = "/admin/addBathrooms.html", method = RequestMethod.POST)
	public String addBathrooms(@ModelAttribute("SpringWeb") Bathroom bathroom, HttpServletResponse httpResponse,
			ModelMap models) throws JSONException {
		if (null != bathroom.getBathroomName() && bathroom.getBathroomName().trim().length() > 0) {
			bathroom = filterDao.addBathroom(bathroom);
		}
		return getBathrooms(models);
	}

	@RequestMapping(value = "/admin/updateBathrooms.html", method = RequestMethod.POST)
	public ResponseEntity<String> updateBathrooms(@RequestParam("bathroomId") int bathroomId,
			@RequestParam("status") boolean isActive, HttpServletResponse httpResponse, ModelMap models)
			throws JSONException {

		Bathroom bathroom = filterDao.getBathroomById(bathroomId);
		bathroom.setActive(isActive);

		filterDao.addBathroom(bathroom);
		return new ResponseEntity<String>("Updated successfully!", HttpStatus.OK);
	}

	/** Bathroom End */

	/** Flat Starts */
	@RequestMapping(value = "/admin/flats.html", method = RequestMethod.GET)
	public String getFlats(ModelMap models) {
		models.put("flat", filterDao.getAllFlats());
		models.put("bathroom", filterDao.getActiveBathrooms());

		models.put("amenities", filterDao.getActiveAmenities());
		models.put("bhk", filterDao.getActiveBhks());

		return "admin/flats";
	}

	/** Flat End */

	/**
	 * Query All Active Cities
	 */
	@RequestMapping(value = "/admin/getActiveCities", method = RequestMethod.GET)
	public @ResponseBody Object getActiveCities(@RequestParam("q") String q, HttpServletRequest httpRequest,
			HttpServletResponse httpResponse) {
		List<City> cities = filterDao.getActiveCitiesByName(q);
		Map<String, Long> qResponse = new HashMap<String, Long>(2);
		for (City cc : cities) {
			qResponse.put(cc.getCity(), cc.getId());
		}
		cities = null;
		return qResponse;
	}

	/**
	 * Query All Active States
	 */
	@RequestMapping(value = "/admin/getActiveStates", method = RequestMethod.GET)
	public @ResponseBody Object getActiveStates(@RequestParam("q") String q, HttpServletRequest httpRequest,
			HttpServletResponse httpResponse) {
		List<State> states = filterDao.getActiveStateByName(q);
		Map<String, Long> qResponse = new HashMap<String, Long>(2);
		for (State st : states) {
			qResponse.put(st.getState(), st.getId());
		}
		states = null;
		return qResponse;
	}

	/**
	 * Query All Active Dealers
	 */
	@RequestMapping(value = "/admin/getActiveDealers", method = RequestMethod.GET)
	public @ResponseBody Object getActiveDealers(@RequestParam("q") String q, HttpServletRequest httpRequest,
			HttpServletResponse httpResponse) {
		List<User> dealers = filterDao.getActiveDealersByName(q);
		Map<String, Long> qResponse = new HashMap<String, Long>(2);
		for (User usr : dealers) {
			qResponse.put(usr.getFirstName() + " " + usr.getLastName(), usr.getId());
		}
		dealers = null;
		return qResponse;
	}

	@RequestMapping(value = "/admin/updateFlats.html", method = RequestMethod.POST)
	public ResponseEntity<String> updateFlat(@RequestParam("flatId") Long flatId,
			@RequestParam("status") boolean isActive, HttpServletResponse httpResponse, ModelMap models)
			throws JSONException {

		Flat flat = filterDao.getFlatById(flatId);
		flat.setActive(isActive);

		filterDao.addFlat(flat);
		return new ResponseEntity<String>("Updated successfully!", HttpStatus.OK);
	}

	/** add new Flat */
	@RequestMapping(value = "/admin/addFlats.html", method = RequestMethod.POST)
	public String addFlats(@RequestParam("title") String title, @RequestParam("description") String description,
			@RequestParam("area") String area, @RequestParam("bathroom") Long bathroomId,
			@RequestParam("bhk") Long bhkId, @RequestParam(value = "cityId", defaultValue = "0") Long cityId,
			@RequestParam(value = "stateId", defaultValue = "0") Long stateId,
			@RequestParam(value = "dealerId", defaultValue = "0") Long dealerId, @RequestParam("city") String strCity,
			@RequestParam("state") String strState, @RequestParam("dealer") String strDealer, ModelMap models,
			@RequestParam("amenities") String[] amenities, @RequestParam("priceFrom") String priceFrom,
			@RequestParam("priceTo") String priceTo) throws JSONException {

		if (dealerId > 0) {
			Flat flat = new Flat();
			flat.setTitle(title);
			flat.setDescription(description);
			{
				City c = new City();
				if (cityId == 0) {
					c.setCity(strCity);
					c = filterDao.addCity(c);
				} else {
					c.setId(cityId);
				}
				flat.setCity(c);
			}
			{
				User u = new User();
				u.setId(dealerId);
				flat.setDealer(u);
			}
			flat.setArea(area);
			{
				State st = new State();
				if (stateId == 0) {
					st.setState(strState);
					st = filterDao.addState(st);
				} else {
					st.setId(stateId);
				}
				flat.setState(st);
			}
			{
				Bathroom b = new Bathroom();
				b.setId(bathroomId);
				flat.setBathroom(b);
			}
			{
				BHK b = new BHK();
				b.setId(bhkId);
				flat.setBhk(b);
			}
			{
				// List<Amenities> flatAmenities = flat.getAmenities();
				Set<Amenities> flatAmenities = flat.getAmenities();
				for (String amenity : amenities) {
					Amenities a = filterDao.getAmenitiesById(Long.valueOf(amenity));
					flatAmenities.add(a);
					a = null;
				}
			}
			flat.setPriceFrom(priceFrom);
			flat.setPriceTo(priceTo);

			filterDao.addFlat(flat);
		}

		return getFlats(models);
	}

	@RequestMapping(value = "/admin/uploadFlatImg", method = RequestMethod.POST)
	public String save(HttpServletRequest request, HttpServletResponse response, ModelMap models,
			@RequestParam(value = "flatId", defaultValue = "0") Long flatId,
			@RequestParam("file") MultipartFile multipartFile) throws FileUploadException, IOException {
		Flat flat = filterDao.getFlatById(flatId);
		String rpath = request.getRealPath("/");

		String imgName = UUID.randomUUID().toString();

		rpath = rpath + IMG_PATH + "/" + imgName;

		if (null == flat.getThumbnail())
			flat.setThumbnail(ImageUtil.resizer(multipartFile.getInputStream(), 420, 200, "jpeg"));

		boolean isSaved = false;
		if (null == flat.getFlatImg1Name() || flat.getFlatImg1Name().isEmpty()) {
			flat.setFlatImg1Name(imgName);
			isSaved = true;
		} else if (null == flat.getFlatImg2Name() || flat.getFlatImg2Name().isEmpty()) {
			flat.setFlatImg2Name(imgName);
			isSaved = true;
		} else if (null == flat.getFlatImg3Name() || flat.getFlatImg3Name().isEmpty()) {
			flat.setFlatImg3Name(imgName);
			isSaved = true;
		}

		if (isSaved) {
			File imgFile = new File(rpath);
			try {
				imgFile.getParentFile().mkdirs();
				multipartFile.transferTo(imgFile);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				imgFile = null;
				filterDao.addFlat(flat);
				return getFlats(models);
			}
		}
		return "only 3 Images are required";
	}

	@RequestMapping(value = "/getImage/{imageId}")
	@ResponseBody
	public byte[] getImage(@PathVariable String imageId, HttpServletRequest request) throws IOException {
		String rpath = request.getRealPath("/");
		rpath = rpath + IMG_PATH + "/" + imageId; // whatever path you used for
		Path path = Paths.get(rpath);
		byte[] data = Files.readAllBytes(path);
		return data;
	}

	@RequestMapping(value = "/admin/login.html", method = RequestMethod.GET)
	public String adminLogin() {
		return "admin/login";
	}

	@RequestMapping(value = "/admin/logOut.html", method = RequestMethod.GET)
	public void signOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		response.sendRedirect("/MyFlatSpring/admin/login.html");
	}

	@RequestMapping(value = "/admin/checklogin.html", method = RequestMethod.POST)
	public String checkAdminLogin(@RequestParam("email") String userName, @RequestParam("passwd") String password,
			ModelMap models, HttpServletRequest request) throws NoSuchAlgorithmException {

		if (userDao.isValidAdmin(userName, getMD5(password))) {
			User um = userDao.getUserDetail(userName, getMD5(password));
			request.getSession().setAttribute("loginName", um.getFirstName());
			models.put("userDetail", um);
			return adminDashboard(models);
		}
		models.put("v", false);
		return "redirect:" + "/admin/login.html";
	}

	@RequestMapping(value = "/admin/addadminadd.html", method = RequestMethod.GET)
	public @ResponseBody Object addAdminUser(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email,
			@RequestParam("passwd") String passwd) throws NoSuchAlgorithmException {

		User user = new User();
		user.setActive(true);
		user.setFirstName("Rohan");
		user.setLastName("Singh");
		user.setEmail("rohansinghmyflat@gmail.com");
		user.setPassword(getMD5("MyFL@TR0H@NS!NGH"));
		user.setUserType(UserType.ADMIN);
		user.setPhoneNumber("989898989");
		userDao.addUser(user);

		return user;
	}

	private String getMD5(String passwd) throws NoSuchAlgorithmException {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		return new String(md5.digest(passwd.getBytes()));
	}

}
