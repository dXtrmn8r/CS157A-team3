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
				style="height: 100px" /> Lumipad</a>
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Cancellation.jsp">Cancel</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="TicketHistory">Ticket
							History</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="UpcomingFlights">Upcoming
							Tickets</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a>
					</li>
					<!-- This above line needs a servlet to allow logout -->

					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name")%></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<div class="main">
				<h1>Your Upcoming Flights</h1>
				<table>
					<tr>
						<th>PNR</th>
						<th>Airline</th>
						<th>No. of Seats</th>
						<th>Date</th>
						<th>Ticket Type</th>
						<th>Departure Time</th>
						<th>Gate</th>
					</tr>

					<%
					ResultSet rs = (ResultSet) request.getAttribute("upcoming_results");
					if (rs != null && rs.isBeforeFirst()) {
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<!-- PNR -->
						<td><%=rs.getString(3) + rs.getString(4)%></td>
						<!-- Airline Code -->
						<td><%=rs.getString(5)%></td>
						<!-- No_of_seats -->
						<td><%=rs.getString(6)%></td>
						<!-- Date -->
						<td><%=rs.getString(7)%></td>
						<!--Ticket Type-->
						<td><%=rs.getString(8) != null ? rs.getString(8) : "N/A"%></td>
						<td><%=rs.getString(9) != null ? rs.getString(9) : "N/A"%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="6"><h2>No upcoming flights found</h2></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
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

<%-- 
<!DOCTYPE html>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Upcoming Flights</title>
</head>
<body>
	<div class="main">
			 <h1>Your Upcoming Flights</h1>
	    <table>
	        <tr>
	            <th>PNR</th>
	            <th>Airline</th>
	            <th>No. of Seats</th>
	            <th>Date</th>
	            <th>Ticket Type</th>
	            <th>Departure Time</th>
	            <th>Gate</th>
	        </tr>
	    
	        <%
	        ResultSet rs = (ResultSet) request.getAttribute("upcoming_results");
	        if (rs != null) {
	            while (rs.next()) {
	        %>
	        <tr>
	            <td><%=rs.getString(1)%></td> <!-- PNR -->
	            <td><%=rs.getString(3)+rs.getString(4)%></td> <!-- Airline Code -->
	            <td><%=rs.getString(5)%></td> <!-- No_of_seats -->
	            <td><%=rs.getString(6)%></td> <!-- Date -->
	            <td><%=rs.getString(7)%></td> <!--Ticket Type-->
	            <td><%=rs.getString(8)!= null ? rs.getString(8) : "N/A"%></td>
	            <td><%=rs.getString(9)!= null ? rs.getString(8) : "N/A"%></td>
	        </tr>
	        <%
	            }
	        } else {
	        %>
	        <tr>
	            <td colspan="6">No upcoming flights found</td>
	        </tr>
	        <%
	        }
	        %>
	    </table>
	 </div>
</body>
</html>
 --%>