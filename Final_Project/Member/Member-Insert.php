<?php	
	$con = mysqli_connect("localhost:3306","root","","Basic");
	if (mysqli_connect_errno())
	{
		die('Could not connect');
	}
	$Mfirst				=		$_GET['Mfirst'];
	$Mlast				=		$_GET['Mlast'];
	$MBirthDate			=		$_GET['MBirthDate'];
	$Street				=		$_GET['Street'];
	$StreetNumber		=		$_GET['StreetNumber'];
	$PostalCode			=		$_GET['Postal_Code'];

	if (
		$Mfirst				===	'' 
		or $Mlast			===	'' 
		or $Street			===	'' 
		or $StreetNumber	===	'' 
		or $PostalCode		===	''	)
		{
			header('Location:Member-Insert.html');
			exit;
		}
	
	$result = mysqli_query($con, "INSERT INTO member(
		`memberID`,
		`MFirst`, 
		`MLast`, 
		`MBirthDate`,
		`Street`, 
		`StreetNumber`,
		`PostalCode`
		) VALUES (
		'DEFAULT',
		'$Mfirst', 
		'$Mlast', 
		'$MBirthDate',
		'$Street', 
		'$StreetNumber',
		'$PostalCode'
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
