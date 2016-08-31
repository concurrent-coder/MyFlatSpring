package myflat.dao.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myflat.dao.FlatFilterDao;
import myflat.model.Amenities;
import myflat.model.BHK;
import myflat.model.Bathroom;
import myflat.model.City;
import myflat.model.Company;
import myflat.model.Flat;
import myflat.model.State;
import myflat.model.User;
import myflat.model.UserType;

@Repository
public class FlatFilterImpl implements FlatFilterDao {

	@PersistenceContext
	private EntityManager entityManager;

	/**
	 * Using it for Admin panel to show both active and Inactive Amenities <br>
	 * true = Active; False InActive;
	 */
	@Override
	public List<Amenities> getAllAmenities() {
		return entityManager.createQuery("from Amenities", Amenities.class).getResultList();
	}

	@Override
	public List<Amenities> getActiveAmenities() {
		return entityManager.createQuery("from Amenities where active=1", Amenities.class).getResultList();
	}

	@Override
	@Transactional
	public Amenities addAmenities(Amenities amenities) {
		return entityManager.merge(amenities);
	}
	
	@Override
	@Transactional
	public void deleteAmenitiesById(Long id){
		Amenities aminity = getAmenitiesById(id);
		entityManager.remove(aminity);
	}

	@Override
	public Amenities getAmenitiesById(Long amenitiesId) {
		return entityManager.createQuery("from Amenities where id=" + amenitiesId, Amenities.class).getSingleResult();
	}

	@Override
	public List<BHK> getAllBhks() {
		return entityManager.createQuery("from BHK", BHK.class).getResultList();
	}

	@Override
	@Transactional
	public BHK addBhk(BHK bhks) {
		return entityManager.merge(bhks);
	}

	@Override
	public List<BHK> getActiveBhks() {
		return entityManager.createQuery("from BHK where active=1", BHK.class).getResultList();
	}

	@Override
	public BHK getBhkById(int bhkId) {
		return entityManager.createQuery("from BHK where id=" + bhkId, BHK.class).getSingleResult();
	}

	@Override
	public List<Bathroom> getAllBathrooms() {
		return entityManager.createQuery("from Bathroom", Bathroom.class).getResultList();
	}

	@Override
	@Transactional
	public Bathroom addBathroom(Bathroom bathroom) {
		return entityManager.merge(bathroom);
	}

	@Override
	public List<City> getCities() {
		return entityManager.createQuery("from City ", City.class).getResultList();
	}
	
	@Override
	public List<Bathroom> getActiveBathrooms() {
		return entityManager.createQuery("from Bathroom where active=1", Bathroom.class).getResultList();
	}

	@Override
	public Bathroom getBathroomById(int bathroomId) {
		return entityManager.createQuery("from Bathroom where id=" + bathroomId, Bathroom.class).getSingleResult();
	}

	@Override
	public List<Flat> getAllFlats() {
		return entityManager.createQuery("from Flat", Flat.class).getResultList();
	}

	/** Search Cities by name */
	@Override
	public List<City> getActiveCitiesByName(String strname) {
		return entityManager.createQuery("from City where city like '%" + strname + "%'", City.class).getResultList();
	}

	@Override
	public List<State> getActiveStateByName(String starStateName) {
		return entityManager.createQuery("from State where state like '%" + starStateName + "%'", State.class)
				.getResultList();
	}

	@Override
	public List<User> getActiveDealersByName(String strName) {
		return entityManager.createQuery("from User where isActive=1 and (firstName like '%" + strName + "%' OR lastName like '%"
				+ strName + "%') and userType =" + UserType.DEALER.getUserType(), User.class).getResultList();
	}

	@Override
	@Transactional
	public Flat addFlat(Flat flat) {
		System.out.println("Saving/updating flat...");
		return entityManager.merge(flat);
	}

	@Override
	@Transactional
	public City addCity(City c) {
		return entityManager.merge(c);
	}

	@Override
	@Transactional
	public State addState(State st) {
		return entityManager.merge(st);
	}

	@Override
	public List<Flat> getAreasByCityId(Integer nCityId) {
		return entityManager.createQuery("from Flat where city="+nCityId,Flat.class).getResultList();
	}

	@Override
	public Map<String, List<Object>> getFlatPriceRange() {
		List<Object> rngFrom = entityManager.createQuery("select distinct priceFrom from Flat order by 1 asc").getResultList();
		
		List<Object> rngTo = entityManager.createQuery("select distinct priceTo from Flat order by 1 asc").getResultList();
		
		Map<String,List<Object>> priceRange = new HashMap<>();
		priceRange.put("FROM", rngFrom);
		priceRange.put("TO", rngTo);
		
		return priceRange;
	}

	@Override
	public List<String> getDistinctAreas() {
		return entityManager.createQuery("select distinct area from Flat order by 1 asc").getResultList();
	}

	@Override
	public Flat getFlatById(Long flatId) {
		return entityManager.createQuery("from Flat where id="+flatId,Flat.class).getSingleResult();
	}

	@Override
	public Company getCompanyAddress() {
		return entityManager.createQuery("from Company",Company.class).getSingleResult();
	}

}
