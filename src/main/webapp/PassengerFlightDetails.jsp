<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<title>Arrival Passenger</title>
<style>
.logout {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	background-color: #f8f9fa;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<h2>Your Flight Details</h2>
	<%
	ResultSet rs = (ResultSet) request.getAttribute("flightDetails");
	if (rs != null && rs.next()) {
	%>
	<h3>
		Airline:
		<%=rs.getString(1)%></h3>
	<h3>
		Flight Number:
		<%=rs.getInt(2)%></h3>
	<h3>
		Origin:
		<%=rs.getString(3)%></h3>
	<h3>
		Destination:
		<%=rs.getString(4)%></h3>
	<h3>
		Scheduled Time:
		<%=rs.getTime(5)%></h3>
	<h3>
		Estimated Time:
		<%=rs.getTime(6)%></h3>
	<h3>
		Gate:
		<%=rs.getString(7)%></h3>
	<h3>
		Status:
		<%=rs.getString(8)%></h3>
	<h3>
		Baggage Claim:
		<%=rs.getString(9)%></h3>
	<%
	} else {
	%>
	<p>Sorry, we couldn't find any flight details for you.</p>
	<%
	}
	%>
</body>
</html>
