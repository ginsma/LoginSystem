<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8"%>
<html lang="zh" class="no-js">
	<head>

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>找回密码</title>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/my.css">
		<!--[if IE]>
  		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
		<![endif]-->

		<style>
			.emailist{border:1px solid #bdbdbd; border-radius: 4px; background-color:#fff; color:#666; font-size:14px; list-style-type:0; padding:0; margin:0; overflow:hidden;}
.emailist li{padding:2px 11px; cursor:pointer;}
.emailist .on, .emailist li:hover{background-color:#eee;}

		</style>
	</head>

	<body>
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
    <%--<div class="row">--%>
            <%--<div class="col-md-8">--%>
			<section class="content bgcolor-4" style="text-align: center">

				<div id="usr_mess" class="errorAlert"></div>

					<div class="input input--haruki">
					<input class="input__field input__field--haruki" type="text" id="usrname" onfocus="hidemess()" onblur="checkUsrname()"/>
					<label class="input__label input__label--haruki" for="usrname">
						<span class="input__label-content input__label-content--haruki">用户名</span>
					</label>

				</div>
                <br>
				<div class="input input--haruki">
					<input class="input__field input__field--haruki" type="text" id="usrEmail" onfocus="hidemess()" onblur="checkEmail()" />
					<label class="input__label input__label--haruki" for="usrEmail">
						<span class="input__label-content input__label-content--haruki">注册邮箱</span>
					</label>

					<br><br><br><br>
					 <button type="button" class="btn btn-block  btn-lg" id="getback"  style="background: #de615e">找回密码</button>

				</div>


				</section>    <%--</div>--%>
		<%--</div><!-- /container -->--%>
		<script src="js/classie.js"></script>
		<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();

		</script>
	</body>
</html>
 <script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/login.js"></script>
<script src="js/jquery.mailAutoComplete-4.0.js"></script>
<script>
$("#usrEmail").mailAutoComplete();
</script>