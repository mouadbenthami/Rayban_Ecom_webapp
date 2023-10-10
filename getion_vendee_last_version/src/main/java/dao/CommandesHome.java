package dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import entities.Commandes;

public class CommandesHome implements IcommandesDao
{
	@Override
	public int addCmd(Commandes cmd)
	{
		 Session session=HibernateSessionFactory.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		 Serializable generatedId =HibernateSessionFactory.getSession().save(cmd);
		 session.getTransaction().commit();
		 int CmdId=(Integer) generatedId;
		 return CmdId;
	}
	
	public Commandes getCommandesByCode(Integer codeArt)
	{
	    Session session = HibernateSessionFactory.getSession();
	    Query query = session.createQuery("from Commandes where codeCmd = :code", Commandes.class);
	    query.setParameter("code", codeArt);
	    Commandes article = (Commandes) query.uniqueResult();
	    return article;
	}

	@Override
	public List<Commandes> getCommandesByClient(String Client) 
	{
		Session session = HibernateSessionFactory.getSession();
	    Query query = session.createQuery("FROM Commandes WHERE client = :mc");
	    query.setParameter("mc",Client);
	    List<Commandes> commandes = query.getResultList();
		return commandes;
	}
	
    public void updateName(String currentName, String newName) 
    {
    	Session session = HibernateSessionFactory.getSession();
    	if(!session.getTransaction().isActive()) {session.beginTransaction();}
        String query = "UPDATE Commandes SET client = :newName WHERE client = :currentName";
        Query query1 = session.createQuery(query);
        query1.setParameter("newName", newName);
        query1.setParameter("currentName", currentName);
        query1.executeUpdate();
        session.getTransaction().commit();
    }
	

	
}
