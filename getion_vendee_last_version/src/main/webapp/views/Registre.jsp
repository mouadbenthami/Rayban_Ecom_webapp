<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sign up</title>
        <script>
  document.addEventListener("DOMContentLoaded", function() {
    // Check if the openModal parameter is present in the URL
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("Err")) {
    	 alert("password and confirm password must be the same");
    }if(urlParams.has("Err1"))
    {
    	alert("login already exists");
    }
  });
</script>

    <!-- Custom fonts for this template-->
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
   
</head>
<body style="background-color:#82AE46;">
<script>
window.onload = function () 
{
    function changeImage() {   
        var BackgroundImg=["images/background3.gif",
            "images/background4.gif",
            "images/background5.gif",
            "images/background6.gif"
        ];
        var i = Math.floor((Math.random() * 4));
        document.getElementById('id').style.backgroundImage = 'url("' + BackgroundImg[i] + '")';
    }
    window.setInterval(changeImage, 3000);
}

//style="background-image: url('frontOffice/jsp/background3.gif');
</script>
    <div class="container">
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div id='id' class="col-lg-5 d-none d-lg-block "  style="background-image: url('frontOffice/images/background3.gif');background-repeat: no-repeat;" >
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an account</h1>
                            </div>
                            <form class="user" action="signUp.action" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="login" placeholder="Login">
                                </div>
                               
                                <div class="form-group">
                                    
                                        <input type="password" class="form-control form-control-user" name="Pass" placeholder="password">
                                </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" name="ConfPass" placeholder="Repte password">
                                    </div>
                                
                                <input type="submit" class="btn btn-primary btn-user btn-block">
                            </form>
                            <br><p>already have an account ? <a href="index.action">Login here</a></p>
                        </div>
                         <br><br><br>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
    </div>
    
<!--     <script type="text/javascript">
    var status =document.getElemnetId("status").value;
    if(status=="failed")
    	{
    		swal("soory","password is failed","failed");
    	}
    
    </script> 
    -->
</body>
</html>