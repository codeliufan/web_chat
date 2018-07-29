<?php
	error_reporting(E_ALL ^ E_NOTICE);
	$msgId = $_POST['msgId'];
	$receiver = $_POST['receiver'];
	$sender = $_POST['sender'];
	$seconds = $_POST['seconds'];
	$time = date("Y-m-d H:i:s",$seconds);

	$fileName = $_POST["fileName"];

	if($_POST["bites"] < 1024){
		$bites = $_POST["bites"].'b';
	}else{
		$bites = $_POST["bites"]>=1024 && $_POST["bites"]<1048576 ? ceil($_POST["bites"]/1024).'kb' : ceil($_POST["bites"]/1048576).'m';
	}
	$extension = $_POST["extension"];
	if(isset($_POST['upLoad'])){
		$path = 'file/'.time().'.'.$extension;
		move_uploaded_file($_FILES['upFile']['tmp_name'],'../'.$path); 

		$conn = mysqli_connect("localhost","root","root","webchat")or die(mysqli_error());
		mysqli_set_charset($conn,utf8);

		$query = mysqli_query($conn,"INSERT INTO message VALUES ('$msgId','$receiver','$sender','$fileName','$extension','$path','$bites','$time','0','','')");

		if($query){
			$arr['path'] = $path;
			$arr['fileName'] = $fileName;
			$arr['bites'] = $bites;
			$arr['extension'] = $extension;
			$arr['sendTime'] = $time;
			echo json_encode($arr);	//插入成功
		}
		mysqli_close($conn);
		exit();

	}
?>