<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Lumipad</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="ArrivalsBoard.jsp"><img
				src="images/lumipad-logo.png" alt="Lumipad Logo"
				style="height: 100px;"> Lumipad</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Cancellation.jsp">Cancel</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="TicketHistory">Ticket
							History</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="UpcomingFlights">Upcoming
							Tickets</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<!-- This above line needs a servlet to allow logout -->

					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name")%></a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<h1>Flight Board</h1>
			<form action="SearchArrival" method="get">
				<!-- Search by Flight number -->
				Search by: <br>
				Flight Number:
				<input type="text" name="search"
					placeholder="Search for departures..">
				
				<br>
				<!-- Search by Airline and Arrival and Departure Airport -->
				Airline, Arrival, and Departure:
				<input type="text" name="airline" placeholder="Airline"> <input
					type="text" name="arrivalAirport" placeholder="Arrival Airport">
				<input type="text" name="departureAirport"
					placeholder="Departure Airport">

				<!-- Sort options -->
				<br>
				<select name="sortOption">
					<option value="`Departure Airport`.`Scheduled Departure`">Sort
						by...</option>
					<option value="`Arrival Airport`.`Scheduled Arrival`">Arrival
						Time</option>
					<option value="`Departure Airport`.Destination">Destination</option>
					<option value="`Arrival Airport`.Origin">Origin</option>
					<option value="`Arrival Airport`.`Airline Code`">Airline</option>
				</select> <input type="submit" value="Search">
			</form>
			<div>

				<table>
					<tr>
						<th colspan="2">Flight Number</th>
						<th>Origin</th>
						<th>Destination</th>
						<th>Scheduled Departure</th>
						<th>Scheduled Arrival</th>
						<th>Status</th>
						<th>Book</th>
					</tr>
					<%
					ResultSet rs = (ResultSet) request.getAttribute("results");
					if (rs != null) {
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getTime(5)%></td>
						<td><%=rs.getTime(6)%></td>
						<td><%=rs.getString(7)%></td>
						<td>
							<form action="ViewFlightDetails" method="get">
								<input type="hidden" name="flightNumber"
									value="<%=rs.getString(1) + rs.getInt(2)%>" /> <input
									type="submit" value="Book" />
							</form>
						</td>
					</tr>

					<%
					}
					} else {
					String db = "Lumipad";
					String user; // assumes database name is the same as username
					user = "root";
					String password = "password";
					try {
					Connection con;
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection(String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db),
							user, password);

					Statement stmt = con.createStatement();

					String sqlQuery = "SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n"
							+ "       `Departure Airport`.`Flight Number`,\n" + "       `Arrival Airport`.`Origin`,\n"
							+ "       Airports.`Display Name` AS `Destination`,\n" + "       `Departure Airport`.`Scheduled Departure`,\n"
							+ "       `Arrival Airport`.`Scheduled Arrival`,\n" + "       `Flights`.`Status`\n" + "FROM `Departure Airport`"
							+ "JOIN Airports ON `Departure Airport`.Destination = Airports.`Airport Code`\n"
							+ "JOIN `Arrival Airport` ON `Departure Airport`.`Flight Number` = `Arrival Airport`.`Flight Number`\n"
							+ "JOIN `Flights` ON `Departure Airport`.`Flight Number` = `Flights`.`Flight Number`\n"
							+ "ORDER BY `Scheduled Departure`";
					ResultSet rs2 = stmt.executeQuery(sqlQuery);

					while (rs2.next()) {
					%>
					<tr>
						<td><%=rs2.getString(1)%></td>
						<td><%=rs2.getInt(2)%></td>
						<td><%=rs2.getString(3)%></td>
						<td><%=rs2.getString(4)%></td>
						<td><%=rs2.getTime(5)%></td>
						<td><%=rs2.getTime(6)%></td>
						<td><%=rs2.getString(7)%></td>
						<td>
							<form action="ViewFlightDetails" method="get">
								<input type="hidden" name="flightNumber"
									value="<%=rs2.getString(1) + rs2.getInt(2)%>" /> <input
									type="submit" value="Book" />
							</form>
						</td>
					</tr>
					<%
					}
					rs2.close();
					stmt.close();
					con.close();
					} catch (SQLException | ClassNotFoundException e) {
					out.println("SQLException caught: " + e.getMessage());
					}
					}
					%>

				</table>
			</div>

<!-- 			<h2>Booking</h2>
			Book by Flight Number
			<form action="ViewFlightDetails" method="get">
				<input type="text" name="viewFlight" onkeyup='"ViewFlightDetails"'
					placeholder="Book a flight..."> <input type="submit"
					value="Book">
			</form> -->

		</div>
	</header>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Lumipad</small>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
