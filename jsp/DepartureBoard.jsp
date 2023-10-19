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


<!-- Filter -->
<h3>Sort</h3>
<form action="/DepartFormHandler">
  Field 1<br>
  <input type="radio" id="ArrivalCity" name="option1" value="ArrivalCity">
  <label for="ArrivalCity">Arrival City</label><br>
  <input type="radio" id="Airline" name="option1" value="Airline">
  <label for="Airline">Airline</label><br>
  <br>
  <!-- Field 2<br>
  <input type="radio" id="Time" name="option2" value="time">
  <label for="Time">Time</label><br>
  <input type="radio" id="AirportOrigin" name="option2" value="AirportOrigin">
  <label for="AirportOrigin">Airport Origin</label><br> 
  <br>-->
  Field 1
  <input type="text" id="Field1" name="Field1"><br>
  <!-- Field 2: Airport Origin
  <input type="text" id="Field2" name="Field2"><br> -->

  <input type="submit" value="Submit"><br>
</form>


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

      String sqlQuery = "SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n" +
              "\t   `Departure Airport`.`Flight Number`,\n" +
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
    }
  %>
</table>
</body>
</html>