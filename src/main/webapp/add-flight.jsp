<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div style="text-align: right; padding: 20px;">
    <form action="logout" method="get">
        <input type="submit" value="Logout" />
    </form>
</div>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Add Flights</h2>

						<!-- Here -->
						<form method="post" action="AddflightServlet" class="addflight-form"
							id="addflightform">
							<div class="form-group">
								<label for="airlinecode"><i class="zmdi zmdi-airplane"></i></label>
								<input type="text" name="airlinecode" id="airlinecode"
									placeholder="Airline Code" />
							</div>

							<div class="form-group">
								<label for="flightno"><i class="zmdi zmdi-airplane"></i></label>
								<input type="text" name="flightno" id="flightno"
									placeholder="Flight number" />
							</div>


							<div class="form-group">
								<label for="origin"><i class="zmdi zmdi-flight-takeoff"></i></label>
								<input type="text" name="origin" id="origin"
									placeholder="Origin airport" />
							</div>

							<div class="form-group">
								<label for="deptime"><i class="zmdi zmdi-alarm-check"></i></label>
								<input type="text" name="deptime" id="deptime"
									placeholder="Departure time" />
							</div>

							<div class="form-group">
								<label for="depgate"><i class="zmdi zmdi-badge-check"></i></label>
								<input type="text" name="depgate" id="depgate"
									placeholder="Departure gate" />
							</div>

							<div class="form-group">
								<label for="destination"><i
									class="zmdi zmdi-flight-land"></i></label> <input type="text"
									name="destination" id="destination"
									placeholder="Destination airport" />
							</div>

							<div class="form-group">
								<label for="arrtime"><i class="zmdi zmdi-time"></i></label> <input
									type="text" name="arrtime" id="arrtime"
									placeholder="Arrival time" />
							</div>

							<div class="form-group">
								<label for="arrgate"><i class="zmdi zmdi-time"></i></label> <input
									type="text" name="arrgate" id="arrgate"
									placeholder="Arrival gate" />
							</div>

							<div class="form-group">
								<label for="baggage"><i class="zmdi zmdi-shopping-cart"></i></label>
								<input type="text" name="baggage" id="baggage"
									placeholder="Baggage claim" />
							</div>

							<div class="form-group">
								<label for="date"><i class="zmdi zmdi-calendar"></i></label> <input
									type="date" name="date" id="date" placeholder="Date" />
							</div>

							<!-- Flight extra details -->
							<div class="form-group">
								<label for="status"><i class="zmdi zmdi-airplane"></i></label> <input
									type="text" name="status" id="status"
									placeholder="Flight Status" />
							</div>

							<div class="form-group">
								<label for="duration"><i class="zmdi zmdi-time"></i></label> <input
									type="text" name="duration" id="duration"
									placeholder="Flight Duration" />
							</div>

							<!-- First Class -->
							<div class="form-group">
								<label for="firstclassbooked"><i class="zmdi zmdi-seat"></i></label>
								<input type="text" name="firstclassbooked" id="firstclassbooked"
									placeholder="First Class Seats Booked" />
							</div>
							<div class="form-group">
								<label for="firstclassaval"><i class="zmdi zmdi-seat"></i></label>
								<input type="text" name="firstclassaval" id="firstclassaval"
									placeholder="First Class Seats Available" />
							</div>
							<div class="form-group">
								<label for="firstclassprice"><i class="zmdi zmdi-money"></i></label>
								<input type="text" name="firstclassprice" id="firstclassprice"
									placeholder="First Class Price" />
							</div>

							<!-- Business Class -->
							<div class="form-group">
								<label for="bussclassbooked"><i class="zmdi zmdi-seat"></i></label>
								<input type="text" name="bussclassbooked" id="bussclassbooked"
									placeholder="Business Class Seats Booked" />
							</div>
							<div class="form-group">
								<label for="bussclassaval"><i class="zmdi zmdi-seat"></i></label>
								<input type="text" name="bussclassaval" id="bussclassaval"
									placeholder="Business Class Seats Available" />
							</div>
							<div class="form-group">
								<label for="bussclassprice"><i class="zmdi zmdi-money"></i></label>
								<input type="text" name="bussclassprice" id="bussclassprice"
									placeholder="Business Class Price" />
							</div>

							<!-- Economy Class -->
							<div class="form-group">
								<label for="ecoclassbooked"><i class="zmdi zmdi-seat"></i></label>
								<input type="text" name="ecoclassbooked" id="ecoclassbooked"
									placeholder="Economy Class Seats Booked" />
							</div>
							<div class="form-group">
								<label for="ecoclassaval"><i class="zmdi zmdi-seat"></i></label>
								<input type="text" name="ecoclassaval" id="ecoclassaval"
									placeholder="Economy Class Seats Available" />
							</div>
							<div class="form-group">
								<label for="ecoclassprice"><i class="zmdi zmdi-money"></i></label>
								<input type="text" name="ecoclassprice" id="ecoclassprice"
									placeholder="Economy Class Price" />
							</div>

							<!-- End flight extra details -->
							<div class="form-group form-button">
								<input type="submit" name="addflight" id="addflight"
									class="form-submit" value="AddFlight" />
							</div>
						</form>
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
		if (status == "success") {
			swal("Nice!", "Flight added successfully", "success");
		}
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<%-- 
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
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
	<!-- Logout button -->
	<div style="text-align: right; padding: 20px;">
		<form action="logout" method="get">
			<input type="submit" value="Logout" />
		</form>
	</div>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<!-- Add form -->
		<section class="add">
			<div class="container">
				<div class="add-content">
					<div class="add-form">
						<h2 class="form-title">Add a Flight</h2>

						<form method="post" action="addflight" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="airlinecode"> <select name="airlinecode"
									id="airlinecode">
										<%
										String db = "lumipad";
										String user; // assumes database name is the same as username
										user = "root";
										String password = "password";
										try {
											Connection con;
											Class.forName("com.mysql.cj.jdbc.Driver");
											con = DriverManager.getConnection(
											String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db), user, password);

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
										} catch (SQLException | ClassNotFoundException e) {
											out.println("SQLException caught: " + e.getMessage());
											// out.println(Arrays.toString(e.getStackTrace()));
										}
										%>
								</select> <i class="zmdi zmdi-account material-icons-name"></i>
								</label>
							</div>
							<div class="form-group">
								<label for="flightno"><i class="zmdi zmdi-airplane"></i></label>
								<input type="text" name="flightno" id="flightno"
									placeholder="Flight number" />
							</div>


							<div class="form-group">
								<label for="origin"><i class="zmdi zmdi-flight-takeoff"></i></label>
								<input type="text" name="origin" id="origin"
									placeholder="Origin airport" />
							</div>

							<div class="form-group">
								<label for="deptime"><i class="zmdi zmdi-alarm-check"></i></label>
								<input type="text" name="deptime" id="deptime"
									placeholder="Departure time" />
							</div>

							<div class="form-group">
								<label for="depgate"><i class="zmdi zmdi-badge-check"></i></label>
								<input type="text" name="depgate" id="depgate"
									placeholder="Departure gate" />
							</div>

							<div class="form-group">
								<label for="destination"><i
									class="zmdi zmdi-flight-land"></i></label> <input type="text"
									name="destination" id="destination"
									placeholder="Destination airport" />
							</div>

							<div class="form-group">
								<label for="arrtime"><i class="zmdi zmdi-time"></i></label>
								<input type="text" name="arrtime" id="arrtime"
									placeholder="Arrival time" />
							</div>

							<div class="form-group">
								<label for="arrgate"><i class="zmdi zmdi-time"></i></label>
								<input type="text" name="arrgate" id="arrgate"
									placeholder="Arrival gate" />
							</div>

							<div class="form-group">
								<label for="baggage"><i class="zmdi zmdi-shopping-cart"></i></label>
								<input type="text" name="baggage" id="baggage"
									placeholder="Baggage claim" />
							</div>

							<div class="form-group">
								<label for="aircraftcode"><i
									class="zmdi zmdi-lock-outline"></i></label> <input type="text"
									name="aircraftcode" id="aircraftcode" placeholder="Aircraft" />
							</div>

							<div class="form-group">
								<label for="date"><i class="zmdi zmdi-calendar"></i></label>
								<input type="text" name="date" id="date" placeholder="Date" />
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
		if (status == "success") {
			swal("Nice!", "Account created successfully", "success");
		}
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html> --%>