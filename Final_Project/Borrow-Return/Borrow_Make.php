<?php	
	$con = mysqli_connect("localhost:3306","root","","Basic");
	if (mysqli_connect_errno())
	{
		die('Could not connect');
	}
	$memberID = $_GET['memberID'];
	$ISBN = $_GET['ISBN'];
	$result = mysqli_query($con, "SELECT min(c.CopyNr) FROM Copies as c WHERE c.ISBN = '$ISBN' AND c.Availability=1");
	$row = mysqli_fetch_row($result); 
	$CopyNr = $row[0]; 
	$date = date("Y-m-d");	
	$myquery1 = "INSERT INTO borrows(
		`memberID`,
		`ISBN`,
		`CopyNr`,
		`Date_of_borrowing`,
		`Date_of_return`
		)VALUES(
		'$memberID',
		'$ISBN',
		'$CopyNr',
		'$date',
		 NULL
		)";
	$myquery2 = "UPDATE copies
		SET 
			Availability = 0
		WHERE
			ISBN = '$ISBN' AND CopyNr = '$CopyNr'";

	$result = mysqli_query($con, $myquery2);		
	if($result === FALSE) {
		die(mysqli_error($con)); 
	}
	$result = mysqli_query($con, $myquery1);
	if($result === FALSE) {
		die(mysqli_error($con)); 
	}

	mysqli_close($con);
?>	


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
