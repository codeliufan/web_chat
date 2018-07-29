<?php
	error_reporting(E_ALL ^ E_NOTICE);
	function _post($attr){
		$val = !empty($_POST[$attr]) ? $_POST[$attr] : null;
		return $val;
	}
	$user = _post('userName');
	$pwd = _post('password');

	session_start();

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);
	$query = mysqli_query($conn,"SELECT * FROM user WHERE userId = '$user' ");
	$count = mysqli_num_rows($query);
	if($count == 1){
		$res_arr = mysqli_fetch_array($query);
		if($res_arr['userId'] == $user && $res_arr['password'] == $pwd){
			$changeStatus = mysqli_query($conn,"UPDATE user SET status = 'on' WHERE userId = '$user' ");
			$_SESSION['currUser'] = $res_arr;
			$_SESSION['currUser']['status'] = 'on';
			echo "登录成功！";
		}else{
			echo "密码错误！";
		}
	}else{
		echo "用户名不存在！";
	}
	mysqli_close($conn);
	exit();
?>