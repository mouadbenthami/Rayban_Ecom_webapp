package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.ArticlesPrixHome;
import dao.ArticlesStockHome;
import entities.ArticlesPrix;
import entities.Users;

public class articlesAction 
{
	ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
	
	private List<ArticlesPrix> articles;//product list
	private String MotCle;// used to search for a product 
	private Map<Integer, Integer> productMap;// a map to get the qtn by the product id 
	private Users user=(Users) context.getBean("UsersBeans");//user must be initialized
	
	//Setters and getters for all attributes
	
	public Map<Integer, Integer> getProductMap() {
		return productMap;
	}

	public void setProductMap(Map<Integer, Integer> productMap) {
		this.productMap = productMap;
	}
		
	public String getMotCle() {
		return MotCle;
	}

	public void setMotCle(String motCle) {
		MotCle = motCle;
	}

	public List<ArticlesPrix> getArticles() {
		return articles;
	}

	public void setArticles(List<ArticlesPrix> articles) {
		this.articles = articles;
	}

	public entities.Users getUser() {
		return user;
	}

	public void setUser(entities.Users user) {
		this.user = user;
	}
	
	
	
	
    public String getAllArticles() 
    {
    	//get the current session
	    HttpSession session = ServletActionContext.getRequest().getSession();
	    //check if the user is logged in 
		if (session.getAttribute("loggedInUser") != null) 
		{
			ArticlesPrixHome a = (ArticlesPrixHome) context.getBean("ArticlesPrixHomeBeans");//articles dao class
			this.setArticles(a.getArticle()); //get the products from the g_vende database
			ArticlesStockHome h=(ArticlesStockHome) context.getBean("ArticlesStockHomeBeans");//articles stock dao class
			//get the product qtn form the g_stock db and store them in an map so we could get the existing qtn by the product id
		    this.setProductMap(h.getQn());
		    this.setUser((Users)session.getAttribute("loggedInUser"));
		return "success";
		} 
		else 
		{
		    return "failure";
		}
    }
    
    //search by motcle
    public String searchByMC() 
    {
    	//get the current session
        HttpSession session = ServletActionContext.getRequest().getSession();
        //check if the user is logged in
		if (session.getAttribute("loggedInUser") != null) 
		{
			ArticlesPrixHome a = (ArticlesPrixHome) context.getBean("ArticlesPrixHomeBeans");//articles dao class
			this.setArticles(a.getArticleByMotCle(this.getMotCle()));
			this.setUser((Users)session.getAttribute("loggedInUser"));
		return "success";
		} 
		else 
		{
		  return "failure";
		}
   }
}
