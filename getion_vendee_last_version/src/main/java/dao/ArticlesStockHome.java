package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.query.Query;


import entities.ArticlesStock;


public class ArticlesStockHome implements IarticlesStockDao
{
	//get articles qtn from g_stock and stored by id and (we can get the exciting qtn by the id)
	public Map<Integer, Integer> getQn() 
	{
	    Session session = HibernateSessionFactoryg.getSession();
	    String hql = "SELECT codeArt, qteArt FROM ArticlesStock";
	    Query<Object[]> query = session.createQuery(hql, Object[].class);
	    List<Object[]> results = query.getResultList();
	    
	    Map<Integer, Integer> productMap = new HashMap<>();
	    for (Object[] result : results) {
	        int id = (int) result[0]; // Assuming codeArt is of type int
	        int quantity = (int) result[1]; // Assuming qteArt is of type int
	        productMap.put(id, quantity);
	    }
	    
	    return productMap;
	}
    
	//update the qtn in g_stock db
	public void updateArtQtn(int id,int qtn) 
	{
		Session session = HibernateSessionFactoryg.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		 ArticlesStock a=session.get(ArticlesStock.class, id);
		 a.setQteArt(qtn);
	     session.update(a);
		 session.getTransaction().commit();
	}

}
