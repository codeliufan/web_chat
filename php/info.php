<?php
	error_reporting(E_ALL ^ E_NOTICE);
	$act = $_GET["act"];

	session_start();
	$userId = $_SESSION['currUser']['userId'];	//当前登录用户

	$sechUser = $_POST["sechUser"];
	$msgId = $_POST['msgId'];
	$time = date("Y-m-d H:i:s",floor($msgId/1000));

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);
	if($act == "add"){
		//是否有对方想自己发送的好友请求
		$query = mysqli_query($conn,"SELECT * from friend where userId = '$userId' and friendId = '$sechUser' ");
		$count = mysqli_num_rows($query);
		if($count == 0){
			//friendId向userId发起好友请求
			$insert_1 = mysqli_query($conn,"INSERT INTO friend VALUES ('','$sechUser','$userId','0') ");
			$insert_2 = mysqli_query($conn,"INSERT INTO message VALUES ('$msgId','$sechUser','$userId','','','','','$time','0','','request')");
			if($insert_1 && $insert_2){
				echo 1;
			}
		}
	}else if($act == "change"){
		$nickName = $_POST["nickName"];
		$sex = $_POST["sex"];
		$age = $_POST["age"];
		$avatar = $_POST["avatar"];

		$query = mysqli_query($conn,"UPDATE user SET sex='$sex',nickName='$nickName',age='$age',avatar='$avatar' where userId='$sechUser' ");
		if($query){
			$_SESSION['currUser']['sex'] = $sex;
			$_SESSION['currUser']['nickName'] = $nickName;
			$_SESSION['currUser']['age'] = $age;
			$_SESSION['currUser']['avatar'] = $avatar;
			session_write_close();
			echo 2;
		}
	}else if($act == "delete"){
		$query = mysqli_query($conn,"DELETE from friend where (userId = '$userId' and friendId = '$sechUser') or (userId = '$sechUser' and friendId = '$userId' ) ");
		$insert = mysqli_query($conn,"INSERT INTO message VALUES ('$msgId','$sechUser','$userId','','','','','$time','0','','delete')");
		if($query){
			if(mysqli_affected_rows($conn)>0){
				echo 3;
			}
		}
	}else if($act == "agree"){
		$update = mysqli_query($conn,"UPDATE friend set pass = 1 where userId = '$userId' and friendId = '$sechUser' ");
		$insert_1 = mysqli_query($conn,"INSERT INTO friend values ('','$sechUser','$userId',1) ");
		$insert_2 = mysqli_query($conn,"INSERT INTO message VALUES ('$msgId','$sechUser','$userId','','','','','$time','0','','response')");

		if($update && $insert_1 && $insert_2){
			echo 4;
		}
	}
?>