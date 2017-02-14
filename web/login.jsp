<!DOCTYPE html>
<html lang="en">

    <head>
        <%@page contentType="text/html; charset=UTF-8" language="java" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>3DFeet</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/my.css">


        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />

		<%--<link rel="stylesheet" type="text/css" href="css/component.css" />--%>



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->


    </head>
<body>
		<!-- Top menu -->
		<nav class=" navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">3DFeet</a>

				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->

			</div>
		</nav>

    <div>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">

                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登陆</h3>
                                    <h5>厂家后台系统</h5>

                        		</div>

                            </div>
                            <div class="form-bottom">
			                    <form role="form" id="loginform" action="login.do" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">用户名</label>
			                        	<input type="text" name="form-username" placeholder="用户名..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">密码</label>
			                        	<input type="password" name="form-password" placeholder="密码..." class="form-password form-control" id="form-password">
			                        </div>

                                     <div class="form-group">
			                        	 <button type="button" id="loginBtn" class="btn btn-next">登陆</button>
                                     </div>

			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3>...或者</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2" href="register.jsp">
	                        		新用户注册
	                        	</a>
	                        	<a class="btn btn-link-2" href="getback.jsp">
	                        		找回密码?
	                        	</a>

                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
</div>

        <!-- Javascript -->
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/login.js"></script>

    <!--[if lt IE 10]>
            <script src="js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
