<!DOCTYPE html>

<html style="background-image:url(../Images/background.jpg);">

	<head>
		<title> DB 2018-19 </title>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="../CSS/stylesheet_general.css"/>
		<link rel="icon" href="../Images/favicon.png"/>
		<p style="font-size:60px;text-align:center;color:white;
		font-family:myfont">Insert your memberID and the book you would like to borrow</p>
		
	</head>

	<body>
		<form action="Borrow_Make.php" method="GET">
			<div>
				<?php
					$link = mysqli_connect("localhost:3306","root","","Basic");
					$sql = "SELECT memberID, Mfirst, Mlast FROM member";
					$result = mysqli_query($link,$sql);
					if ($result != FALSE) {
						echo '<label for="memberID">Insert your Member ID: </label>
								<select required  style="width:60%" name="memberID">
								<option value="" disabled selected>
								Select your member ID</option>';
								$num_results = mysqli_num_rows($result);
								for ($i=0;$i<$num_results;$i++) {
									$row = mysqli_fetch_array($result);
									$memberID = $row['memberID'];
									$Mfirst = $row['Mfirst'];
									$Mlast = $row['Mlast'];
								echo '<option value="' .$memberID. '">' .$memberID. ' - '.$Mfirst.' '.$Mlast.'</option>';
							}
							echo '</select>';  
					}
					mysqli_close($link);
				?>
				</select>
			</div>
			<div>
				<?php
					$link = mysqli_connect("localhost:3306","root","","Basic");
					$sql = "SELECT DISTINCT b.ISBN, b.Title FROM book as b, copies as c WHERE b.ISBN=c.ISBN AND c.Availability=1";
					$result = mysqli_query($link,$sql);
					if ($result != FALSE) {
						echo '<label for="ISBN">Select your book: </label>
								<select required  style="width:60%" name="ISBN">
								<option value="" disabled selected>
								Select your book</option>';
								$num_results = mysqli_num_rows($result);
								for ($i=0;$i<$num_results;$i++) {
									$row = mysqli_fetch_array($result);
									$ISBN = $row['ISBN'];
									$Title = $row['Title'];
								echo '<option value="' .$ISBN. '">' .$ISBN. ' - '.$Title.'</option>';
							}
							echo '</select>';  
					}
					mysqli_close($link);
				?>
				</select>
			</div>
	
			<br><br>
			<input type="submit" value="Submit">
		</form>
	</body>

</html>