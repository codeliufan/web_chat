<?php
	error_reporting(E_ALL ^ E_NOTICE);
	function _post($attr){
		$val = !empty($_POST[$attr]) ? $_POST[$attr] : null;
		return $val;
	}
	$user = _post('userName');
	$pwd = _post('password');
	$sex = _post('sex');
	$age = _post('age');

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);
	$query = mysqli_query($conn,"SELECT userId FROM user WHERE userId = '$user' ");
	$count = mysqli_num_rows($query);
	if($count){	
		echo "用户名重复！";
	}else{
		$imgSrc = "avatar/chris.jpg";
		$query2 = mysqli_query($conn,"INSERT INTO user VALUES ('$user','$pwd','$sex','$age','off','$user','$imgSrc') ");
		if($query2){
			echo "注册成功！";
		}else{
			echo "什么情况？";
		}
	}
	mysqli_close($conn);
?>