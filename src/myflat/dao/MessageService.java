package myflat.dao;

public interface MessageService {

	boolean sendMessage(String to,String senderName, String subject, String body,String customerEmail);
	
}
