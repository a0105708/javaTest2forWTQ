<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    
    <head>
    <title>Login</title>
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
       
       
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="500733989831-6gtnolups4ah7q10cirg4q1gs0u384pl.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/client:platform.js?onload=render" async defer></script>
        <!--        <script>
                    function onSignIn(googleUser) {
                        var profile = googleUser.getBasicProfile();
                        console.log('ID: ' + profile.getId());
                        console.log('Name: ' + profile.getName());
                        console.log('Image URL: ' + profile.getImageUrl());
                        console.log('Email: ' + profile.getEmail());
                        var gmail = profile.getEmail();
                        document.getElementById('hiddenField').value = gmail;
                        //document.getElementById("myForm").submit();
                    }
                </script>
            
                <script>
          function render() {
            gapi.signin.render('reg_gp', {
              'callback': 'onSignIn',
              'clientid': '500733989831-6gtnolups4ah7q10cirg4q1gs0u384pl.apps.googleusercontent.com',
              'cookiepolicy': 'single_host_origin',
              'requestvisibleactions': 'http://schema.org/AddAction',
              'scope': 'https://www.googleapis.com/auth/plus.login'
            });
          }
          </script>-->


        <script src="https://apis.google.com/js/api:client.js"></script>

        <script>
            var googleUser = {};
            var startApp = function() {
                gapi.load('auth2', function() {
                    // Retrieve the singleton for the GoogleAuth library and set up the client.
                    auth2 = gapi.auth2.init({
                        client_id: '500733989831-6gtnolups4ah7q10cirg4q1gs0u384pl.apps.googleusercontent.com',
                        cookiepolicy: 'none',
                        // Request scopes in addition to 'profile' and 'email'
                        scope: 'https://www.googleapis.com/auth/plus.login'
                    });
                    attachSignin(document.getElementById('reg_gp'));
                });
            };

            function attachSignin(element) {
                console.log(element.id);
                auth2.attachClickHandler(element, {},
                        function(googleUser) {

                            var profile = googleUser.getBasicProfile();
                            console.log('ID: ' + profile.getId());
                            console.log('Name: ' + profile.getName());
                            console.log('Image URL: ' + profile.getImageUrl());
                            console.log('Email: ' + profile.getEmail());

                            var gmail = profile.getEmail();
                            var gmailName = profile.getName();
                            var gmailId = profile.getId();
                            document.getElementById('hiddenEmail').value = gmail;
                            document.getElementById('hiddenName').value = gmailName;
                            document.getElementById('hiddenId').value = gmailId;
                            document.getElementById("myForm").submit();
                        }, function(error) {
                    //alert(JSON.stringify(error, undefined, 2));
                });
            }
        </script>



        <script>
            // This is called with the results from from FB.getLoginStatus().
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);
                // The response object is returned with a status field that lets the
                // app know the current login status of the person.
                // Full docs on the response object can be found in the documentation
                // for FB.getLoginStatus().
                if (response.status === 'connected') {
                    // Logged into your app and Facebook.
                    testAPI();
                } else if (response.status === 'not_authorized') {
                    // The person is logged into Facebook, but not your app.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into this app.';
                } else {
                    // The person is not logged into Facebook, so we're not sure if
                    // they are logged into this app or not.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into Facebook.';
                }
            }

            // This function is called when someone finishes with the Login
            // Button.  See the onlogin handler attached to it in the sample
            // code below.
            function checkLoginState() {
                FB.getLoginStatus(function(response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function() {
                FB.init({
                    appId: '774442855996134',
                    cookie: false, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.2' // use version 2.2
                });

                // Now that we've initialized the JavaScript SDK, we call 
                // FB.getLoginStatus().  This function gets the state of the
                // person visiting this page and can return one of three states to
                // the callback you provide.  They can be:
                //
                // 1. Logged into your app ('connected')
                // 2. Logged into Facebook, but not your app ('not_authorized')
                // 3. Not logged into Facebook and can't tell if they are logged into
                //    your app or not.
                //
                // These three cases are handled in the callback function.

                FB.getLoginStatus(function(response) {
                    statusChangeCallback(response);
                });

            };

            // Load the SDK asynchronously
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

            // Here we run a very simple test of the Graph API after login is
            // successful.  See statusChangeCallback() for when this call is made.
            function testAPI() {
                console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', function(response) {
                    console.log('Successful login for: ' + response.name);
                    console.log('Successful login for: ' + response.email);
                    //document.getElementById('status').innerHTML =
                    //      'Thanks for logging in, ' + response.name + '!';
                    var facebook = response.email;
                    //document.getElementById('hiddenField1').value = facebook;

                });
            }
        </script>

        <script>
            window.fbAsyncInit = function() {
                FB.init({
                    appId: '774442855996134',
                    oauth: true,
                    status: true, // check login status
                    cookie: false, // enable cookies to allow the server to access the session
                    xfbml: true, // parse XFBML
                    version: 'v2.2'
                });

            };

            function fb_login() {
                FB.login(function(response) {

                    if (response.authResponse) {
                        console.log('Welcome!  Fetching your information.... ');
                        //console.log(response); // dump complete info
                        access_token = response.authResponse.accessToken; //get access token
                        user_id = response.authResponse.userID; //get FB UID

                        FB.api('/me', function(response) {
                            user_email = response.email; //get user email
                            // you can store this data into your database
                            console.log('Successful login for: ' + user_id);
                            console.log('Successful login for: ' + response.name);
                            console.log('Successful login for: ' + response.email);

                            var facebook = response.email;
                            var facebookName = response.name;
                            var facebookId = user_id;
                            document.getElementById('hiddenEmail').value = facebook;
                            document.getElementById('hiddenName').value = facebookName;
                            document.getElementById('hiddenId').value = facebookId;
                            FB.logout(function(response) {
                    // user is now logged out
                });
                            document.getElementById("myForm").submit();
                        });

                    } else {
                        //user hit cancel button
                        console.log('User cancelled login or did not fully authorize.');

                    }
                }, {
                    scope: 'publish_stream,email'
                });
            }
            (function() {
                var e = document.createElement('script');
                e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
                e.async = true;
                document.getElementById('fb-root').appendChild(e);
            }());



        </script>
        <script>
            auth2 = gapi.auth2.init();
            function all_logout() {

                FB.logout(function(response) {
                    // user is now logged out
                });


                auth2.signOut().then(function() {
                    console.log('User signed out.');
                });

            }
        </script>
        
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
           
            <!-- start login -->
            <section id="main">
                <div class="login-content">
                    <div class="pag-nav">
                        <ul class="p-list">
                            <li><a href="index.jsp">Home</a></li> &nbsp;&nbsp;/&nbsp;
                            <li class="act">&nbsp;Login</li>
                        </ul>
                    </div>
                    <div class="login-signup-form">
                        <div class="col-md-5 login text-center">
                            <h4>login</h4>
                            <div class="how_to">
                                <form id="myForm" action="login_result.jsp" method="post">
                                    <a href="#" onclick="fb_login();"><div class="reg_fb"><img src="images/facebook.png" alt=""><i>Facebook</i><div class="clearfix"></div></div></a>
                                    <a href="#" ><div id="reg_gp" class="reg_gp" ><img src="images/gp.png" alt=""><i>Google</i><div class="clearfix"></div></div></a>
                                    <script>
                                        startApp();
                                        all_logout();
                                    </script>
                                    <!--<a href="#" onclick="all_logout();"><i>logout</i></a>-->
                                    <iframe id="logoutframe" src="https://accounts.google.com/logout" style="display: none"></iframe>


                                    <!--                                <fb:login-button data-size="large" scope="public_profile,email" onlogin="checkLoginState();">
                                                                    </fb:login-button>
                                                                    <div id="status">
                                                                    </div>-->

                                    <input type='hidden' id= 'hiddenEmail' name='hiddenEmail' value=''/>
                                    <input type='hidden' id= 'hiddenName' name='hiddenName' value=''/>
                                    <input type='hidden' id= 'hiddenId' name='hiddenId' value=''/>
                                    <!--                                    <input type='hidden' id= 'hiddenFacebook' name='facebook' value=''/>
                                                                        <input type='hidden' id= 'hiddenFacebookName' name='facebookName' value=''/>
                                                                        <input type='hidden' id= 'hiddenFacebookId' name='facebookId' value=''/>-->
                                    <!--<a href="#"><div class="reg_gp"><div class="g-signin2"  data-onsuccess="onSignIn"></div><div class="clearfix"></div></div></a>-->
                                </form>
                                <p><img src="images/locked.png" alt="" />Be assured, we do not store your password</p>
                            </div>
                            <h5>OR</h5>

                            <script type="text/javascript">

                                function checkLogin(form)
                                {

                                    if (form.email.value == "") {
                                        alert("Please enter your email");
                                        form.email.focus();
                                        return false;
                                    }

                                    if (form.password.value == "") {
                                        alert("Please enter your password");
                                        form.password.focus();
                                        return false;
                                    }

                                    return true;
                                }

                            </script>
                            <form action="login_result.jsp" method="POST" onsubmit="return checkLogin(this);">
                                <div class="cus_info_wrap">
                                    <label class="labelTop">
                                        Email:
                                        <span class="require">*</span>
                                    </label>
                                    <input type="text" name="email">
                                </div>
                                <div class="clearfix"></div>
                                <div class="cus_info_wrap">
                                    <label class="labelTop">
                                        Password:
                                        <span class="require">*</span>
                                    </label>
                                    <input type="password" name="password">
                                </div>
                                <div class="clearfix"></div>
                                <div class="sky-form">
                                </div>
                                <div class="botton8">
                                    <input type="submit" value="LOGIN" class="botton">
                                </div>
                            </form>

                        </div>
                        <div class="col-md-5 sign-up text-center">

                            <h4>signup</h4>
                            New customer?
                            <div class="clearfix"></div>
                            <div class="sky-form">
                            </div>
                            <div class="botton5">
                                <form action="register.jsp">
                                    <input type="submit" value="Create Account" class="botton100" >
                                </form>

                            </div>

                            <div class="forgetit">
                                <script type="text/javascript">

                                    function checkReset(form)
                                    {

                                        if (form.email1.value == "") {
                                            alert("Please enter your email");
                                            form.email1.focus();
                                            return false;
                                        }
                                        return true;
                                    }

                                </script>
                                <form action="reset_result.jsp" method="POST" onsubmit="return checkReset(this);">
                                    <h4>Forgot Password?</h4>
                                    Enter email to reset it
                                    <input type="text" class="text" name="email1">
                                    <div class="clearfix"></div>
                                    <div class="sky-form">
                                        <br>
                                    </div>
                                    <div class="botton5">

                                        <input type="submit" value="SUBMIT" class="botton">

                                    </div>
                                </form>
                            </div>

                        </div>
                        <div class="col-md-2 benefits">
                            <h4>Benefits of signup</h4>
                            <p>Manage your purchases anytime: Track your order status and print your vouchers</p>
                            <p>Quick shopping: no need to fill in your contact and shipping details while buying</p>
                            <p>Easy access to member only benefits</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
        </div>
    </section>
    <%@include  file="/templates/footer.jsp"%>
</div>
</body>
</html>