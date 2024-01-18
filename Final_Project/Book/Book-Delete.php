<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Book-Delete-Make.php" method="GET" align="center">
		<p style="font-size:70px;text-align:center;color:white;
		font-family:myfont">Select a book:</p>
			<div>
				<?php
					$link = mysqli_connect("localhost:3306","root","","Basic");
					$sql = "SELECT ISBN, Title FROM book";
					$result = mysqli_query($link,$sql);
					if ($result != FALSE) {
						echo '<label for="ISBN">Select a book: </label>
								<select required  style="width:60%" name="ISBN">
								<option value="" disabled selected>
								Select your option</option>';
								$num_results = mysqli_num_rows($result);
								for ($i=0;$i<$num_results;$i++) {
									$row = mysqli_fetch_array($result);
									$ISBN = $row['ISBN'];
									$Title = $row['Title'];
								echo '<option value="' .$ISBN. '">' .$ISBN. ' - '.$Title.' </option>';
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