package dao;

import org.hibernate.Session;

import entities.Contact;
import entities.Users;

public class ContactHome implements IcontactDao {
	@Override
	public void add(Contact c) 
	{	
		Session session=HibernateSessionFactory.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		 HibernateSessionFactory.getSession().save(c);
		 session.getTransaction().commit();
	}

}