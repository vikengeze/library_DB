<?php	
	$con = mysqli_connect("localhost:3306","root","","Basic");
	if (mysqli_connect_errno())
	{
		die('Could not connect');
	}
	$Title				=		$_GET['Title'];
	$PubYear			=		$_GET['PubYear'];
	$NumPages			=		$_GET['NumPages'];
	$PubName			=		$_GET['PubName'];

	if (
		$Title				===	'' 
		or $PubYear			===	'' 
		or $PubName			===	'' 
		or $NumPages		===	'' 	)
		{
			header('Location:Book-Insert.html');
			exit;
		}
	
	$result = mysqli_query($con, "INSERT INTO book(
		`ISBN`,
		`Title`, 
		`PubYear`, 
		`NumPages`, 
		`PubName`
		) VALUES (
		DEFAULT,
		'$Title', 
		'$PubYear', 
		'$NumPages', 
		'$PubName'
	)");
		
	if($result === FALSE) {
		die(mysqli_error($con)); 
	}
	mysqli_close($con);
?>	

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>
	
	<body>
		<meta http-equiv="refresh" content="2; ../After-Insert.html" />
		<h1 
			style="font-size:70px;text-align:center;color:white;
			font-family:myfont">Redirecting you in 3 seconds...
		</h1>
	</body>
</html>
