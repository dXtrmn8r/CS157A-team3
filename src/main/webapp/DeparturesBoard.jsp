<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<title>Project Lumipad</title>
<style>
table, th, td {
	border: 1px solid;
}

.logout {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	background-color: #f8f9fa;
	border: none;
	cursor: pointer;
}

.search-bar {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<a class="logout" href='logout'>Logout</a>
	<a href="FlightDetailServlet">View My Flight Details</a>
	<br> Search by Flight number
	<form action="SearchArrival" method="get">
		<input type="text" name="search" onkeyup='SearchArrival'
			placeholder="Search for departures.."> <input type="submit"
			value="Search">
	</form>
	Search by Airline and Arrival and Departure Airport
	<form action="SearchArrival" method="get">
		<input type="text" name="airline" placeholder="Airline"> <input
			type="text" name="arrivalAirport" placeholder="Arrival Airport">
		<input type="text" name="departureAirport"
			placeholder="Departure Airport"> <input type="submit"
			value="Search">
	</form>

	<form id="sortForm" action="SearchArrival" method="get">
		<select name="sortOption" onchange="this.form.submit()">
			<option value="`Departure Airport`.Destination">Arrival City</option>
			<option value="`Arrival Airport`.`Airline Code`">Airline</option>
			<option value="`Arrival Airport`.`Scheduled Arrival`">Arrival
				Time</option>
			<option value="`Arrival Airport`.Origin">Origin</option>
		</select>
	</form>

	<h1>Arrivals/Departures board</h1>
	<table>
		<tr>
			<th colspan="2">Flight Number</th>
			<th>Origin</th>
			<th>Scheduled Time</th>
			<th>Estimated Time</th>
		</tr>
		<%
		String db = "Lumipad";
		String user; // assumes database name is the same as username
		user = "root";
		String password = "password";
		try {
			Connection con;
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db), user, password);

			Statement stmt = con.createStatement();

			String sqlQuery = "SELECT `Arrival Airport`.`Airline Code` AS `Airline`,\n"
			+ "       `Arrival Airport`.`Flight Number`,\n" + "       Airports.`Display Name` AS Origin,\n"
			+ "       `Arrival Airport`.`Scheduled Arrival`,\n" + "       `Arrival Airport`.`Estimated Arrival`\n"
			+ "FROM `Arrival Airport`, Airports\n" + "WHERE `Arrival Airport`.Origin = Airports.`Airport Code`\n"
			+ "ORDER BY `Scheduled Arrival`;";
			ResultSet rs = stmt.executeQuery(sqlQuery);

			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getInt(2) + "</td>");
				out.println("<td>" + rs.getString(3) + "</td>");
				out.println("<td>" + rs.getTime(4) + "</td>");
				out.println("<td>" + rs.getTime(5) + "</td>");
				out.println("</tr>");
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException caught: " + e.getMessage());
			// out.println(Arrays.toString(e.getStackTrace()));
		}
		%>
	</table>




</body>
</html>

