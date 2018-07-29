<?php 
	error_reporting(E_ALL ^ E_NOTICE);

	session_start();
	$userId = $_SESSION['currUser']['userId'];	//当前登录用户
	$friend[0] = $_SESSION['currUser'];

	$act = $_GET['act'];
	$searchUser = $_POST['searchUser'];

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);


	if(!empty($userId)){
		if($act == 'search'){
			$query = mysqli_query($conn,"SELECT avatar,userId,nickName,age,sex,status FROM user WHERE userId = '$searchUser'");
			$count = mysqli_num_rows($query);
			if($count !== 0){
				$rows = mysqli_fetch_object($query);

				$pass =mysqli_query($conn,"SELECT pass FROM friend WHERE userId = '$searchUser' and friendId = '$userId' or friendId = '$searchUser' and userId = '$userId' ");
				$rows1 = mysqli_fetch_object($pass);

				$sechRel["info"] = $rows;
				$sechRel["pass"] = $rows1;
				echo json_encode($sechRel);
			}
		}else{
			$query = mysqli_query($conn,"SELECT user.userId,sex,age,status,nickName,avatar,pass from (select friendId,pass from friend where userId = '$userId') a left join user on a.friendId = user.userId");
			$count = mysqli_num_rows($query);

			if($count !== 0){
				while($row = mysqli_fetch_object($query)){
					$friend[] = $row;
				}
			}else{

			}
			echo json_encode($friend);
		}
	}
	mysqli_close($conn);
	exit();
 ?>