package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Commandes implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer codeCmd;
	@Column
	private String client;
	@Column
	private int codeArt;
	@Column
	private int qteCmd;
	@Column
	private Date dateCmd;

	public Commandes() {
	}

	public Commandes(String client, int codeArt, int qteCmd, Date dateCmd) {
		this.client = client;
		this.codeArt = codeArt;
		this.qteCmd = qteCmd;
		this.dateCmd = dateCmd;
	}

	public Integer getCodeCmd() {
		return this.codeCmd;
	}

	public void setCodeCmd(Integer codeCmd) {
		this.codeCmd = codeCmd;
	}

	public String getClient() {
		return this.client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public int getCodeArt() {
		return this.codeArt;
	}

	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}

	public int getQteCmd() {
		return this.qteCmd;
	}

	public void setQteCmd(int qteCmd) {
		this.qteCmd = qteCmd;
	}

	public Date getDateCmd() {
		return this.dateCmd;
	}

	public void setDateCmd(Date dateCmd) {
		this.dateCmd = dateCmd;
	}

}
