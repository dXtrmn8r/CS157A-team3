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
    <div class="container-xxl bg-white p-0">
        <div class="container-xxl bg-white p-0">

        <!-- Header Start -->
        <div class="container-fluid bg-dark px-0">
            <div class="row gx-0">
                <div class="col-lg-3 bg-dark d-none d-lg-block">
                    <a href="index.jsp" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                        <h1 class="m-0 text-primary text-uppercase">Lumipad</h1>
                    </a>
                </div>
                <div class="col-lg-9">
                    
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">                        
                        
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="user_login_pass.jsp" class="nav-item nav-link">Home</a>
                                <a href="lumipad.jsp" class="nav-item nav-link">Check Availability</a>
                                <a href="booking.jsp" class="nav-item nav-link active">Booking</a>
                                <a href="Cancellation.jsp" class="nav-item nav-link">Cancellation</a>
                            </div>
                            
                        </div>

                    </nav>
                </div>
            </div>
        </div>
        <!-- Header End -->

	<a class="logout" href='logout'>Logout</a>
	<h2>Search</h2>
	Search by Flight number or by both airline and the arrival and
	departure airports
	<form action="SearchDeparture" method="get">
		<input type="text" name="search" onkeyup='SearchDeparture'
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
        <!-- Booking End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	</div>
	
</body>
</html>