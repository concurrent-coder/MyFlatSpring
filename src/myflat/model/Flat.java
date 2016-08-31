package myflat.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.tomcat.util.codec.binary.Base64;

@Entity
@Table(name = "flats")
public class Flat implements Model {

	/**
	 */
	private static final long serialVersionUID = 1L;

	public void setActive(boolean active) {
		this.active = active;
	}

	public Flat() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long Id;

	@Column(nullable = false)
	private String title;

	@Column(name="description",nullable = false,columnDefinition = "text")
	private String description;

	@Column(nullable = false)
	private String area;

	@ManyToOne(fetch = FetchType.EAGER)
	private City city;

	@ManyToOne(fetch = FetchType.EAGER)
	private State state;

	@OneToOne(fetch = FetchType.EAGER)
	private Bathroom bathroom;
	
	@OneToOne(fetch = FetchType.EAGER)
	private BHK bhk;

	@OneToOne(fetch = FetchType.EAGER)
	private User dealer;

	@Column(name = "isActive")
	private boolean active = true;

	// @OneToMany(targetEntity = myflat.model.Amenities.class,
	// fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	// @JoinTable(name="flat_amenities",joinColumns={@JoinColumn(name =
	// "flat_id",unique=false)},
	// inverseJoinColumns={@JoinColumn(name = "amenities_id",unique=false)})

	@ManyToMany(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinTable(name = "flat_amenities", joinColumns = { @JoinColumn(name = "flat_id") }, inverseJoinColumns = {
			@JoinColumn(name = "amenities_id") })
	private Set<Amenities> amenities;

	@Column(name = "range_from")
	private String priceFrom;

	@Column(name = "range_to")
	private String priceTo;

	@Column(name = "thumbnail",columnDefinition = "longblob")
	private byte[] thumbnail;
	
	@Transient
	private String thumbToString;
	
	@Column(name = "flatImg1Name")
	private String flatImg1Name;
	
	@Column(name = "flatImg2Name")
	private String flatImg2Name;
	
	@Column(name = "flatImg3Name")
	private String flatImg3Name;
	
	@Column(name="created")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;
	
	@Column(name="modified")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedDate;
	
	/*
	 * public List<Amenities> getAmenities() { if(amenities == null){ amenities
	 * = new ArrayList<Amenities>(0); } return amenities; }
	 * 
	 * public void setAmenities(List<Amenities> amenities) { this.amenities =
	 * amenities; }
	 */

	public String getThumbToString() {
		if(thumbToString == null)
			setThumbToString("");
		
		return thumbToString;
	}

	public void setThumbToString(String thumbToString) {
		if(null!=thumbnail){
			byte[] encoded=Base64.encodeBase64(thumbnail);
			thumbToString = new String(encoded);
			encoded = null;
		}
		this.thumbToString = thumbToString;
	}

	public Set<Amenities> getAmenities() {
		if (amenities == null) {
			amenities = new HashSet<Amenities>(0);
		}
		return amenities;
	}

	public void setAmenities(Set<Amenities> amenities) {
		this.amenities = amenities;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

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

	public Bathroom getBathroom() {
		return bathroom;
	}

	public String getPriceFrom() {
		return priceFrom;
	}

	public void setPriceFrom(String priceFrom) {
		this.priceFrom = priceFrom;
	}

	public String getPriceTo() {
		return priceTo;
	}

	public void setPriceTo(String priceTo) {
		this.priceTo = priceTo;
	}

	public BHK getBhk() {
		return bhk;
	}

	public void setBhk(BHK bhk) {
		this.bhk = bhk;
	}

	public byte[] getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(byte[] thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getFlatImg1Name() {
		return flatImg1Name;
	}

	public void setFlatImg1Name(String flatImg1Name) {
		this.flatImg1Name = flatImg1Name;
	}

	public String getFlatImg2Name() {
		return flatImg2Name;
	}

	public void setFlatImg2Name(String flatImg2Name) {
		this.flatImg2Name = flatImg2Name;
	}

	public String getFlatImg3Name() {
		return flatImg3Name;
	}

	public void setFlatImg3Name(String flatImg3Name) {
		this.flatImg3Name = flatImg3Name;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	
}
