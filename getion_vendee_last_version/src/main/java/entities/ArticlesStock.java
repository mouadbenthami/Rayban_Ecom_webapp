package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ArticlesStock implements java.io.Serializable 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer codeArt;
	@Column
	private int qteArt;
	@Column
	private String nomArt;
	@Column
	private String descArt;
	@Column
	private int prixArt;

	public ArticlesStock() {
	}

	public ArticlesStock(int qteArt, String nomArt, String descArt, int prixArt) {
		this.qteArt = qteArt;
		this.nomArt = nomArt;
		this.descArt = descArt;
		this.prixArt = prixArt;
	}

	public Integer getCodeArt() {
		return this.codeArt;
	}

	public void setCodeArt(Integer codeArt) {
		this.codeArt = codeArt;
	}

	public int getQteArt() {
		return this.qteArt;
	}

	public void setQteArt(int qteArt) {
		this.qteArt = qteArt;
	}

	public String getNomArt() {
		return this.nomArt;
	}

	public void setNomArt(String nomArt) {
		this.nomArt = nomArt;
	}

	public String getDescArt() {
		return this.descArt;
	}

	public void setDescArt(String descArt) {
		this.descArt = descArt;
	}

	public int getPrixArt() {
		return this.prixArt;
	}

	public void setPrixArt(int prixArt) {
		this.prixArt = prixArt;
	}

}
