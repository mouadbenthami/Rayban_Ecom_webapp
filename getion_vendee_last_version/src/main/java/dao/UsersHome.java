package dao;

import org.hibernate.Session;
import org.hibernate.query.Query;

import entities.Users;

public class UsersHome implements IusersDao
{
	@Override
	public void addUsers(Users u) 
	{	
		Session session=HibernateSessionFactory.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		 HibernateSessionFactory.getSession().save(u);
		 session.getTransaction().commit();
	}

	@Override
	public void deleteUsers(int id) 
	{
		 Session session=HibernateSessionFactory.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		 Users u=getUsersbyId(id);
		 session.delete(u);
		 session.getTransaction().commit();
	}

	@Override
	public void updateUsers(Users u)
	{
		Session session=HibernateSessionFactory.getSession();		
		if(!session.getTransaction().isActive()) {session.beginTransaction();}
		session.update(u);
		session.getTransaction().commit();
	}

	@Override
	public Users getUsersbyId(int id) 
	{
		Session session=HibernateSessionFactory.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		Users u=session.get(Users.class, id);
		return u;
	}

	public Users getUsers(String login) 
	{
		Session session=HibernateSessionFactory.getSession();
		Query query= session.createQuery("from Users where login=:name");
		query.setParameter("name", login);
		Users u = (Users) query.uniqueResult();
		return u;
	}
	
}
