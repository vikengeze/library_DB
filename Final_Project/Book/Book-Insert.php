<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		
	</head>

	<body>
		<form action="Book-Insert-Make.php" method="GET" align="center">
		<p style="font-size:70px;text-align:center;color:white;
		font-family:myfont">Book Details:</p>
			<div>
				<label for="Title">Title: </label>
				<input type="text" name="Title" id="Title" 
				required autofocus placeholder="Please enter your book's Title" 
				pattern="[a-zA-Z0-9 ]+"
				title="Please enter a valid title">
			</div>
			<br><br>
			<div>
				<label for="PubYear">Year Published: </label>
				<input type="text" name="PubYear" id="PubYear" 
				required autofocus placeholder="Please enter the publishing year"
				pattern="[0-9]{4}" 
				title="Enter exactly 4 digits">
			</div>
			<br><br>
			<div>
				<label for="NumPages">Number of pages: </label>
				<input type=number name="NumPages" id="NumPages" 
				required autofocus placeholder="Please enter the number of pages"
				pattern="[0-9]{2,}" 
				title="Enter at least 2 digits">
			</div>
			<br><br>
			<div>
			<?php
					$link = mysqli_connect("localhost:3306","root","","Basic");
					$sql = "SELECT PubName FROM publisher";
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
								echo '<option value="' .$PubName. '">' .$PubName. '</option>';
							}
							echo '</select>';  
					}
					mysqli_close($link);
				?>
		</div>
		<br><br>
		<input type="submit" value="Submit">
	</body>
</html>