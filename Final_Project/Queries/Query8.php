<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Search-Author.php" method="GET">
		<legend>
			<h1 			
			style="font-size:70px;text-align:center;color:white;
			font-family:myfont">Pick your author</h1>
		</legend>
			<div>
				<?php
					$link = mysqli_connect("localhost:3306","root","","Basic");
					$sql = "SELECT AuthorID, AFirst, ALast FROM author";
					$result = mysqli_query($link,$sql);
					if ($result != FALSE) {
						echo '<label for="AuthorID">Select an author: </label>
								<select required  style="width:60%" name="AuthorID">
								<option value="" disabled selected>
								Select your option</option>';
								$num_results = mysqli_num_rows($result);
								for ($i=0;$i<$num_results;$i++) {
									$row = mysqli_fetch_array($result);
									$AuthorID = $row['AuthorID'];
									$AFirst = $row['AFirst'];
									$ALast = $row['ALast'];
								echo '<option value="' .$AuthorID. '">' .$AuthorID. ' - '.$AFirst.' '.$ALast.'</option>';
							}
							echo '</select>';  
					}
					mysqli_close($link);
				?>
				</select>
			</div>
			<br><br>
			<input type="submit" value="Update">
		</form>
	</body>

</html>