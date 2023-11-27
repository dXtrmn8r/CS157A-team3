<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
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
	<h2>Search</h2>
	Search by Flight number or by both airline and the arrival and
	departure airports
	<form action="searchdeparture" method="get">
		<input type="text" name="search" onkeyup='searchdeparture'
			placeholder="Search for departures.."> <input type="submit"
			value="Search">
	</form>
	<h1>Departures</h1>
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
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getInt(2) + "</td>");
				out.println("<td>" + rs.getString(3) + "</td>");
				out.println("<td>" + rs.getTime(4) + "</td>");
				out.println("<td>" + rs.getTime(5) + "</td>");
				out.println("<td>" + rs.getString(6) + "</td>");
				out.println("</tr>");
			}
		} else {
			out.println("<tr><td colspan='6'>No results found</td></tr>");
		}
		%>

	</table>


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

</body>
</html>