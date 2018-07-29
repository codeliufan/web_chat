<?php 
	error_reporting(E_ALL ^ E_NOTICE);
	$time = $_POST['time'];
	if(empty($time)){
		exit();
	}
	session_start();
	$userId = $_SESSION['currUser']['userId'];	//当前登录用户
	session_write_close();

	$msg = array();
	$i=0;
	$flag = 0;
	$lastId = $_POST['lastId'];

	set_time_limit(0);	//不退出脚本

	$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
	mysqli_set_charset($conn,utf8);

	while(true){
		$i++;
		$query = mysqli_query($conn,"SELECT * from  (SELECT msgId,receiver,sender,fileName,extension,path,bites,sendTime,isRead,content,type,nickName,avatar from message left join user on sender = userId where receiver = '$userId' and isread = 0 and msgId > '$lastId' order by msgId desc limit 100) t order by msgID asc ");
		$count = mysqli_num_rows($query);
		if($count !== 0){
			while($row = mysqli_fetch_object($query)){
				$msg[] = $row;
			}
			echo json_encode($msg);
			
			mysqli_free_result($query); 
			mysqli_close($conn);
			exit();
		}else{
			if($i == $time){
				echo "";
				mysqli_close($conn);
				exit();
			}
		}
		sleep(1);
	}
 ?>