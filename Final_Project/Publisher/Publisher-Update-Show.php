<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Publisher-Update-Make.php" method="GET" align="center">
		<p style="font-size:70px;text-align:center;color:white;
		font-family:myfont">Publisher Details:</p>
				<?php
					$con = mysqli_connect("localhost:3306","root","","Basic");
					if (mysqli_connect_errno())
					{
						die('Could not connect');
					}
					
					$PubName = $_GET['PubName'];
										
					$myquery = "
					SELECT 
						* 
					FROM 
						publisher
					WHERE
						PubName = '$PubName'
					";
										
					$result	= mysqli_query($con,$myquery);
					
					if ($result != FALSE) {
						$row = mysqli_fetch_array($result);

						$EstYear 			= 	$row['EstYear'];
						$Street 			= 	$row['Street'];
						$Number 			=	$row['Number'];
						$PostalCode 		=	$row['PostalCode'];				
					}
					else { 
						echo '<div align="center"> Error, no results </div>';
					}
					mysqli_close($con);
				?>
			<br><br>
			<div>
				<label for="EstYear">Year Established: </label>
				<input type="number" name="EstYear" 
				style="width:40%" required
				value="<?=$EstYear?>" >
			</div>
			<br><br>
			<div>
				<label for="Street">Street: </label>
				<input type="text" name="Street" required
				value="<?=$Street?>" >
			</div>
			<br><br>
			<div>
				<label for="Number">Street Number: </label>
				<input type="number" name="Number" required
				value="<?=$Number?>" >
			</div>
			<br><br>
			<div>
				<label for="PostalCode">Postal Code: </label>
				<input type="number" name="PostalCode" required
				value="<?=$PostalCode?>" >
			</div>
			<br><br>
			<input type="hidden" name="OldPubName" value="<?=$PubName?>" >
			<input type="submit" value="Update">
		</form>
	</body>

</html>