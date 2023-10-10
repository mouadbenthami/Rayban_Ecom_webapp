package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.ArticlesPrixHome;
import dao.CreatePdf;
import dao.CommandesHome;
import entities.ArticlesPrix;
import entities.Commandes;

public class PdfAction 
{
	ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml");
	
	 private InputStream inputStream;
     private long contentLength;
     private String fileName;
     private int cmdId;
     
 	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
     
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public long getContentLength() {
		return contentLength;
	}
	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	public int getCmdId() {
		return cmdId;
	}
	public void setCmdId(int cmdId) {
		this.cmdId = cmdId;
	}
	
	 //create the pdf and download it
	 public String execute() throws FileNotFoundException 
	 {
		
		File fileToDownload=new File("invoice_"+this.getCmdId()+".pdf");//get the file 
	        inputStream = new FileInputStream(fileToDownload);
	        fileName = fileToDownload.getName();
	        contentLength = fileToDownload.length();
	          
	   return "s";
	  }
	 




}
