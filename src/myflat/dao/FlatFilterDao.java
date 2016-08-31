package myflat.dao;

import java.util.List;
import java.util.Map;

import myflat.model.Amenities;
import myflat.model.BHK;
import myflat.model.Bathroom;
import myflat.model.City;
import myflat.model.Company;
import myflat.model.Flat;
import myflat.model.State;
import myflat.model.User;

public interface FlatFilterDao {

	List<Amenities> getAllAmenities();
	
	List<Amenities> getActiveAmenities();

	Amenities addAmenities(Amenities amenities);

	Amenities getAmenitiesById(Long amenitiesId);

	List<BHK> getAllBhks();

	BHK addBhk(BHK bhks);

	BHK getBhkById(int bhkId);

	List<BHK> getActiveBhks();

	List<Bathroom> getAllBathrooms();

	Bathroom addBathroom(Bathroom bathroom);

	Bathroom getBathroomById(int bathroomId);

	List<Bathroom> getActiveBathrooms();

	List<Flat> getAllFlats();

	List<City> getActiveCitiesByName(String strname);

	List<State> getActiveStateByName(String q);

	List<User> getActiveDealersByName(String q);

	Flat addFlat(Flat flat);

	City addCity(City c);

	State addState(State st);

	List<Flat> getAreasByCityId(Integer nCityId);

	List<City> getCities();

	Map<String, List<Object>> getFlatPriceRange();

	List<String> getDistinctAreas();

	Flat getFlatById(Long flatId);

	Company getCompanyAddress();

	void deleteAmenitiesById(Long aminity);
	
}
