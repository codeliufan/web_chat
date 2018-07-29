$(function () {

	var regUser = /^[a-zA-Z][0-9a-zA-Z]{2,9}$/; //字母开头,3-10位字母数字组合
	var regPwd = /^[0-9a-zA-Z]{6}$/; //6位字母数字的组合
	var regAge = /^[1-9]{1}[0-9]{0,1}$/; //0-3位数字


	$("form input").focusin(function () {
		$(this).siblings("label").hide();
		$(this).siblings("p").remove();
	}).focusout(function () {
		if($(this).val() == ''){
			$(this).siblings("p").remove();
			$(this).siblings("label").show();
		}
		//验证输入格式
		else if(this.name == "userName" && !regUser.test(this.value)){			
			$(this).before("<p>用户名只能是字母开头,3-10位字母数字组合！</p>");
		}
		else if(this.name == "password" && !regPwd.test(this.value)){
			$(this).before("<p>密码只能是6位字母数字的组合！</p>");
		}
		else if(this.name == "age" && !regAge.test(this.value)){
			$(this).before("<p>年龄只能是首位非0的1-2位数字！</p>");
		}
		else if(this == $(".checkPwd")[0] && this.value != $("#password").val()){
			$(".checkPwd").val('');
			$(this).before("<p>两次密码输入不一致！</p>");
		}
	});


	// 提交表单
	$("#submitBtn").click(function () {
		var userName = $("#userName").val();
		var password = $("#password").val();
		var age = $("#age").val();

		if(userName == '' || password == '' || age == ''){
			$(".input_box p").remove();
			$("#userName").before("<p >请填写完整信息！</p>");
		}
		else if(regUser.test(userName) && regPwd.test(password) && regAge.test(age)){
			$.ajax({
				url:"../php/signUp.php", //请求的地址
				type:"POST",			//请求的方式
				async:true,				//异步请求
				data:$("#signUp_form").serialize(), //序列化表单值，创建 URL 编码文本字符串
				error:function () {
					alert("error");
				},
				success:function (data) {
					$(".input_box p").remove();
					if(data == '注册成功！'){
						alert("注册成功！");
						window.location.href = "signIn.html";
					}else{
						$("#userName").before("<p >"+data+"</p>");
					}
				}
			})
		}	
	})
})

