<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add a Flight Page</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>


<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">

	<!-- Add form -->
	<section class="add">
		<div class="container">
			<div class="add-content">
				<div class="add-form">
					<h2 class="form-title">Add a Flight</h2>

					<form method="post" action="add-flight" class="register-form"
						id="register-form">
						<div class="form-group">
							<label for="airlinecode">
								<select name="airlinecode" id="airlinecode">
									<%
										String db = "lumipad";
										String user; // assumes database name is the same as username
										user = "root";
										String password = "password";
										try {
											Connection con;
											Class.forName("com.mysql.cj.jdbc.Driver");
											con = DriverManager.getConnection(String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db),user, password);

											Statement stmt = con.createStatement();

											String sqlQuery = "SELECT `Airline Code`, `Airline Name` FROM Airline;";
											ResultSet rs = stmt.executeQuery(sqlQuery);

											while (rs.next()) {
												String airlineCode = rs.getString(1);
												String airlineName = rs.getString(2);

												out.println("<option value='>" + airlineCode + "'>" + airlineName + "</option>");
											}
											rs.close();
											stmt.close();
											con.close();
										} catch(SQLException | ClassNotFoundException e) {
											out.println("SQLException caught: " + e.getMessage());
											// out.println(Arrays.toString(e.getStackTrace()));
										}
									%>
								</select>
								<i
									class="zmdi zmdi-account material-icons-name"></i>
							</label>
						</div>
						<div class="form-group">
							<label for="flightno"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="flightno" id="flightno" placeholder="Flight number" />
						</div>


						<div class="form-group">
							<label for="origin"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="origin" id="origin" placeholder="Origin airport" />
						</div>
						
						<div class="form-group">
							<label for="deptime"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="deptime" id="deptime" placeholder="Departure time" />
						</div>
						
						<div class="form-group">
							<label for="depgate"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="depgate" id="depgate" placeholder="Departure gate" />
						</div>
						
						<div class="form-group">
							<label for="destination"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="destination" id="destination" placeholder="Destination airport" />
						</div>
						
						<div class="form-group">
							<label for="arrtime"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="arrtime" id="arrtime" placeholder="Arrival time" />
						</div>
						
						<div class="form-group">
							<label for="arrgate"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="arrgate" id="arrgate" placeholder="Arrival gate" />
						</div>

						<div class="form-group">
							<label for="baggage"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="baggage" id="baggage" placeholder="Baggage claim" />
						</div>
						
						<div class="form-group">
							<label for="aircraftcode"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="aircraftcode" id="aircraftcode" placeholder="Aircraft" />
						</div>
						
						<div class="form-group">
							<label for="date"><i class="zmdi zmdi-lock-outline"></i></label> <input
								type="text" name="date" id="date" placeholder="Date" />
						</div>
						
						

						<div class="form-group form-button">
							<input type="submit" name="addflight" id="addflight"
								class="form-submit" value="AddFlight" />
						</div>
					</form>
				</div>
				<div class="signup-image">
					<figure>
						<img src="images/signup-image.jpg" alt="sing up image">
					</figure>
					<a href="login.jsp" class="signup-image-link">I am already
						member</a>
				</div>
			</div>
		</div>
	</section>


</div>
<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "success"){
		swal("Nice!", "Account created successfully","success");
	}
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>