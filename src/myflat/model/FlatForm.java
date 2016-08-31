package myflat.model;

public class FlatForm {

	private String title;

	private String description;

	private String area;
	
	private City city;
	
	private State state;
	
	private Bathroom bathroom;
	
	private User dealer;

	private boolean active = true;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Bathroom getBathroom() {
		return bathroom;
	}

	public void setBathroom(Bathroom bathroom) {
		this.bathroom = bathroom;
	}

	public User getDealer() {
		return dealer;
	}

	public void setDealer(User dealer) {
		this.dealer = dealer;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
		
}
