// $(document).ready(function() {
// 	// 调用各页面封装的接口和执行事件绑定已完成页面交互

//一下为register.jsp
function inUsr() {
	username_mess.innerHTML = "4-20位字符，可由中文、英文、数字及'_'、'-'组成;";
	username_mess.style.color = "grey";
	username_mess.style.visibility = "visible";

}
function outUsr() {
	var u = $("#form-usr").val();
		if (u == "") {
			username_mess.style.visibility = "hidden";
			return false;
		}
		reg = /.{4,20}/;             //代表着允许4到20位字符
		if (!reg.test(u)) {
			username_mess.innerHTML = "用户名长度只能在4-20位字符之间";
			username_mess.style.color = "red";
			username_ok.style.visibility = "hidden";
			return false;
		}
		reg = /^[\u4e00-\u9fa5 \w-]{4,20}$/; //代表着中文字符和\w（\w能够代替[a-zA-Z0-9_]）还有-
		if (reg.test(u)) {
			var s=false;
				$.ajax({
                url: "checkUsr.do?usrName="+u,
                //同步方式
                async: false,
					type: "POST",
                //指定请求成功后执行的回调函数
                 success: function (data) {
                    if(data==1){
						username_mess.innerHTML="用户名可用";
						username_mess.style.color = "grey";
						s=true;
                    }else {
                       username_mess.innerHTML="用户名已被占用";
						username_mess.style.color = "red";
						s=false;
                    }
				 },
                error: function () {
                    alert("error");
					s=false;
                }
            });
			 return s;
		} else {
			username_mess.innerHTML = "用户名只能由中文、英文、数字及'_'、'-'组成";
			username_mess.style.color = "red";
			return false;
		}
}
function inEmail() {
	mail_mess.innerHTML = "请输入常用的邮箱，将用来找回密码、接收通知等";
	mail_mess.style.visibility = "visible";
	mail_mess.style.color = "grey";
}

function outEmail() {

	var mm = $("#form-email").val();
	if (mm == "") {
		mail_mess.innerHTML = "邮箱不可为空";
		mail_mess.style.color = "red";
		mail_mess.style.visibility = "visible";
		return false;
	} else {
		reg=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		if(reg.test(mm)){
			var status=false;
			$.ajax({
                url: "checkEmail.do?usrEmail="+mm,
                //同步方式
                async: false,

                type: "POST",
                //指定请求成功后执行的回调函数
                 success: function (data) {
                    if(data==1){
						mail_mess.innerHTML="邮箱可用";
						mail_mess.style.color = "grey";
						status=true;
                    }else {
                       mail_mess.innerHTML="邮箱已被占用";
						mail_mess.style.color = "red";
						status=false;
                    }

                },
                error: function () {
                    alert("error");
					s=false;
                }
            });

			return status;
		}else{
		mail_mess.innerHTML="邮箱格式不正确";
        mail_mess.style.color="red";
		return false;
		}
	}

}

function inPassWd() {
	pass_mess.innerHTML = "6-16位字符，可由英文、数字及'_'、'-'组成;";
	pass_mess.style.visibility = "visible";
	pass_mess.style.color = "grey";
}
function outPassWd() {
	var p = $("#form-password").val();
	if (p == "") {
		pass_mess.style.visibility = "hidden";
		return false;
	}
	reg = /.{6,16}/;             //代表着允许4到20位字符
	if (!reg.test(p)) {
		pass_mess.innerHTML = "密码长度只能在6-16位字符之间";
		pass_mess.style.color = "red";
		return false;
	}
	reg = /^[\u4e00-\u9fa5 \w-]{6,16}$/;           //代表着允许4到20位字符
	if (!reg.test(p)) {
		pass_mess.innerHTML = "6-16位字符，可由英文、数字及'_'、'-'组成;";
		pass_mess.style.color = "red";
		return false;
	} else {
		pass_mess.innerHTML = "密码可用√";
		pass_mess.style.color = "grey";
		return true;

	}
}
function inRePassWd() {
	rpass_mess.innerHTML = "请重复密码...";
	rpass_mess.style.visibility = "visible";
	rpass_mess.style.color = "grey";
}
function outRePassWd() {
	var p = $("#form-password").val();
		var rp = $("#form-repeat-password").val();
		if (rp == "") {
			rpass_mess.style.visibility = "hidden";
			return false;
		}
		if (!(rp == p)) {
			rpass_mess.innerHTML = "两次输入的密码不一致";
			rpass_mess.style.color = "red";
			confirmedPassword.style.color = "red";
			confirmedPassword.style.border = "1px solid red";
			rpass_ok.style.visibility = "hidden";
			return false;
		} else {
			rpass_mess.innerHTML = "";
			return true;

		}
}
$("#submitBtn").click(function () {
		var postData = $("#registerform").serialize();

		if (outUsr() && outEmail() && outPassWd() && outRePassWd()) {
			$.ajax({
				url: "register.do",
				//同步方式
				async: false,
				data: postData,
				type: "POST",
				//指定请求成功后执行的回调函数
				success: function (data) {
					if (data == 1) {
						alert("注册成功！前往登陆界面！");
						window.location.href = "login.jsp";
					} else {
						alert("用户名已被占用，请重新输入！");

					}

				},
				error: function () {
					alert("error");
				}
			});
		} else {
			alert("输入信息有误,请检查后重新输入!");
			return false;
		}
	});

