<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Publisher-Delete-Make.php" method="GET">
		<legend><h1>Delete a publisher </h1></legend>
			<div>
				<?php
					$link = mysqli_connect("localhost:3306","root","","Basic");
					$sql = "SELECT PubName, EstYear FROM publisher";
					$result = mysqli_query($link,$sql);
					if ($result != FALSE) {
						echo '<label for="PubName">Select a publisher: </label>
								<select required  style="width:60%" name="PubName">
								<option value="" disabled selected>
								Select your option</option>';
								$num_results = mysqli_num_rows($result);
								for ($i=0;$i<$num_results;$i++) {
									$row = mysqli_fetch_array($result);
									$PubName = $row['PubName'];
									$EstYear = $row['EstYear'];
								echo '<option value="' .$PubName. '">' .$PubName. ' - '.$EstYear.' </option>';
							}
							echo '</select>';  
					}
					mysqli_close($link);
				?>
				</select>
			</div>
			<br><br>
			<input type="submit" value="Delete">
		</form>
	</body>

</html>