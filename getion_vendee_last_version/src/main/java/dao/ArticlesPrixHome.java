package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;

import entities.ArticlesPrix;


public class ArticlesPrixHome implements IarticlesPrixDao
{

	@Override
	public List<ArticlesPrix> getArticle()
	{
	       Session session = HibernateSessionFactory.getSession();//get hibernate session factory
	       Query query = session.createQuery("from ArticlesPrix", ArticlesPrix.class);//select all articles (hql)
		   List<ArticlesPrix> articlesList = query.getResultList();
     return articlesList;
	}

	@Override
	public List<ArticlesPrix> getArticleByMotCle(String motCle) 
	{	    
		    Session session = HibernateSessionFactory.getSession();
		    Query query = session.createQuery("FROM ArticlesPrix WHERE nomArt LIKE :mc");
		    query.setParameter("mc", "%" + motCle + "%");
		    List<ArticlesPrix> articlesList = query.getResultList();
      return articlesList;
	}
		  
	@Override
	public void addArticle(ArticlesPrix u) 
	{	
	     Session session=HibernateSessionFactory.getSession();
		 if(!session.getTransaction().isActive()) {session.beginTransaction();}
		 HibernateSessionFactory.getSession().save(u);
		 session.getTransaction().commit();
	}
	
	@Override
	public ArticlesPrix getArticleByCode(Integer codeArt)
	{
	    Session session = HibernateSessionFactory.getSession();
	    Query query = session.createQuery("from ArticlesPrix where codeArt = :code", ArticlesPrix.class);
	    query.setParameter("code", codeArt);
	    ArticlesPrix article = (ArticlesPrix) query.uniqueResult();
	  return article;
	}

}
