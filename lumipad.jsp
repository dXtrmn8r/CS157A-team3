<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Three Tier Architecture - Lumipsd</title>
  </head>
  <body>
    <h1>JSP test for 3 tables</h1>
    <h2>Users Table</h2>
    <table border="1">
      <tr>
        <td>email</td>
        <td>first</td>
        <td>last</td>
        <td>pasword</td>
        <td>type</td>
   </tr>
    <% 
     String db = "lumipad";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "password";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"Users\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            while (rs.next()) {
                out.println("Users table: " + rs.getString(1) + "    " + rs.getString(2) + "    " + rs.getString(3) + "    " + rs.getString(4)+ "    " + rs.getString(5) + "<br/><br/>");
            }

            rs = stmt.executeQuery("SELECT * FROM departure");
            while (rs.next()) {
                out.println("Departure table: " + rs.getString(1) + "    " + rs.getString(2) + "    " + rs.getString(3) + "    " + rs.getString(4)+
                 "    " + rs.getInt(5) +  "    " + rs.getInt(6) +"<br/><br/>");
            }

            rs = stmt.executeQuery("SELECT * FROM arrival");
            while (rs.next()) {
              out.println("Arrival table: " + rs.getString(1) + "    " + rs.getString(2) + "    " + rs.getString(3) + "    " + rs.getString(4)+
                 "    " + rs.getInt(5) +  "    " + rs.getInt(6) +"<br/><br/>");
            }


            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
