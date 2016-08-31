package myflat.dao.jpa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import myflat.dao.MessageService;

public class EmailService implements MessageService {

	@Autowired
	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	public boolean sendMessage(String to, String senderName, String subject, String body,String customerEmail) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(to);
		msg.setText(body + "\n Person's email in case you want to respond him back "+customerEmail);
		try {
			this.mailSender.send(msg);
			return true;
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
		return false;
	}

}
