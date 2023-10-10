package action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.CommandesHome;
import dao.UsersHome;
import entities.Users;

public class usersAction 
{
	
	ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
	
	private Users user=(Users)context.getBean("UsersBeans");
	private String newLogin ;//used in edit
	private String newPass;//used in edit
	private String login ;//used in login and edit
	private String Pass;//used in login and edit
	private String ConfPass;//used in signup
	
	public String getNewLogin() {
		return newLogin;
	}
	public void setNewLogin(String newLogin) {
		this.newLogin = newLogin;
	}
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	
	public String getConfPass() {
		return ConfPass;
	}
	public void setConfPass(String confPass) {
		ConfPass = confPass;
	}

	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	
	public Users getUser() 
	{
		return user;
	}
	public void setUser(Users user)
	{
		this.user = user;
	}
	
	public String login() //login method
	{
		 UsersHome uh=(UsersHome)context.getBean("UsersHomeBeans");//user dao class
		 Users u=uh.getUsers(this.getUser().getLogin());//get user from db by the login
		 if (u != null &&this.getUser().getLogin().equals(u.getLogin()) && this.getUser().getPass().equals(u.getPass())) 
		 {
			 HttpSession session = ServletActionContext.getRequest().getSession();
			 session.setAttribute("loggedInUser", u);//put the user in the session
		    return "s"; 
		 }  
		 else 
		 {
		    return "f"; 
		 }
     }
	
	public String logout() 
	{
		  HttpSession session = ServletActionContext.getRequest().getSession(false);
	      if (session != null) 
	      {
		        session.invalidate();
		  }
	  return "success";
	}
	
	public String edit() 
	{
		CommandesHome c = (CommandesHome) context.getBean("CommandesHomeBeans");
		UsersHome uh=(UsersHome)context.getBean("UsersHomeBeans");
		HttpSession session = ServletActionContext.getRequest().getSession();//get the current session
		Users CurrentUser = (Users) session.getAttribute("loggedInUser");//get the current user info from the session
		 Users u1=uh.getUsers(this.getNewLogin());//check if the login already exists
		if (session.getAttribute("loggedInUser") != null ) //check if the user is logged in
		{
			//check the user info
			if(this.getUser().getLogin().equals(CurrentUser.getLogin()) && this.getUser().getPass().equals(CurrentUser.getPass()) && u1==null) 
			{
			Users Newuser=(Users)context.getBean("UsersBeans");
			
			Newuser.setCodeUser(CurrentUser.getCodeUser());
			Newuser.setLogin(this.getNewLogin());//set the new login
			Newuser.setPass(this.getNewPass());//set the new pass
			 
			uh.updateUsers(Newuser);//update the information
			//session.removeAttribute("loggedInUser");
			session.setAttribute("loggedInUser",Newuser);//change the user information in the session
			c.updateName(CurrentUser.getLogin(),this.getNewLogin());
		    return "success";
		    }//the user info is incorrect
		    else {
		    	if(u1!=null)
		          return "userEx";
		    	else
			      return "invalid";
		    	}
        }//user is not logged in
		else 
		{
			return"failure";
		}
	}

	public String signUp() 
	{
	    UsersHome uh = (UsersHome) context.getBean("UsersHomeBeans");
	    Users u=uh.getUsers(this.getLogin());
	    if (this.getPass().equals(this.getConfPass()) && u==null) //check if the pass == confirmation pass
	    {
	        Users Nuser = (Users) context.getBean("UsersBeans");
	        Nuser.setLogin(this.getLogin());
	        Nuser.setPass(this.getPass());
	        uh.addUsers(Nuser);//add the new user to the db
	        return "success";
	    } else 
	        {  
	    	 if(u!=null)
	          return "userEx";
	    	 else 
	          return "failure";
	        }
	}

}