//以下为login.jsp
$(function(){
    $("#loginBtn").click(function(){
        var postData = $("#loginform").serialize();
		$.ajax({
                url: "login.do",
                //同步方式
                async: false,
                data: postData,
                type: "POST",
                //指定请求成功后执行的回调函数
                 success: function (data) {
                    if(data==1){
						window.location.href="index.jsp";
                    }else if(data==2){
                        alert("密码错误，请重新输入！");

                    }else {
                        alert("用户名不存在！")
                    }

                },
                error: function () {
                    alert("error");
                }
            });

    })
});

//一下为getback.jsp.
function hidemess() {

	usr_mess.style.visibility = "hidden";
	usr_mess.innerHTML = "";
	usr_mess.style.visibility = "hidden";
	usr_mess.innerHTML = "";

}
function checkUsrname() {
	var u = $("#usrname").val();
	var s = false;
	if(u==""){
		usr_mess.innerHTML = "用户名不可为空";
		usr_mess.style.color = "red";
		usr_mess.style.visibility = "visible";
		s= false;
	} else {
		$.ajax({
			url: "checkUsr.do?usrName=" + u,
			//同步方式
			async: false,
			type: "POST",
			//指定请求成功后执行的回调函数
			success: function (data) {
				if (data == 1) {
					usr_mess.innerHTML = "用户不存在";
					usr_mess.style.color = "red";
					usr_mess.style.visibility = "visible";
					s = false;
				} else {
					usr_mess.style.visibility = "hidden";
					usr_mess.innerHTML = "";
					s = true;
				}
			},
			error: function () {
				alert("error");
				s = false;
			}
		});
	}
	return s;

}
function checkEmail() {
	var u = $("#usrEmail").val();
	var s = false;
	if ( u== "") {
		usr_mess.innerHTML = "邮箱不可为空";
		usr_mess.style.color = "red";
		usr_mess.style.visibility = "visible";
		s= false;
	} else {
		$.ajax({
			url: "checkEmail.do?usrEmail=" + u,
			//同步方式
			async: false,
			type: "POST",
			//指定请求成功后执行的回调函数
			success: function (data) {

				if (data == 1) {
					usr_mess.innerHTML = "邮箱未注册";
					usr_mess.style.color = "red";
					usr_mess.style.visibility = "visible";
					s = false;
				} else {
					usr_mess.style.visibility = "hidden";
					usr_mess.innerHTML = "";
					s = true;
				}
			},
			error: function () {
				alert("error");
				s = false;
			}
		});
	}
	return s;
}
$("#getback").click(function () {

var email= $("#usrEmail").val();
	var name= $("#usrname").val();
		if (checkEmail() && checkUsrname() ) {
			$.ajax({
				url: "getback.do?usrEmail="+ email+"&usrName="+name,
				//同步方式
				async: false,

				type: "POST",
				//指定请求成功后执行的回调函数
				success: function (data) {
					if (data == 1) {
						alert("发送成功！")

					} else {
						alert("用户名和邮箱不匹配！");

					}

				},
				error: function () {
					alert("error");
				}
			});
		} else {
			alert("输入信息有误,请检查后重新输入!");
			return false;
		}
	});

//以下为resetPassword.jsp

function inPass() {
	pass_message.innerHTML = "6-16位字符，可由英文、数字及'_'、'-'组成;";
	pass_message.style.visibility = "visible";
	pass_message.style.color = "grey";
}
function outPass() {
	var p = $("#password").val();
	if (p == "") {
		pass_mess.style.visibility = "hidden";
		return false;
	}
	reg = /.{6,16}/;             //代表着允许4到20位字符
	if (!reg.test(p)) {
		pass_message.innerHTML = "密码长度只能在6-16位字符之间";
		pass_message.style.color = "red";
		return false;
	}
	reg = /^[\u4e00-\u9fa5 \w-]{6,16}$/;           //代表着允许4到20位字符
	if (!reg.test(p)) {
		pass_message.innerHTML = "6-16位字符，可由英文、数字及'_'、'-'组成;";
		pass_message.style.color = "red";
		return false;
	} else {
		pass_message.innerHTML = "密码可用√";
		pass_message.style.color = "grey";
		return true;

	}
}
function inRePass() {
	rpass_message.innerHTML = "请重复密码...";
	rpass_message.style.visibility = "visible";
	rpass_message.style.color = "grey";
}
function outRePass() {
	var p = $("#password").val();
		var rp = $("#repeatpassws").val();
		if (rp == "") {
			rpass_message.style.visibility = "hidden";
			return false;
		}
		if (!(rp == p)) {
			rpass_message.innerHTML = "两次输入的密码不一致";
			rpass_message.style.color = "red";
			rpass_message.style.visibility = "visible";
			return false;
		} else {
			rpass_message.innerHTML = "";
			return true;

		}
}
$("#reset").click(function () {

var password= $("#password").val();

		if (outPass() && outRePass() ) {
			$.ajax({
				url: "updatePass.do?password="+ password,
				//同步方式
				async: false,

				type: "POST",
				//指定请求成功后执行的回调函数
				success: function (data) {
					alert("重置成功！前往登陆页面");
					window.location.href="login.jsp";
				},
				error: function () {
					alert("error");
				}
			});
		} else {
			alert("输入信息有误,请检查后重新输入!");
			return false;
		}
	});

