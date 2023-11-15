<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Project Lumipad</title>
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
    String db = "lumipad";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "password";
    try {
      Connection con;
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(String.format("jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false", db),user, password);

      Statement stmt = con.createStatement();

      String sqlQuery = "SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n" +
              "       `Departure Airport`.`Flight Number`,\n" +
              "       Airports.`Display Name` AS `Destination`,\n" +
              "       `Departure Airport`.`Scheduled Departure`,\n" +
              "       `Departure Airport`.`Estimated Departure`,\n" +
              "       `Departure Airport`.Gate\n" +
              "FROM `Departure Airport`, Airports\n" +
              "WHERE `Departure Airport`.Destination = Airports.`Airport Code`\n" +
              "ORDER BY `Scheduled Departure`;";
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
      // out.println(Arrays.toString(e.getStackTrace()));
    }
  %>
</table>


<h1>Arrivals</h1>
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
</table>

</body>
</html>