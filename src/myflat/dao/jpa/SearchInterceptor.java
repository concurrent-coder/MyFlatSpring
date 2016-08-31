package myflat.dao.jpa;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myflat.model.Flat;
import myflat.utils.CommonUtils;

@Repository
public class SearchInterceptor {

	@PersistenceContext
	private EntityManager entityManager;

	private Integer cityId;
	private List<String> areaList;
	private List<String> bhks;
	private List<Integer> bathrooms;
	private List<Integer> amenities;
	private String rangeFrom;
	private String rangeTo;
	private Integer page;
	
	private List<Flat> flatResult = null;

	private static final Integer LIMIT = 20;

	public SearchInterceptor usingCityId(Integer cityId) {
		this.cityId = cityId;
		return this;
	}

	public SearchInterceptor usingArea(List<String> areas) {
		this.areaList = areas;
		return this;
	}

	public SearchInterceptor usingArea(JSONArray jAreas) {
		if (null == jAreas || jAreas.length() == 0)
			return this;

		this.areaList = new ArrayList<String>(0);
		String[] ja = CommonUtils.transformJSONArray2StringArray(jAreas);
		for (String a : ja)
			areaList.add(a);

		ja = null;

		return this;
	}

	public SearchInterceptor usingBathrooms(JSONArray jBathroom) {
		if (jBathroom.length() == 0)
			return this;

		this.bathrooms = new ArrayList<>(0);

		String[] ja = CommonUtils.transformJSONArray2StringArray(jBathroom);
		for (String a : ja)
			bathrooms.add(Integer.valueOf(a));

		ja = null;

		return this;
	}

	public SearchInterceptor usingAmenities(JSONArray jAmenities) {
		if (jAmenities.length() == 0)
			return this;

		this.amenities = new ArrayList<>(0);

		String[] ja = CommonUtils.transformJSONArray2StringArray(jAmenities);
		for (String ame : ja) {
			amenities.add(Integer.valueOf(ame));
		}
		ja = null;
		return this;
	}

	public SearchInterceptor usingBHK(JSONArray jBHK) {
		if (jBHK.length() == 0)
			return this;

		this.bhks = new ArrayList<>(0);

		String[] ja = CommonUtils.transformJSONArray2StringArray(jBHK);
		for (String a : ja)
			bhks.add(a);

		ja = null;

		return this;
	}

	public SearchInterceptor usingBathrooms(Integer[] integers) {
		this.bathrooms = Arrays.asList(integers);
		return this;
	}

	public SearchInterceptor usingPage(Integer page) {
		this.page = page;
		return this;
	}

	public SearchInterceptor usingPriceRangeFrom(String rsRangeFrom) {
		this.rangeFrom = rsRangeFrom;
		return this;
	}

	public SearchInterceptor usingPriceRangeTo(String rsRangeTo) {
		this.rangeTo = rsRangeTo;
		return this;
	}

	@Transactional
	public SearchInterceptor process() {
		String query = "from Flat where 1=1 ";

		if (null != cityId && cityId > 0)
			query += " and city=" + cityId;

		if (null != areaList && !areaList.isEmpty()) {
			String str = convertListToCommaSeparatedString(areaList);
			if (null != str)
				query += " and area in (" + str + ")";
		}

		if ((null != rangeFrom && !rangeFrom.isEmpty()))
			query += " and priceFrom >= " + rangeFrom;

		if ((null != rangeTo && !rangeTo.isEmpty()))
			query += " and priceTo <= " + rangeTo;

		if (null != bathrooms && !bathrooms.isEmpty()) {
			String str = convertListToCommaSeparatedString(bathrooms);
			if (null != str)
				query += " and bathroom in (" + str + ")";
		}

		if (null != bhks && !bhks.isEmpty()) {
			String str = convertListToCommaSeparatedString(bhks);
			if (null != str)
				query += " and bhk in (" + str + ")";
		}

		// query += " limit "+page+","+LIMIT;

		flatResult = entityManager.createQuery(query, Flat.class).getResultList();
		System.out.println("Record found: "+flatResult.size());
		return this;
	}

	private String convertListToCommaSeparatedString(List<?> list) {
		StringBuffer sb = new StringBuffer();

		list.stream().filter(L -> {
			if (null == L)
				return false;

			return true;
		}).forEach(L -> {
			if (L instanceof String)
				sb.append("'" + L + "',");

			if (L instanceof Integer)
				sb.append(String.valueOf(L + ","));
		});

		if (sb.length() > 0)
			return sb.substring(0, sb.length() - 1);

		return null;
	}
	
	public JSONArray toJSONObject() throws JSONException{
		if(flatResult == null)
			return new JSONArray("-1");

		JSONArray ja = new JSONArray();
		flatResult.stream()
			.forEach(flat->{
				try {
					JSONObject j = new JSONObject();
					j.put("id", flat.getId());
					j.put("title", flat.getTitle());
					j.put("thmbLink", flat.getThumbToString());
					ja.put(j);
					
					j = null;
				} catch (Exception e) {
				}
			});
		return ja;
	}
	
	public List<Flat> toList(){
		return flatResult;
	}
}
