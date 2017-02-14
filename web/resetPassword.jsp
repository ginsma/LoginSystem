<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8"%>
<html lang="zh" class="no-js">
	<head>

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>重置密码</title>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/my.css">
		<!--[if IE]>
  		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
		<![endif]-->
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
			<section class="content bgcolor-4" style="text-align: center" >
				<h2>找回密码</h2>
		   <form id="resetPass" role="form" action="reset.do" method="post" >

				<span class="input input--kuro">
					<div id="pass_message" class="errorAlert">6-16位字符，可由英文、数字及"_"、"-"组成</div>
					<input  type="password" class="input__field input__field--kuro" type="text" id="password" onfocus="inPass()" onblur="outPass()"/>
					<label class="input__label input__label--kuro" for="password">
						<span class="input__label-content input__label-content--kuro">请输入密码...</span>
					</label>
				</span>
                <br>
				<span class="input input--kuro">
					<div id="rpass_message" class="errorAlert">请再次输入密码</div>
					<input type="password" class="input__field input__field--kuro" type="text" id="repeatpassws" onfocus="inRePass()" onblur="outRePass()"/>
					<label class="input__label input__label--kuro" for="repeatpassws">
						<span class="input__label-content input__label-content--kuro">请确认密码..</span>
					</label>
				</span>
                <br>
                <span class="input input--kuro">
                <button type="button" class="btn btn-block  btn-lg" id="reset"  style="background: #de615e">确认</button>
                </span>
			   </form>
			</section>
                <%--</div>--%>
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