<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Articles</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
    <!-- END nav -->
    
    
    <div class="card mx-auto">
  <div class="row">
    <div class="col">
      <img src="images/About-us.png" class="img-fluid" alt="about_us">
    </div>
    <div class="col">
      <div class="card-body">
        <h5 class="card-title">Welcome to RAYBAN, your premier store for stylish eyewear</h5>
        <p>Discover a diverse range of eyeglasses and sunglasses, meticulously curated to offer you the latest trends and timeless classics. 
          From the legendary Aviators to the iconic Wayfarers, we have the full range of Ray-Ban styles to suit any face shape, lifestyle, and occasion. Each pair of glasses embodies the perfect fusion of fashion-forward design and superior craftsmanship, ensuring that you not only look your best but also enjoy exceptional comfort and durability.
           At RayBan Direct, we pride ourselves on offering authentic Ray-Ban products sourced directly from authorized distributors. 
           We understand the importance of owning genuine eyewear that not only exudes style but also provides optimal vision and eye protection. 
           Rest assured that when you shop with us, you are getting the real deal, complete with the signature Ray-Ban logo and the unrivaled quality that the brand is known for..
       </p>
        <p class="card-text">
          <small class="text-muted">
            Grocery Store guarantees timely delivery and the highest quality<br>
            High-quality products<br>
            Unmatched customer service
          </small>
        </p>
        <p><a href="articles.action" class="btn btn-primary">Buy Now</a></p>
      </div>
    </div>
  </div>
</div>


<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_3.jpg);">
  <div class="container">
    <div class="row justify-content-center py-5">
      <div class="col-md-10">
        <div class="row">
          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="10000">0</strong>
                <span>Satisfied Customers</span>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="100">0</strong>
                <span>Products</span>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="1000">0</strong>
                <span>Orders</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">Testimonials</span>
            <h2 class="mb-4">What our satisfied customers say</h2>
            <p>You can send us your feedback <a href="contact.action">here</a></p>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                     <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">I just received my order today. I want to thank you for the excellent customer service and the seriousness of your service. Keep up the good work!</p>
                    <p class="name">Ahmed Bakkali</p>
                    <span class="position">Marketing Manager</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                    <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">Everything is perfect! I have placed three orders on your website, and each time I receive my merchandise the next day. The delivery person is friendly. Thank you, I give you 5 stars.</p>
                    <p class="name">Hicham Khaldi</p>
                    <span class="position">Interface Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                     <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">
						Greetings! I want to inform you that I received my order today.
						Everything is well packaged and in perfect condition.
						Thank you for your professionalism.
						For a first-time order, I am very satisfied and reassured.
						I will definitely come back to your store for future purchases.
						Thanks again to the entire team. Best of luck!
					</p>
                    <p class="name">Mohammed Elwardani</p>
                    <span class="position">UI Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_4.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                    <i class="fa fa-quote-left" aria-hidden="true"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">For a first-time order, I am very satisfied and reassured.
						I will definitely come back to your store for future purchases.
						Thanks again to the entire team. Best of luck!
					</p>
                    <p class="name">Issam Bennani</p>
                    <span class="position">Web Developer</span>
                  </div>
                </div>
              </div>
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