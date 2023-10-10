<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Yousra ELFRAANI & mouad BENTHAMI">
    <title>Login</title>
    
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script>
  document.addEventListener("DOMContentLoaded", function() {
    // Check if the openModal parameter is present in the URL
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("Err")) {
    	 alert("password or Login incorrect");
    }else if(urlParams.has("Msg"))
    {
    	alert("your account has been created");
    }
  });
</script>
</head>
<body style="background-color:#82AE46;">

<script>
window.onload = function () {

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
</script>

<div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block" id="id" style="background-image: url('images/background3.gif');"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                 <br><br><br>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome</h1>
                                    </div>
                                    <form class="user"	action="login.action" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                               name="user.login" aria-describedby="emailHelp"
                                                placeholder="Entrer your login...">
                                        </div>
                                        <div class="form-group">
                                                <input type="password" class="form-control form-control-user"
                                                name="user.pass" placeholder="Enter your password..." >
                                        </div>
                                         <input type="submit" class="btn btn-primary btn-user btn-block">
                                    </form>
                                    <br><p>Dont have an account ? <a href="registre.action">Signup Now</a></p>
                                </div>
                               <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>