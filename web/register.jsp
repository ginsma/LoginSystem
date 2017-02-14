<!DOCTYPE html>
<html lang="en">

    <head>

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


		<style>
			.emailist{border:1px solid #bdbdbd; border-radius: 4px; background-color:#fff; color:#666; font-size:14px; list-style-type:0; padding:0; margin:0; overflow:hidden;}
.emailist li{padding:2px 11px; cursor:pointer;}
.emailist .on, .emailist li:hover{background-color:#eee;}

		</style>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
		 <%@page contentType="text/html; charset=UTF-8" language="java" %>
        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">

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

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="col-sm-6 col-sm-offset-3 form-box">

                                    <form id="registerform" role="form" action="register.do" method="post" class="registration-form">
                                        <div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>10s快速注册</h3>
		                        		</div>
                                        </div>
                                        <div class="form-bottom">
                                            <div class="form-group">
				                        	<label class="sr-only" for="form-usr">usrname</label>
				                        	<input type="text" name="form-usr" placeholder="请输入用户名..." class="form-email form-control" id="form-usr" onfocus="inUsr()" onblur="outUsr()" >

												<div id="username_mess" class="errorAlert"></div>
											</div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Email</label>
				                        	<input type="text" name="form-email" placeholder="请输入注册邮箱..." class="form-email form-control" id="form-email" onfocus="inEmail()" onblur="outEmail()">
											<div id="mail_mess" class="errorAlert">请输入常用的邮箱，将用来找回密码、接收通知等</div>
										</div>
				                        <div class="form-group">
				                    		<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="form-password" placeholder="请输入密码..." class="form-password form-control" id="form-password" onfocus="inPassWd()" onblur="outPassWd()">
											<div id="pass_mess" class="errorAlert"></div>
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-repeat-password">Repeat password</label>
				                        	<input type="password" name="form-repeat-password" placeholder="重复密码..."
				                        				class="form-repeat-password form-control" id="form-repeat-password" onfocus="inRPass()" onblur="outRPass()">
											<div id="rpass_mess" class="errorAlert">请再次输入密码</div>

				                        </div>

				                        <button type="button" id="submitBtn" class="btn btn-next">立刻注册</button>
											<button style="float:right" type="button" id="LoginBtn" class="btn btn-next" onclick="window.location.href='login.jsp'">直接登陆</button>
				                    </div>

			                    

		                    </form>

                        </div>
                    </div>
                </div>
        </div>
<div id="rpass_messs" class="errorAlert" ></div>


    </body>

</html>
 <script src="js/jquery-1.11.0.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/jquery.backstretch.min.js"></script>
<script src="js/login.js"></script>
<script src="js/jquery.mailAutoComplete-4.0.js"></script>

<script>
 $("#form-email").mailAutoComplete();
</script>
<!--[if lt IE 10]>
     <script src="js/placeholder.js"></script>
<![endif]-->