

$(function () {

	// 滚动
	var myScroll1 = new IScroll("#wrapper_fst",{
		mouseWheel : true
	})
	var myScroll2 = new IScroll("#wrapper_scd",{
		mouseWheel : true
	})
	var myScroll3 = new IScroll("#wrapper_trd",{
		mouseWheel : true
	})

	$("#jump").click(function () {
		if($(this).html() == '退出' && confirm("确认退出码?") == true){
			$.get("php/changeStatu.php",function (data) {
				console.log(data)
				window.location.href = 'html/signIn.html';
			});
		}else if($(this).html() == '登录'){
			window.location.href = 'html/signIn.html';
		}
	})


	// $(".fakeConfirm button").on("click",function () {
	// 	console.log($(this).attr("class"))
	// 		if($(this).attr("class") == "yes"){
	// 			bool = true;$(".fakeConfirm").hide();
	// 		}else if($(this).attr("class") == "no"){
	// 			bool = false;$(".fakeConfirm").hide();
	// 		}
	// });
	// function confirm(content){
	// 	var bool = "";
	// 	$(".fakeConfirm").show().find("p").text(content);

	// 	console.log(bool)
	// 	return bool;
	// }



	$(".my_request").click(function () {
		$(".request_li").addClass("active")
		.parents().find(".pal_li").removeClass("active");
		myScroll2.refresh();	//避免对齐后下方空白
	})

	$(".my_friend").click(function () {
		$(".pal_li").addClass("active")
		.parents().siblings().find(".request_li").removeClass("active");
		myScroll1.refresh();
	})
	//关闭聊天框
	$(".chat_top button").on("click",function () {
		$(".left").fadeOut(function () {
			$(this).find(".chat_top span").html('');
			chatObj = "";
		})
	});


	//更换头像
	$("#avatar").on("click",function () {
		if($("#userId").val() == sender.userId && $(".addBtn button").text() == "确认修改"){
			$(".pic_box").show().find("img").on("click",function () {
				$("#avatar").attr("src",$(this).attr("src"));
				$(".pic_box").hide();
			});
		}
	})

	var friend=[];
	var receiver = "";
	var time = "";
	var sender = "";
	var chatObj = "";
	var lastId = 0;
	var message = {};		//存储非当前聊天对象发来的信息
	var saveDialog={};		//存储本次的聊天记录
	var request = 0;		//申请好友的数目


	//取得好友信息
	function refresh(argument){
		$.get("php/load.php",function (data) {
			var getJson = JSON.parse(data);
			if(getJson[0]){
				sender = getJson[0];
				sender['path'] = '';
				$('#user').html(sender.userId).siblings('#jump').html('退出');
				// 修改个人信息 点击事件
				$(".avatar img").on("click",function () {
					showInfo(sender);
					$(".addBtn button").text("修改信息");
					$(".showInfo input:not(#userId,#status)").attr("readonly","readonly").css("background","rgba(154,195,179,.8)");
				})
			}
			$("#myName").html(sender.nickName);
			$(".avatar img").attr("src",sender.avatar)
			if(argument != "no"){		//需要更新好友列表
				friend = getJson.slice(1);
				getMyfriend(friend);	//得到好友列表
			}
			// console.log(argument);
		});
	}
	refresh();

	function getMyfriend (friend) {
		var name = '';
		// 循环好友
		$(".list_friend").not(":first").remove();
		$(".list_request").not(":first").remove();
		$.each(friend,function (index,element) {						
				if(element.pass == 1){//缓存数据到行上
					$(".list_friend:first").clone().show().insertAfter(".list_friend:first").data("rowInfo",element)
						.find('img').attr("src",element.avatar).end()
						.find('span:first').text(element.nickName).end()
						.find('.status').text(element.status);
				}else{
					$(".list_request:first").clone().show().insertAfter(".list_request:first").data("rowInfo",element)
						.find('img').attr("src",element.avatar).end()
						.find('span:first').text(element.nickName).end()
						.find('.status').text(element.status);
					if(request !== 0){
						$(".request").show().text(request);
					}
				}
		})	
		myScroll1.refresh();
		addClick();
	}
	// 给动态加载的好友添加点击事件
	function addClick() {
		$(".list_friend dd").on("click",function () {
			// 获取缓存到行上的信息
			var rowInfo = $(this).parents(".list_friend").data("rowInfo");
			chatObj = rowInfo.userId;
			$(".dia_box:gt(1)").remove();	//清空所有聊天框
			$(this).find("b").hide();		//隐藏未读标记
			$(".showInfo").hide();			//展示个人信息的盒子关闭

			if($(this).find('span:first').html() !== $(".chat_top span").html()){
				name = rowInfo.nickName;
				receiver = rowInfo;
													
				$(".left").hide().show();
				$(".chat_top span").html(name);
				myScroll3.refresh();
				myScroll3.scrollTo(0,myScroll3.maxScrollY,0);
			}

			if(saveDialog[chatObj]){			//本次登录是否有聊天记录
				$(".chat_info").html(saveDialog[chatObj]);
			}

			if(message[chatObj]){				//是否有该好友的未读信息
				$.each(message[chatObj],function (index,element) {
					var elem = $(".dia_box:eq(0)");
					addDialog(element.content,element,elem);
					setIsRead(element.msgId);

				})
				delete message[chatObj];
			}
			myScroll3.refresh();
			myScroll3.scrollTo(0,myScroll3.maxScrollY,0);

		});
/*		//移动端触摸事件
		$(".list_friend dd").bind("touchstart",function (e) {
			// 获取缓存到行上的信息is
			var rowInfo = $(this).parents(".list_friend").data("rowInfo");
			chatObj = rowInfo.userId;
			if($(this).find('span:first').html() !== $(".chat_top span").html()){
				name = rowInfo.nickName;
				receiver = rowInfo;

				$(".left").fadeOut().fadeIn();
				$(".chat_top span").html(name);
				myScroll3.refresh();
				myScroll3.scrollTo(0,myScroll3.maxScrollY,0);
			}
		})*/
		//查看好友信息 删除好友
		$(".list_friend img").on("click",function () {
			var rowInfo = $(this).parents(".list_friend").data("rowInfo");
			$(".left").hide();
			$(".chat_top span").html("");
			showInfo(rowInfo);
			$(".addBtn button").text("删除好友");
			$(".showInfo input:not(#userId,#status)").attr("readonly","readonly").css("background","rgba(154,195,179,.8)");
		})
		// 查看好友申请
		$(".list_request").on("click",function () {
			var rowInfo = $(this).data("rowInfo");
			showInfo(rowInfo);
			$(".addBtn button").text("选择操作");
			$(".showInfo input:not(#userId,#status)").attr("readonly","readonly").css("background","rgba(154,195,179,.8)");
		})
	}

	//信息展示函数
	function showInfo (obj) {
		$(".showInfo").show().find("#avatar").attr("src",obj.avatar).end()
										 .find("#userId").val(obj.userId).end()
										 .find("#nickName").val(obj.nickName).end()
										 .find("#sex").val(obj.sex).end()
										 .find("#age").val(obj.age).end()
										 .find("#status").val(obj.status);	
	}

	// 关闭信息展示div
	$(".closeBtn").on("click",function () {
		$(".showInfo").hide();
	})

	// 查找用户
	$(".search input").keydown(function (e) {
		if(e.keyCode == 13 && $(this).val()!==""){
			var searchUser = $(this).val();
			//发送查找id
			$.post("php/load.php?act=search",
				{searchUser:searchUser},
				function (data) {
					if(data){
						var obj = JSON.parse(data);
						var sechRes = obj["info"];
						console.log(obj["pass"])
						if(obj["pass"] == null){
							if(sechRes.userId == sender.userId){
								$(".addBtn button").text("修改信息");
							}else{
								$(".addBtn button").text("添加好友");
							}
						}else if(obj["pass"].pass == 1){
							$(".addBtn button").text("删除好友");
						}else if(obj["pass"].pass == 0){
							$(".addBtn button").text("已申请").css("background","#bbb");
						}
						showInfo(sechRes);	
					}else{
						alert("无此用户！")
					}
				}
			);
		}
	})
	// 按钮内文字对应事件
	$(".addBtn button").on("click",function () {
		var btn = $(this).text();
		var url = "php/info.php";
		var data;
		switch(btn){
		case "添加好友":
			url += "?act=add";
			var msgId = getSendTime();
			data = {
				sechUser:$("#userId").val(),
				msgId:msgId
			};
			break;
		case "修改信息":
			$(".showInfo input:not(#userId,#status)").removeAttr("readonly").css("background","#fff");
			$(this).text("确认修改");
			return;
		case "确认修改":
			url += "?act=change";
			data = {
				sechUser:$("#userId").val(),
				nickName:$("#nickName").val(),
				sex:$("#sex").val(),
				age:$("#age").val(),
				avatar:$("#avatar").attr("src")
			}
			break;
		case "删除好友":
			var notice = "确定要删除好友吗(删除后双方的联系人列表里都不在有对方的名字)?";
			if(confirm(notice) == true){
				url += "?act=delete";
				var msgId = getSendTime();
				data = {
					sechUser:$("#userId").val(),
					msgId:msgId
				}
				break;
			}else{
				return;
			}
		case "选择操作":
			var notice = "是否同意和对方成为好友？";
			if(confirm(notice) == true){
				url += "?act=agree";
				var msgId = getSendTime();
				data = {
					sechUser:$("#userId").val(),
					msgId:msgId
				}

				request --;
				$(".request").text(request)
				if(request == 0){
					$(".request").hide();
				}

				$(".pal_li").addClass("active")
				.parents().siblings().find(".request_li").removeClass("active");
				myScroll1.refresh();
				
			}else{
				return;
			}

		}


		$.ajax({
			url:url,
			type:"post",
			data:data,
			success:function (data) {
				console.log(data)
				if(data == 1){
					$(".addBtn button").text("已申请").css("background","#bbb");
				}else if(data == 2){
					alert("修改成功！")
					$(".showInfo").hide();
					refresh("no");					
				}else if(data == 3){
					alert("删除成功！");
					$(".showInfo").hide();
					refresh();
				}else if(data == 4){
					$(".showInfo").hide();
					refresh();
				}else{
					alert("操作失败！");
				}
			}
		})
	});



	// 发送消息
	$("#send_msg").keydown(function (e) {
		var e = e||window.event;
		if(e.keyCode == 13 && $(this).val() == ""){
			return false;
		}else if(e.keyCode == 13){
			e.preventDefault();
			var msg = $(this).val();
			$(this).val('');
			time = getSendTime();
			sendMsg(msg,sender,receiver,time);
		}
	})
	$("#send_btn").on("click",function () {
		var msg = $("#send_msg").val();
		if(msg !== ""){
			$("#send_msg").val('');
			time = getSendTime();

			sendMsg(msg,sender,receiver,time);
		}
	})

	function getSendTime () {
		var date = new Date();
		// return ''+date.getFullYear()+(date.getMonth()+1)+date.getDate()+date.getHours()+date.getMinutes()+date.getSeconds();
		return date.getTime();
	}
	function sendMsg (msg,sender,receiver,time) {
		var msgId = ""+time;
		time = Math.floor(time/1000);
		if(receiver.userId){
			$.ajax({
				url:"php/sendMsg.php",
				type:"post",
				async:true,
				data:{
					"msgId":msgId,
					"receiver":receiver.userId,
					"sender":sender.userId,
					"msg":msg,
					"seconds":time
				},
				error:function () {
					
				},
				success:function (data,response) {
					console.log(data)
					var elem = $(".dia_box:eq(1)");
					sender['path'] = '';
					if(data !== ""){
						sender['sendTime'] = data;
						addDialog(msg,sender,elem);
						sender['sendTime'] = "";
					}else{
						addDialog("发送失败！",sender,elem);
					}
/*					$(".list_request").each(function () {
						console.log(this)
					})*/
					
					// $(".list_request:first").clone().show().insertAfter(".list_request:first")
				}
			})
		}
	}
	// dom更新
	function addDialog(msg,obj,elem) {
		if(obj.path != ''){
			if(obj.extension == "jpeg"||obj.extension == "gif"||obj.extension == "jpg"||obj.extension == "png"||obj.extension == "bmp"||obj.extension == "pic"){
				elem.clone().show().appendTo(".chat_info")
				.find(".nickName").text(obj.nickName).end()
				.find(".time").text(obj.sendTime).end()
				.find(".dia_pic img").attr("src",obj.avatar).end()
				.find(".dialog").html("<a target='_blank' href='"+obj.path+"'><img src='"+obj.path+"' style='width:100%;height:100%' /></a>");
				myScroll3.refresh();
				myScroll3.scrollTo(0,myScroll3.maxScrollY-200,0);
			}else{
				elem.clone().show().appendTo(".chat_info")
				.find(".nickName").text(obj.nickName).end()
				.find(".time").text(obj.sendTime).end()
				.find(".dia_pic img").attr("src",obj.avatar).end()
				.find(".dialog").html("<p>"+obj.fileName+"</p><a target='_blank' href='"+obj.path+"'><img src='images/file.jpg' style='width:50px;height:50px;' />点击下载<br></a>文件大小：约 "+obj.bites);
				myScroll3.refresh();
				myScroll3.scrollTo(0,myScroll3.maxScrollY,0);
			}
		}else{
			elem.clone().show().appendTo(".chat_info")
			.find(".nickName").text(obj.nickName).end()
			.find(".time").text(obj.sendTime).end()
			.find(".dia_pic img").attr("src",obj.avatar).end()
			.find(".dialog").text(msg);
			myScroll3.refresh();
			myScroll3.scrollTo(0,myScroll3.maxScrollY,0);
		}
		
		saveDialog[chatObj] = $(".chat_info").html();

	}

	// 取得新消息
	getNewMsg();
	function getNewMsg () {
		// body...
		var newMsg = []; 
		$.ajax({
			url:"php/comet.php",
			type:"post",
			data:{time:"50",lastId:lastId},		//最迟25s返回信息
			timeout:80000,			//ajax请求超时时间 80s
			error:function () {
				getNewMsg();
			},
			success:function (data) {
				console.log(data)
				if(data){
					newMsg = JSON.parse(data);
				
					$.each(newMsg,function (index,element) {

					 	var elem = $(".dia_box:first");
					 	var msg = element.content;
					 	lastId = element.msgId;			//设置遍历到的最后一条消息的msgId为lastId
					 	
						//请求加好友
						if(element.type !== ""){
							console.log(element.type !== "")
							refresh();
							setIsRead(element.msgId);
							if(element.type == "request"){
								request++;
							}
						}
						// 消息发送方为当前聊天对象
					 	else if(element.sender == chatObj){
					 		addDialog(msg,element,elem);
					 		setIsRead(element.msgId);
					 	}
					 	//非当前聊天对象
					 	else{
					 		if(!message[element.sender]){
					 			message[element.sender] = [];
					 		}
					 		// console.log(message);
					 		message[element.sender].push(element);//把所有非当前聊天对象的未读消息放入message中
					 		$(".list_friend").not(":first").each(function () {
					 			if($(this).data("rowInfo").userId == element.sender){
					 				$(this).find("b").show().text(message[element.sender].length);
					 			}
					 		})					 		
					 	}					 
					})	
				}
				getNewMsg();
			}
		})	
	}

	function setIsRead (msgId) {
		$.post("php/changeStatu.php?act=setIsRead",{msgId:msgId},function (data) {

		})
	}


	// 发送文件
	$(".send_file").on("change",function (e) {
		var fd = new FormData();			//form data类
		if($(".send_file").get(0).files[0]){
			time = getSendTime();
			var msgId = ""+time;
			time = Math.floor(time/1000);

			var file = $(".send_file").get(0).files[0];

			fd.append("upLoad",1);
			fd.append("msgId",msgId);
			fd.append("receiver",receiver.userId);
			fd.append("sender",sender.userId);
			fd.append("seconds",time);

			fd.append("upFile",file);
			fd.append("fileName",file.name);
			fd.append("bites",file.size);
			var arrEx = file.name.split('.');
			fd.append("extension",arrEx[arrEx.length-1]);

			console.log($(".send_file").get(0).files[0]);
			$(this).val('');
		   
			$.ajax({
				url:"php/upFile.php",
				type:"post",
				processData:false,
				contentType:false,
				data:fd,
				error:function(data){
					
				},
				success:function (data) {
					var elem = $(".dia_box:eq(1)");
					console.log(data)
					if(data){
						var json = JSON.parse(data);			
						sender['path'] = json.path;
						sender['fileName'] = json.fileName;
						sender['bites'] = json.bites;
						sender['extension'] = json.extension;
						sender['sendTime'] = json.sendTime;
						addDialog('',sender,elem);
						sender['path'] = '';
						sender['fileName'] = '';
						sender['bites'] = '';
						sender['extension'] = '';
					}else{
						addDialog("发送失败！",sender,elem);
					}
				}
			})
		}

	})

	// 轮询 状态
	// function polling () {
	// 	$.post("polling.php",function (data) {
			
	// 	})
	// 	setTimeout(polling,60000);
	// }
	// setTimeout(polling,1000);
})
