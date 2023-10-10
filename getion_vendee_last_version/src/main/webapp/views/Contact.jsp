<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Articles</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
		<script>
  document.addEventListener("DOMContentLoaded", function() {
    // Check if the openModal parameter is present in the URL
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("Msg")) {
    	 alert("The message has been sent successfully");
    }
  });
</script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

  </head>
  
      <!-- parametre modal-->
    <div class="modal fade" id="parametreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">change settings</h5>
                    <button class="btn btn-danger" type="button" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times" aria-hidden="true"></i><span aria-hidden="true"></span>
                    </button>
                </div>

                <div class="modal-body">
                <form action="edit.action" method="post">
                <div class="form-group">
                     <label class="control-label">login :</label>
                     <input type="text" name="user.login" class="form-control" />
                </div>

                <div class="form-group">
                      <label class="control-label">current password  :</label>
                      <input type="password" name="user.pass" class="form-control" />
                </div> 
                
                <div class="form-group">
                      <label class="control-label">New Login  :</label>
                      <input type="text" name="newLogin" class="form-control" />
                </div> 
                <div class="form-group">
                      <label class="control-label">New password  :</label>
                      <input type="password" name="newPass" class="form-control" />
                </div> 

                 <div>
                      <button type="submit" class="btn btn-primary">change</button>
                 </div>
          </form>
          </div>
          </div>
                
            </div>
        </div>
      <!-- end parametre modal-->  
      
 <body class="goto-here">
		<div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><i class="fa fa-phone" aria-hidden="true"></i></div>
						    <span class="text">+212 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><i class="fa fa-envelope-o" aria-hidden="true"></i></div>
						    <span class="text">Rayban@Store.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">Delivery In 7/24h 7 Days &amp; And Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="articles.action">Rayban</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item "><a href="articles.action" class="nav-link">Home</a></li>
	          <li class="nav-item active"><a href="allarticles.action" class="nav-link">All Articles</a></li>
	          <li class="nav-item"><a href="about.action" class="nav-link">About us</a></li>
	          <li class="nav-item"><a href="contact.action" class="nav-link">Contact</a></li>
	          <li class="nav-item cta cta-colored"><a href="cart.action" class="nav-link"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
	        </ul>
	      </div>
	    </div>
	    
	    <div class="float-right nav-item dropdown no-arrow">
              
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><s:property value="user.getLogin()"/></span>
                                <img class="img-profile rounded-circle" src="images/profile.png">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                             
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#parametreModal">
                                   <i class="fa fa-cogs" aria-hidden="true"></i>
                                    settings
                                </a>
                               
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.action" >
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    Logout
                                </a>
                            </div>
                      </div>
	  </nav>
	 
    
	  <section class="  bg-light">
	  <br>
      <div class="container">
      <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="row block-9">
          <div class="col-md-5 order-md-last d-flex">
            <form action="Contact.action" method="post"class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" name ="name" placeholder="full name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="email" placeholder="Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea id="" cols="30" rows="7" class="form-control" name="message" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
           
          </div>
 
          <div class="col-md-7 d-flex">
          	<img class="img-fluid" src='images/contact.png'>
          	
        </div>
      </div>
      </div>
      </div>
      </div>
      <br>
    </section>
	  
	  
    
    
    
        <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><i class="fa fa-arrow-up" aria-hidden="true"></i></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Rayban</h2>
              <p>Experience the epitome of eyewear excellence with us, the unrivaled leaders in glasses sales throughout Morocco</p>
              
              <ul style="display: inline-block; list-style: none; padding: 0; margin: 0;">
                <li style="display: inline; margin-right: 15px;"><a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li style="display: inline; margin-right: 15px;"><a href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
                <li style="display: inline; margin-right: 15px;"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
              </ul>
           
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="articles.action" >Articles</a></li>
                <li><a href="about.action" >About us</a></li>
                <li><a href="contact.action">Contact</a></li>
              </ul>
            </div>
          </div>
        
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">You have a question ?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><i class="fa fa-map-marker" aria-hidden="true"></i> Av. des Forces Arms Royales, Tetouan 93000</li>
	                <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i> +212 392 392 721</a></li>
	                <li><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i> Rayban@store.com</a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
       
      </div>
    </footer>
    
  <script src="js/bootstrap.min.js"></script>
    </body>
</html>