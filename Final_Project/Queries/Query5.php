<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
	</head>
	
	
	<body>
		<p style="font-size:40px;text-align:center;color:white;
		font-family:myfont">Reminders sent</p>
	<br><br>

	<form align="center">
	<?php

		$con = mysqli_connect("localhost:3306","root","","Basic");
		if (mysqli_connect_errno())
		{
			die('Could not connect');
		}

		$result = mysqli_query($con,"	SELECT
										    e.EFirst,
										    e.ELast,
										    m.Mfirst,
										    m.Mlast,
										    r.DAte_of_reminder
										FROM
										    employee e
										INNER JOIN reminder r ON
										    e.EmpID = r.EmpID
										INNER JOIN member m ON
										    m.MemberID = r.MemberID
										ORDER BY
										    r.Date_of_reminder DESC");

		echo "
			<table border='1' align=center style=background:#f2f2f2>
			<tr>
			<th>Employee</th>
			<th>Name</th>
			<th>Member</th>
			<th>Name</th>
			<th>Date reminded</th>
			</tr>";

		while($row = mysqli_fetch_array($result))
		{
			echo "<tr>";
			echo "<td>" . $row['EFirst'] . "</td>";
			echo "<td>" . $row['ELast'] . "</td>";
			echo "<td>" . $row['Mfirst'] . "</td>";
			echo "<td>" . $row['Mlast'] . "</td>";
			echo "<td>" . $row['DAte_of_reminder'] . "</td>";
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