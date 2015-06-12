
<!DOCTYPE html>
<html>
 <head>
        <title>Sign up</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <!-- start slider -->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <!--end slider -->
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <script type="text/javascript">
            $(window).load(function () {
            	$("#flexiselDemo").flexisel({
                    visibleItems: 5,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 2
                        },
                        tablet: {
                            changePoint: 768,
                            visibleItems: 3
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
       <script src="https://apis.google.com/js/client:platform.js" async defer></script>
       </head>

<body>
	<!-- header-section-starts -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
		<div class="header-right">
					<ul>
						<li>
							<i class="user"></i>
							<a href="login.jsp">Login</a>                                    
						</li>
                                                
						<li class="login">
							<i class="lock"></i>				            
							<a href="register.jsp">Sign up</a>
						</li>
						
					</ul>
				</div>

				<div class="clearfix"></div>

			</div>

		</div>

		<div class="wrap">

			<div class="header-bottom">
				<div class="logo">
					<a href="index.jsp"><img src="images/newapp-icon.png" class="img-responsive" alt="" /></a>
				</div>
                            <div class="search">
					<div class="search2">
					  <form action="searchProduct.jsp" method="GET">
						<input type="submit" value="">
						<input type="text" name="productName" value="Search for a product, category or brand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a product, category or brand';}"/>
					  </form>
					</div>
				</div>
				
				<div class="clearfix"></div>
			</div>

		</div>

	</div>
	<!-- header-section-ends -->
	<div class="wrap">

		<!-- start registration -->
		<section id="main">
	<div class="content">
		<div class="pag-nav">
			<ul class="p-list">
				<li><a href="index.jsp">Home</a></li> &nbsp;&nbsp;/&nbsp;
				<li class="act">&nbsp;Register</li>
			</ul>
		</div>
		 <%  String registerResult = request.getParameter("registerResult");
		 
                            if (registerResult != null && registerResult.equals("true")) {
                        %>
                        <div class="alert alert-success">
                        Account is registered successfully.             
                        </div>

                        <%
                            }
                        %>
                        
                        <% if (registerResult != null && registerResult.equals("false")) {
                        	 String message1=request.getParameter("message");
                        %>
                        <div class="alert alert-danger">
                        Error happened. Registration failed. <% out.print(message1); %>             
                        </div>
                       
                               
                      

                        <%
                           }
                        %>
		<div class="coats">
			<h3 class="c-head">create an account</h3>
			<p>Please fill in all the following blanks, and your email will be used as your account ID.</p>
		</div>
            <script type="text/javascript">

            function checkForm(form)
            {
                if (form.first.value == "") {
                    alert("Please enter your name");
                    form.first.focus();
                    return false;
                }
                
                if (form.last.value == "") {
                    alert("Please enter your name");
                    form.last.focus();
                    return false;
                }
                if (form.email.value == "") {
                    alert("Please enter your email");
                    form.email.focus();
                    return false;
                }
                if (form.gender.value == "") {
                    alert("Please select your gender");
                    form.gender.focus();
                    return false;
                }
                if (form.password.value == "") {
                    alert("Please enter your password");
                    form.password.focus();
                    return false;
                }
                if (form.password1.value == "") {
                    alert("Please confirm your password");
                    form.password1.focus();
                    return false;
                }
                if (form.password1.value !=form.password.value ) {
                    alert("Please enter same password");
                    form.password1.focus();
                    return false;
                }
                var x = form.email.value;
                var atpos = x.indexOf("@");
                var dotpos = x.lastIndexOf(".");
                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                    alert("Please enter a valid email address");
                    return false;
                }
                
                return true;
            }

        </script>
            <form action="registerServlet" method="POST" onsubmit="return checkForm(this);">
		<div class="register">
                    
			 <div class="register-top-grid">
				<h3>PERSONAL INFORMATION</h3>
				 <div>
					<span>First Name</span>
					<input type="text" name="first"> 
				 </div>
				 <div>
					<span>Last Name</span>
					<input type="text" name="last"> 
				 </div>
				 <div>
					 <span>Email Address</span>
					 <input type="text" name="email"> 
				 </div>
                                <div>
					 <span>Gender</span>
                                         <input type="radio" name="gender" value="Male"><span>Male</span>
                                         <input type="radio" name="gender" value="Female"><span>Female</span>
                                </div>
				  </div>
				  
				 </div>
				 
				 
			     <div class="register-bottom-grid">
					    <h3>LOGIN INFORMATION</h3>
						 <div>
							<span>Password</span>
							<input type="password" name="password">
						 </div>
						 <div>
							<span>Confirm Password</span>
							<input type="password" name="password1">
						 </div>
				 </div>
			
			<div class="clearfix"> </div>
			<div class="register-but">
			   
                            <input type="submit" value="Submit">
				   <div class="clearfix"> </div>
			   
			</div>
            </form>
	   </div>
	</div>
	</div>
	</div>
	    
</body>
</html>