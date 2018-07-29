$(function () {

	var regUser = /^[a-zA-Z][0-9a-zA-Z]{2,9}$/; //字母开头,3-10位字母数字组合
	var regPwd = /^[0-9a-zA-Z]{6}$/; //6位字母数字的组合
	var regAge = /^[0-9]{1,3}$/; //0-3位数字
	var checkForm = false;

	$("form input").focusin(function () {
		$(this).siblings("label").hide();
		$(this).siblings("p").remove();
	}).focusout(function () {
		if($(this).val() == ''){
			$(this).siblings("p").remove();
			$(this).siblings("label").show();
		}
		else if(this.name == "userName" && !regUser.test(this.value)){
			$(this).before("<p>用户名只能是字母开头,3-10位字母数字组合！</p>");
		}
		else if(this.name == "password" && !regPwd.test(this.value)){
			$(this).before("<p>密码只能是6位字母数字的组合！</p>");
		}

	});


	$("#submitBtn").click(function () {

		var userName = $("#userName").val();
		var password = $("#password").val();

		if(userName == '' || password == ''){
			$(".input_box p").remove();
			$("#userName").before("<p >请输入用户名或密码！</p>");
		}
		if(regUser.test(userName) && regPwd.test(password)){
			checkForm = true;
		}
		if(checkForm){
			$.ajax({
				url:"../php/signIn.php", //请求的地址
				type:"POST",			//请求的方式
				async:true,				//异步请求
				data:$("#signIn_form").serialize(), //序列化表单值，创建 URL 编码文本字符串
				error:function () {
					alert("error")
				},
				success:function (data) {
					
					if(data == '登录成功！'){
						window.location.href = "../index.html";
					}
					else{
						alert(data);
					}
				}
			})
		}
	})
})

