<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"%>
<%@ page import="java.util.List"%>
<jsp:include page="Background.jsp" />

<!DOCTYPE html>
<html>
<head>
<title>Project Lumipad</title>
</head>
<body>
	
	<h1>Your Ticket History</h1>
    <table>
        <tr>
            <th>PNR</th>
            <th>Airline</th>
            <th>No. of Seats</th>
            <th>Date</th>
            <th>Ticket Type</th>
        </tr>
        <%
        ResultSet rs = (ResultSet) request.getAttribute("ticket_results");
        if (rs != null) {
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString(1)%></td> <!-- PNR -->
            <td><%=rs.getString(3)+rs.getString(4)%></td> <!-- Airline Code -->
            <td><%=rs.getString(5)%></td> <!-- No_of_seats -->
            <td><%=rs.getString(6)%></td> <!-- Date -->
            <td><%=rs.getString(7)%></td> <!--Ticket Type-->
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No ticket history found</td>
        </tr>
        <%
        }
        %>
    </table>

</body>
</html>