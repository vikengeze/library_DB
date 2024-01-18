<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Author-Update-Make.php" method="GET" align="center">
		<p style="font-size:70px;text-align:center;color:white;
		font-family:myfont">Author Details:</p>
				<?php
					$con = mysqli_connect("localhost:3306","root","","Basic");
					if (mysqli_connect_errno())
					{
						die('Could not connect');
					}
					
					$AuthorID = $_GET['AuthorID'];
										
					$myquery = "
					SELECT 
						* 
					FROM 
						author
					WHERE
						AuthorID = '$AuthorID'
					";
										
					$result	= mysqli_query($con,$myquery);
					
					if ($result != FALSE) {
						$row = mysqli_fetch_array($result);

						$AFirst 			= 	$row['AFirst'];
						$ALast 				= 	$row['ALast'];
						$ABirthDate 		= 	$row['ABirthDate'];			
					}
					else { 
						echo '<div align="center"> Error, no results </div>';
					}
					mysqli_close($con);
				?>
			<br><br>
			<div>
				<label for="AFirst">First Name: </label>
				<input type="text" name="AFirst" 
				style="width:70%" required
				value="<?=$AFirst?>" >
			</div>
			<br><br>
			<div>
				<label for="ALast">Last Name: </label>
				<input type="text" name="ALast" 
				style="width:70%" required
				value="<?=$ALast?>" >
			</div>
			<br><br>
			<div>
				<label for="ABirthDate">Birth Date: </label>
				<input name="ABirthDate" 
				style="width:70%" required
				value="<?=$ABirthDate?>" >
			</div>
			<br><br>
			<input type="hidden" name="OldAuthorID" value="<?=$AuthorID?>" >
			<input type="submit" value="Update">
		</form>
	</body>

</html>