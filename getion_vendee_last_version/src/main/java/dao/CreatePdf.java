package dao;

import java.io.IOException;


import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import entities.ArticlesPrix;
import entities.Commandes;

import java.awt.Desktop;
import java.io.File;



public class CreatePdf {

    	  public static void generateInvoice(ArticlesPrix p, Commandes c) {
    	        // Create a new document
    	        PDDocument document = new PDDocument();
    	        PDPage page = new PDPage(PDRectangle.A4);
    	        document.addPage(page);

    	        try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
    	            // Set font and size for the title
    	            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 18);
    	            contentStream.beginText();
    	            contentStream.newLineAtOffset(50, 700);
    	            contentStream.showText("Invoice");
    	            contentStream.endText();

    	            // Set font and size for the details
    	            contentStream.setFont(PDType1Font.HELVETICA, 12);

    	            // Get the current date
    	            

    	            // Write the client name and date
    	            contentStream.beginText();
    	            contentStream.newLineAtOffset(50, 650);
    	            contentStream.showText("Client Name: " + c.getClient());
    	            contentStream.endText();
    	            //contentStream.newLine();contentStream.newLine();contentStream.newLine();contentStream.newLine();
    	            
    	            float textHeight = PDType1Font.HELVETICA.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * 12; // Adjust the font size if needed
    	            float secondLineY = 650 - textHeight; // Adjust the offset if needed

    	            contentStream.beginText();
    	            contentStream.newLineAtOffset(50, secondLineY);
    	            contentStream.showText("Date: " + c.getDateCmd());
    	            contentStream.endText();
                    
    	            float thirdLineY = secondLineY - textHeight;
    	            
    	            contentStream.beginText();
    	            contentStream.newLineAtOffset(50, thirdLineY);
    	            contentStream.showText("Order code: " + c.getCodeCmd());
    	            contentStream.endText();
    	            // Move to the table area
    	            float margin = 50;
    	            float yStart = 600;
    	            float tableWidth = page.getMediaBox().getWidth() - 2 * margin;
    	            float yPosition = yStart;
    	            float tableHeight = 100;
    	            float rowHeight = 20;
    	            float tableBottomMargin = 30;

    	            // Draw the table header
    	            contentStream.setLineWidth(1);
    	            contentStream.moveTo(margin, yPosition);
    	            contentStream.lineTo(margin + tableWidth, yPosition);
    	            contentStream.stroke();

    	            contentStream.beginText();
    	            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);
    	            contentStream.newLineAtOffset(margin + 5, yPosition - 15);
    	            contentStream.showText("ID Product");
    	            contentStream.newLineAtOffset(150, 0);
    	            contentStream.showText("Quantity");
    	            contentStream.newLineAtOffset(100, 0);
    	            contentStream.showText("Price");
    	            contentStream.newLineAtOffset(100, 0);
    	            contentStream.showText("Total Price");
    	            contentStream.endText();

    	            // Draw the table data
    	            contentStream.setLineWidth(0.5f);
    	            contentStream.moveTo(margin, yPosition - rowHeight);
    	            contentStream.lineTo(margin + tableWidth, yPosition - rowHeight);
    	            contentStream.stroke();

    	            contentStream.beginText();
    	            contentStream.setFont(PDType1Font.HELVETICA, 12);
    	            contentStream.newLineAtOffset(margin + 5, yPosition - 15 - rowHeight);
    	            contentStream.showText(p.getCodeArt()+" "+p.getNomArt());
    	            contentStream.newLineAtOffset(150, 0);
    	            contentStream.showText(""+c.getQteCmd());
    	            contentStream.newLineAtOffset(100, 0);
    	            contentStream.showText(""+p.getPrixArt());
    	            contentStream.newLineAtOffset(100, 0);
    	            float price=p.getPrixArt()*c.getQteCmd();
    	            contentStream.showText(" "+price);
    	            contentStream.endText();

    	            // Draw the table bottom line
    	            contentStream.setLineWidth(1);
    	            contentStream.moveTo(margin, yPosition - tableHeight - tableBottomMargin+20);
    	            contentStream.lineTo(margin + tableWidth, yPosition - tableHeight - tableBottomMargin+20);
    	            contentStream.stroke();

    	            // Add additional content
    	           

    	            // Close the content stream
    	            contentStream.close();

    	            // Save the document
    	            document.save("invoice_"+c.getCodeCmd()+".pdf");
    	            File file=new File("invoice_"+c.getCodeCmd()+".pdf");
    	            if (Desktop.isDesktopSupported()) {
    	                Desktop desktop = Desktop.getDesktop();      
    	                if (desktop.isSupported(Desktop.Action.OPEN)) {
    	                    desktop.open(file);
    	                } else {
    	                    System.out.println("L'ouverture de fichiers n'est pas prise en charge sur cette plateforme.");
    	                }
    	            } else {
    	                System.out.println("Desktop n'est pas pris en charge sur cette plateforme.");
    	            }
    	        } catch (IOException e) {
    	            e.printStackTrace();
    	        } finally {
    	            // Close the document
    	            try {
    	                document.close();
    	            } catch (IOException e) {
    	                e.printStackTrace();
    	            }
    	        }
    	    }
    	}
