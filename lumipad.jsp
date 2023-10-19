<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style>
    table, th, td {
      border: 1px solid;
    }
  </style>
</head>
<body>
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
    String db = "Lumipad";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "password";
    try {
      Connection con;
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db),user, password);

      Statement stmt = con.createStatement();

      String sqlQuery =
              """
                      SELECT `Departure Airport`.`Airline Code` AS `Airline`,
                             `Departure Airport`.`Flight Number`,
                             Airports.`Display Name` AS `Destination`,
                             `Departure Airport`.`Scheduled Departure`,
                             `Departure Airport`.`Estimated Departure`,
                             `Departure Airport`.Gate
                      FROM `Departure Airport`, Airports
                      WHERE `Departure Airport`.Destination = Airports.`Airport Code`
                      ORDER BY `Scheduled Departure`;""";
      ResultSet rs = stmt.executeQuery(sqlQuery);

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
      rs.close();
      stmt.close();
      con.close();
    } catch(SQLException | ClassNotFoundException e) {
      out.println("SQLException caught: " + e.getMessage());
    }
  %>
</table>
</body>
</html>