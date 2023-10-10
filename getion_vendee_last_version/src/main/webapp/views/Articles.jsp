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
    if (urlParams.has("openModal")) {
      // Get the modal element by its ID
      var modal = document.getElementById("parametreModal");

      // Open the modal using Bootstrap's modal function
      $(modal).modal("show");
      alert("Password or Login incorrect");
    } else if (urlParams.has("Msg")) {
      alert("Information changed successfully");
    } else if (urlParams.has("err")) {
      // Get the modal element by its ID
      var modal = document.getElementById("parametreModal");

      // Open the modal using Bootstrap's modal function
      $(modal).modal("show");
      alert("login already exists");
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

<script>
  $(document).ready(function() {
	  $('.order-btn').click(function() {
		var productCode = $(this).data('product-code');
	    var productName = $(this).data('product-name');
	    var productPrice = $(this).data('product-price');
	    var productDesc = $(this).data('product-desc');
	    var productQtn = $(this).data('product-qtn');
	    var quantityInput = document.getElementById('qteCmd');
	    quantityInput.setAttribute('max', productQtn);
	    var codeInput = document.getElementById('code');
	    codeInput.setAttribute('value', productCode);
	    var qtnInput = document.getElementById('qtn');
	    qtnInput.setAttribute('value', productQtn);
	    $('#productCode').text(productCode);
	    $('#productName').text(productName);
	    $('#productPrice').text(productPrice);  
	    $('#productDesc').text(productDesc);
	    $('#productQtn').text(productQtn);
	    // Populate other product details as needed
	    
	    // Open the modal
	    $('#orderModal').modal('show');
	  });
	});

  </script>     
        
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="orderModalLabel">Order Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form method="post" action="confirmation.action">
      <div class="modal-body">
     
        <p>Code : <span id="productCode"></span></p>
        <p>Product : <span id="productName"></span></p>
        <p>Price : <span id="productPrice"></span></p>
        <p>Description : <span id="productDesc"></span></p>
        <p>Existing quantity : <span id="productQtn"></span></p>
        <p>chose the quantity you want to buy :   
        <input type="number" name="qteCmd" id="qteCmd" min="1" max=""/></p>
        <input type="hidden" name="codeArt" id="code" value=""/>
        <input type="hidden" name="qtn" id="qtn" value=""/>
         
        <!-- Add more product details here -->
      </div>
      <div class="modal-footer">
         
        <input type="submit" class="btn btn-primary" value="Place Order"/>
        
        
  
      </div>
      </form>
    </div>
  </div>
</div>


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
    <!-- END nav -->



    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<!--checher-->
    			</div>
    		</div>
    		<div class="row">
          <s:iterator value="articles">
    			<div class="col-md-2 col-lg-3 ftco-animate">        
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/<s:property value='codeArt'/>.jpg" alt="Image">
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#"><s:property value="nomArt" /></a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span class="mr-2 price"><s:property value="prixArt"/></span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<button class="btn btn-primary order-btn" data-toggle="modal" data-target="#orderModal" 
		                     data-product-code="<s:property value="codeArt" />"
		                     data-product-name="<s:property value="nomArt" />" 
		                     data-product-price="<s:property value="prixArt" />"
		                     data-product-desc="<s:property value="descArt" />"
		                     data-product-qtn="<s:property value="productMap.get(codeArt)" />"
		                     
		                     ><i class="fa fa-cart-plus" aria-hidden="true"></i></button>
    							</div>
    						</div>
    					</div>
    				</div>	
    			</div></s:iterator></div>    			
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
    	</div>
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

  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

 <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>