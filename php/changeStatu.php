<?php 
	error_reporting(E_ALL ^ E_NOTICE);



	$act = $_GET['act'];
	$msgId = $_POST['msgId'];

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);

	if($act == "setIsRead"){
		$query = mysqli_query($conn,"UPDATE message set isRead = '1' where msgId = '$msgId' ");
		if($query){

		}
	}
	else{
		session_start();
		$userId = $_SESSION['currUser']['userId'];	//当前登录用户
		unset($_SESSION['currUser']);
		session_write_close();
	 	$query = mysqli_query($conn,"UPDATE user set status = 'off' where userId = '$userId' ");
	}
	
	mysqli_close($conn);
	exit();
 ?>