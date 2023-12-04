<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
<jsp:include page="Background.jsp" />
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
	<div class="row">
  		<div class="main">	
			<h2>Search</h2>
			Search by Flight number or by both airline and the arrival and
			departure airports
			<form action="SearchDeparture" method="get">
				<input type="text" name="search" onkeyup='SearchDeparture'
					placeholder="Search for departures..."> <input type="submit"
					value="Search">
			</form>
			<h1>Departures</h1>
			<center>    
			
			<table>
				<tr>
					<th colspan="2">Flight Number</th>
					<th>Destination</th>
					<th>Scheduled Time</th>
					<th>Estimated Time</th>
					<th>Gate</th>
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
					<td><%=rs.getTime(4)%></td>
					<td><%=rs.getTime(5)%></td>
					<td><%=rs.getString(6)%></td>
				</tr>
				<%
				}
				} else {
					%>
				<tr><td colspan='6'>No results found</td></tr>
				<%} %>
		
			</table>
			</center>    
			
			<h2>Booking</h2>
			Book by Flight Number
			<form action="ViewFlightDetails" method="get">
				<input type="text" name="viewFlight" onkeyup='"ViewFlightDetails"'
					placeholder="Book a flight..."> <input type="submit"
					value="Book">
			</form>

	<%-- <h1>Arrivals</h1>
<table>
  <tr>
    <th colspan="2">Flight Number</th>
    <th>Origin</th>
    <th>Scheduled Time</th>
    <th>Estimated Time</th>
  </tr>
  <%
    try {
      Connection con;
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db),user, password);

      Statement stmt = con.createStatement();

      String sqlQuery = "SELECT `Arrival Airport`.`Airline Code` AS `Airline`,\n" +
              "       `Arrival Airport`.`Flight Number`,\n" +
              "       Airports.`Display Name` AS Origin,\n" +
              "       `Arrival Airport`.`Scheduled Arrival`,\n" +
              "       `Arrival Airport`.`Estimated Arrival`\n" +
              "FROM `Arrival Airport`, Airports\n" +
              "WHERE `Arrival Airport`.Origin = Airports.`Airport Code`\n" +
              "ORDER BY `Scheduled Arrival`;";
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
    } catch(SQLException | ClassNotFoundException e) {
      out.println("SQLException caught: " + e.getMessage());
      // out.println(Arrays.toString(e.getStackTrace()));
    }
  %>
</table> --%>
		 </div>
	</div>

        <!-- Booking End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	</div>
	
</body>
</html>