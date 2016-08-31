package myflat.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="bathrooms")
public class Bathroom implements Model{

	/**
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long Id;
	
	@Column(name="name",nullable=false,unique=true)
	private String bathroomName;
	
	@Column(name="isActive")
	private boolean active = true;

	@ManyToOne
    @JoinColumn(name="flat_id")
    private Flat flat;
	
	@Transient
	private boolean selected = false;
	

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}


	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getBathroomName() {
		return bathroomName;
	}

	public void setBathroomName(String bathroomName) {
		this.bathroomName = bathroomName;
	}
	
	
}
