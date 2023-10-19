<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Arrival Board</title>
  </head>
  <body>
    <h1>Arrivals</h1>
    
    <table border="1">
      <tr>
        <td colspan="2">Flight Number</td>
        <td>Origin</td>
        <td>Scheduled Arrival</td>
        <td>Estimated Arrival</td>
        <td>Gate</td>
   </tr>
   <% 
   String db = "lumipad";
   String user = "root";
   String password = "password";
   try {
      java.sql.Connection con; 
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false",user, password);
      
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT `Arrival Airport`.`Airline Code` AS `Airline`, " +
      "`Arrival Airport`.`Flight Number`, " +
      "`Airports`.`Display Name` AS `Origin`, " +
      "`Arrival Airport`.`Scheduled Arrival`, " +
      "`Arrival Airport`.`Estimated Arrival`, " +
      "`Arrival Airport`.Gate " +
      "FROM Lumipad.`Arrival Airport`, Lumipad.Airports " +
      "WHERE `Arrival Airport`.Origin = Airports.`Airport Code` " +
      "ORDER BY `Scheduled Arrival`");
      while (rs.next()) {
          %>
          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getInt(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
          </tr>
          <% 
      }
      rs.close();
      stmt.close();
      con.close();
   } catch(SQLException e) { 
       out.println("SQLException caught: " + e.getMessage()); 
   }
  %>
    </table>
  </body>
</html>