package action;

import javax.persistence.Column;
import entities.Contact;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.ContactHome;
import dao.UsersHome;
import entities.Users;

public class ContactAction {
    ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
    private Contact Contact =(Contact)context.getBean("ContactBeans");
	private String name;
	private String email;
	private String subject;
	private String message;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String addContact() 
	{
	   ContactHome ch = (ContactHome) context.getBean("ContactHomeBeans");
	   Contact.setName(this.getName());
	   Contact.setEmail(this.getEmail());
	   Contact.setSubject(this.getSubject());
	   Contact.setMessage(this.getMessage());
	   ch.add(Contact);
	   return "success";
    }
}