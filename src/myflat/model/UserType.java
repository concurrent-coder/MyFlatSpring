package myflat.model;

public enum UserType {

	ADMIN((short)1),
	DEALER((short)2),
	CUSTOMER((short)3);
	
	private short usrType;
	private UserType(short sType) {
		this.usrType = sType;
	}
	
	public short getUserType(){
		return this.usrType;
	}
}
