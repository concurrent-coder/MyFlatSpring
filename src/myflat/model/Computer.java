package myflat.model;


public class Computer {

    private long id;

    private String brand;

    private String model;

    private String reference;

    private String description;

    
    public Computer(long id, String brand,String model,String referennce,String desc) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.reference = referennce;
        this.description = desc;
    }
    
    public long getId() {
        return id;
    }

    
    public void setId(long id) {
        this.id = id;
    }

    
    public String getBrand() {
        return brand;
    }

    
    public void setBrand(String brand) {
        this.brand = brand;
    }

    
    public String getModel() {
        return model;
    }

    
    public void setModel(String model) {
        this.model = model;
    }

    
    public String getReference() {
        return reference;
    }

    
    public void setReference(String reference) {
        this.reference = reference;
    }

    
    public String getDescription() {
        return description;
    }

    
    public void setDescription(String description) {
        this.description = description;
    }

   
    

  } 
