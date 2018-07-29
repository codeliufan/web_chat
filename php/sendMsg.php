<?php 
	error_reporting(E_ALL ^ E_NOTICE);

	session_start();
	$userId = $_SESSION['currUser']['userId'];	//当前登录用户
	session_write_close();

	$msgId = $_POST['msgId'];
	$receiver = $_POST['receiver'];
	$sender = $_POST['sender'];
	$msg = $_POST['msg'];
	$seconds = $_POST['seconds'];
	$time = date("Y-m-d H:i:s",$seconds);

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);

	$query = mysqli_query($conn,"INSERT INTO message VALUES ('$msgId','$receiver','$sender','','','','','$time','0','$msg','')");
	if($query){
		echo $time;	//插入成功
	}
	mysqli_close($conn);
	exit();
 ?>