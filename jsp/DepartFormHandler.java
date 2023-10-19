import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/DepartFormHandler")
public class DepartFormHandler extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form data
        String option1 = request.getParameter("option1");
        //String option2 = request.getParameter("option2");
        String field1 = request.getParameter("Field1");
       // String field2 = request.getParameter("Field2");

        // Process the form data
        String sqlQuery = "SELECT `Departure Airport`.`Airline Code` AS `Airline`,\r\n" + //
                "       `Departure Airport`.`Flight Number`,\r\n" + //
                "       Airports.`Display Name` AS `Destination`,\r\n" + //
                "       `Departure Airport`.`Scheduled Departure`,\r\n" + //
                "       `Departure Airport`.`Estimated Departure`,\r\n" + //
                "       `Departure Airport`.Gate\r\n" + //
                "FROM `Departure Airport`, Airports\r\n" + //
                "WHERE `Departure Airport`.Destination = Airports.`Airport Code` AND \r\n" + //
                ((option1.equals("ArrivalCity")) ? (field1 + "= `Departure Airport`"):(field1 + "=`Airline code`")) +
                // " AND " + 
                // (field2 + "=")

                "ORDER BY `Scheduled Departure`;";

        try {
            // Connect to your database
            String db = "lumipad";
            String user = "root";
            String password = "password";
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false",user, password);

            // Execute the updated query
            Statement stmt = con.createStatement();
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
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage());
        }


        // Send a response to the client
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Form Submitted Successfully</h1>");
        out.println("</body></html>");
    }
}