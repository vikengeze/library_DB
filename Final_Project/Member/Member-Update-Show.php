<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Member-Update-Make.php" method="GET" align="center">
		<p style="font-size:70px;text-align:center;color:white;
		font-family:myfont">Member Details:</p>
				<?php
					$con = mysqli_connect("localhost:3306","root","","Basic");
					if (mysqli_connect_errno())
					{
						die('Could not connect');
					}
					
					$memberID = $_GET['memberID'];
										
					$myquery = "
					SELECT 
						* 
					FROM 
						member
					WHERE
						memberID = '$memberID'
					";
										
					$result	= mysqli_query($con,$myquery);
					
					if ($result != FALSE) {
						$row = mysqli_fetch_array($result);

						$Mfirst 			= 	$row['Mfirst'];
						$Mlast 				= 	$row['Mlast'];
						$MBirthDate			= 	$row['MBirthDate'];
						$Street 			= 	$row['Street'];
						$StreetNumber 		=	$row['StreetNumber'];
						$PostalCode 		=	$row['PostalCode'];				
					}
					else { 
						echo '<div align="center"> Error, no results </div>';
					}
					mysqli_close($con);
				?>
			<br><br>
			<div>
				<label for="Mfirst">First Name: </label>
				<input type="text" name="Mfirst" 
				style="width:70%" required
				value="<?=$Mfirst?>" >
			</div>
			<br><br>
			<div>
				<label for="Mlast">Last Name: </label>
				<input type="text" name="Mlast" 
				style="width:70%" required
				value="<?=$Mlast?>" >
			</div>
			<br><br>
			<div>
				<label for="MBirthDate">Birth Date: </label>
				<input name="MBirthDate" 
				style="width:70%" required
				value="<?=$MBirthDate?>" >
			</div>
			<br><br>
			<div>	
				<label for="Street">Street: </label>
				<input type="text" name="Street" required
				value="<?=$Street?>" >
			</div>
			<br><br>
			<div>
				<label for="StreetNumber">Street Number: </label>
				<input type="number" name="StreetNumber" required
				value="<?=$StreetNumber?>" >
			</div>
			<br><br>
			<div>
				<label for="PostalCode">Postal Code: </label>
				<input type="number" name="PostalCode" required
				value="<?=$PostalCode?>" >
			</div>
			<br><br>
			<input type="hidden" name="OldmemberID" value="<?=$memberID?>" >
			<input type="submit" value="Update">
		</form>
	</body>

</html>