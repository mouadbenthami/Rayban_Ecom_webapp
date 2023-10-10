package entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Users implements java.io.Serializable  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer codeUser;
	@Column
	private String login;
	@Column
	private String pass;
	
	
	public Users() {
	}

	public Users(String login, String pass) {
		this.login = login;
		this.pass = pass;
	}

	public Integer getCodeUser() {
		return this.codeUser;
	}

	public void setCodeUser(Integer codeUser) {
		this.codeUser = codeUser;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
 

}
