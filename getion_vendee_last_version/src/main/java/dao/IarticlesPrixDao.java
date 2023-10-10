package dao;

import java.util.List;

import entities.ArticlesPrix;

public interface IarticlesPrixDao {
	public List<ArticlesPrix> getArticle();
	public List<ArticlesPrix>  getArticleByMotCle(String motCle);
	public ArticlesPrix getArticleByCode(Integer codeArt);
	public void addArticle(ArticlesPrix u);

}
