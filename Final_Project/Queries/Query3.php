<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
	</head>
	
	
	<body>
		<p style="font-size:40px;text-align:center;color:white;
		font-family:myfont">All books with multiple copies</p>
	<br><br>

	<form align="center">
	<?php

		$con = mysqli_connect("localhost:3306","root","","Basic");
		if (mysqli_connect_errno())
		{
			die('Could not connect');
		}

		$result = mysqli_query($con,"	SELECT
										    b.Title,
										    COUNT(b.ISBN = c.ISBN) AS NumberOfCopies
										FROM
										    book b
										INNER JOIN copies c ON
										    b.ISBN = c.ISBN
										GROUP BY
										    b.ISBN
										HAVING
										    COUNT(b.ISBN = c.ISBN) > 1");

		echo "
			<table border='1' align=center style=background:#f2f2f2>
			<tr>
			<th>Title</th>
			<th>Total Copies</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
		{
			echo "<tr>";
			echo "<td>" . $row['Title'] . "</td>";
			echo "<td>" . $row['NumberOfCopies'] . "</td>";
			echo "</tr>";
		}
		echo "</table>";
		mysqli_close($con);

	?>
	<br><br>	
			<a href = "../Homepage.html" button class="hover_button"
				style="width:20%"> Back to Homepage</a>
	</form>
	</body>
</html>