<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Login</title>
  <!-- MDB -->
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/css/mdb.min.css" rel="stylesheet">
 
	<!-- JQuery -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/js/mdb.min.js"></script>
  
  <!-- bootstrap/jquery cdn-->
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
		  .navbar-nav > li > a{
		    padding-top:4px ; 
		    padding-bottom:0 ;
		    height: 28px;
		}
		.navbar {min-height:20px ;}
  </style>
</head>

<!--Main Navigation-->
<header>
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <a class="navbar-brand" href="#"><strong><font color="#000000">Navbar</font></strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#"><font color="#000000">主页</font><span class="sr-only">(current)</span></a>
        </li>
      </ul>
    </div>
  </nav>
</header>

<body background="ui/img/background.jpg">
	<!-- logo/theme -->
	<div class="col-md-3" style="position:absolute;top:18%;left:7%">
		<img src="ui/img/logo.png" height=150 width=150></img> 
	</div>
	<div class="col-md-3" style="position:absolute;top:25%;left:11%">
		<img src="ui/img/theme_login.png" height=180 width=900></img> 
	</div>
	<!-- form login -->
	<div class="col-md-3" style="position:absolute;top:17%;right:18%">
		<form class="text-center border border-dark p-5">
		
		    <p class="h4 mb-4"><strong>登 录</strong></p>
		
		    <!-- Email -->
		    <input type="email" id="LoginFormEmail" class="form-control mb-4" placeholder="E-mail">
		
		    <!-- Password -->
		    <input type="password" id="LoginFormPassword" class="form-control mb-4" placeholder="Password">
		
		    <div class="d-flex justify-content-around">
		        <div>
		            <!-- Remember me -->
		            <div class="custom-control custom-checkbox">
		                <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
		                <label class="custom-control-label" for="defaultLoginFormRemember">记住用户</label>
		            </div>
		        </div>
		        <div>
		            <!-- Forgot password -->
		            <a href="">忘记密码?</a>
		        </div>
		    </div>
		
		    <!-- Sign in button -->
		    <button class="btn btn-info btn-block my-4" type="submit">登 录</button>
		
		    <!-- Register -->
		    <p>不是会员?
		        <a href="">注 册</a>
		    </p>
		
		    <!-- Social login -->
		    <p>社交平台登录:</p>
		
		    <a type="button" class="light-blue-text mx-2">
		        <i class="fab fa-facebook-f"></i>
		    </a>
		    <a type="button" class="light-blue-text mx-2">
		        <i class="fab fa-twitter"></i>
		    </a>
		    <a type="button" class="light-blue-text mx-2">
		        <i class="fab fa-linkedin-in"></i>
		    </a>
		    <a type="button" class="light-blue-text mx-2">
		        <i class="fab fa-github"></i>
		    </a>
		</form>
	</div>
</body>