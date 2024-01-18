<?php	
	$con = mysqli_connect("localhost:3306","root","","Basic");
	if (mysqli_connect_errno())
	{
		die('Could not connect');
	}

	$memberID				=		$_GET['memberID'];
	$ISBN					=		$_GET['ISBN'];
	$CopyNr					=		$_GET['CopyNr'];
	$Date_of_borrowing		=		$_GET['Date_of_borrowing'];

	$date = date("Y-m-d");	

	$myquery = "UPDATE borrows
		SET 
			Date_of_return = '$date'
		WHERE
			memberID 			= '$memberID' AND
			ISBN     			= '$ISBN' AND
			CopyNr  			= '$CopyNr' AND
			Date_of_borrowing 	= '$Date_of_borrowing'
		";

	$result = mysqli_query($con, $myquery);

	if($result === FALSE) {
		die(mysqli_error($con)); 
	}
	mysqli_close($con);
?>	


<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19	 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>
	
	<body>
		<meta http-equiv="refresh" content="2; ../Homepage.html" />
		<h1 
			style="font-size:70px;text-align:center;color:white;
			font-family:myfont">Redirecting you in 3 seconds...
		</h1>
	</body>
</html>