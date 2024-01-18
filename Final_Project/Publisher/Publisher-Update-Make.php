<?php	
	$con = mysqli_connect("localhost:3306","root","","Basic");
	if (mysqli_connect_errno())
	{
		die('Could not connect');
	}
	
	$OldPubName 			=		$_GET['OldPubName'];
	$EstYear				=		$_GET['EstYear'];
	$Street					=		$_GET['Street'];
	$Number					=		$_GET['Number'];
	$PostalCode				=		$_GET['PostalCode'];

	if (
		$OldPubName					===	'' 
		or $EstYear					===	'' 
		or $Street					===	'' 
		or $Number					===	'' 
		or $PostalCode				===	'' )
		{
			header('Location:Publisher-Update.html');
			exit;
		}
	
	$myquery = "UPDATE publisher
		SET 
			PubName				=	'$OldPubName',
			EstYear 			= 	'$EstYear', 
			Street 				=	'$Street', 
			Number				= 	'$Number',
			PostalCode			= 	'$PostalCode'
		WHERE
			PubName = '$OldPubName'
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
		<meta http-equiv="refresh" content="2; ../After-Update.html" />
		<h1 			
			style="font-size:70px;text-align:center;color:white;
			font-family:myfont">Redirecting you in 3 seconds...		
		</h1>
	</body>
</html>