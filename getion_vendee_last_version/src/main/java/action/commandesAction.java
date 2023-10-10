package action;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.ArticlesPrixHome;
import dao.ArticlesStockHome;
import dao.CommandesHome;
import dao.CreatePdf;
import entities.ArticlesPrix;
import entities.Commandes;
import entities.Users;

public class commandesAction 
{
	 ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
	 
	 private String codeArt;//product id that the user order
	 private String qteCmd;//qtn that the user chose 
	 private String qtn;//Exciting qtn form g_stock db
	 private int cmdId;//Command id
	 private ArticlesPrix article;
	 private Commandes commandes=(Commandes)context.getBean("CommandesBeans");
	 private Users user=(Users)context.getBean("UsersBeans");
	 private List<Commandes> cmds;
	 
	 //setter and getters for all the attributes 
	 public String getQtn() {
		return qtn;
	}
	public void setQtn(String qtn) {
		this.qtn = qtn;
	}
		 
	 public String getQteCmd() {
		return qteCmd;
	}
	public void setQteCmd(String qteCmd) {
		this.qteCmd = qteCmd;
	}
	
	 public Commandes getCommandes() {
		return commandes;
	}
	public void setCommandes(Commandes commandes) {
		this.commandes = commandes;
	}
	 
	public String getCodeArt() {
		return codeArt;
	}
	public void setCodeArt(String codeArt) {
		this.codeArt = codeArt;
	}
	
	public ArticlesPrix getArticle() {
		return article;
	}
	public void setArticle(ArticlesPrix article) {
		this.article = article;
	}
	
	public int getCmdId() {
		return cmdId;
	}
	public void setCmdId(int cmdId) {
		this.cmdId = cmdId;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
   public List<Commandes> getCmds() {
		return cmds;
	}
	public void setCmds(List<Commandes> cmds) {
		this.cmds = cmds;
	}
public String confirmationCmd() 
   {
		HttpSession session = ServletActionContext.getRequest().getSession();//get current session
		this.setUser((Users) session.getAttribute("loggedInUser"));//get the user from the session
		if (session.getAttribute("loggedInUser") != null ) //check if the user is logged in
		{
			if(this.getQteCmd()!="")//check if the user enter a valid qtn 
			{
				
			CommandesHome c = (CommandesHome) context.getBean("CommandesHomeBeans");
			Users user = (Users) session.getAttribute("loggedInUser");

			this.commandes.setClient(user.getLogin());
			this.commandes.setCodeArt(Integer.parseInt(this.getCodeArt()));
			this.commandes.setQteCmd(Integer.parseInt(this.getQteCmd()));
			this.commandes.setDateCmd(new Date(System.currentTimeMillis()));
			c.addCmd(commandes);//add cmd to db
			
			this.setCmdId(c.addCmd(commandes));//addCmd returns the cmd id (id generated auto)
			ArticlesStockHome S=(ArticlesStockHome) context.getBean("ArticlesStockHomeBeans");
			//update the exciting qtn in g_stock
		    S.updateArtQtn(Integer.parseInt(this.getCodeArt()), Integer.parseInt(this.getQtn())-Integer.parseInt(this.getQteCmd()));
		    
		    ArticlesPrixHome a=(ArticlesPrixHome) context.getBean("ArticlesPrixHomeBeans");
			ArticlesPrix prod=a.getArticleByCode(this.getCommandes().getCodeArt());//get the product by the id 
			CreatePdf.generateInvoice(prod,this.getCommandes());//Generate pdf
			return "success";
			}//invalid qtn 
			else
				return "invalide";
		} //user is not logged in
		else 
		{
			return "failure";
		}
	}
   
   public String getAllCmds() 
   {
	   HttpSession session = ServletActionContext.getRequest().getSession();//get current session
		this.setUser((Users) session.getAttribute("loggedInUser"));//get the user from the session
		if (session.getAttribute("loggedInUser") != null ) //check if the user is logged in
		{
			CommandesHome c = (CommandesHome) context.getBean("CommandesHomeBeans");
			Users user = (Users) session.getAttribute("loggedInUser");
			
			this.setCmds(c.getCommandesByClient(user.getLogin()));
			this.setUser(user);
			return "success";
	    }
		else 
			return "failure";	   
   }


   
}
