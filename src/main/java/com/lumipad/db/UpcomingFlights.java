package com.lumipad.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpcomingFlights
 */
@WebServlet("/UpcomingFlights")
public class UpcomingFlights extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        
		String dbUser = "root";
        String dbPassword = "password";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false", dbUser, dbPassword);

            
         // Get user ID
            String sqlQuery = "SELECT userID FROM passengers WHERE email = ?";
            PreparedStatement stmt = con.prepareStatement(sqlQuery);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String userID = rs.getString("userID");

                // Get ticket history
                sqlQuery =  "SELECT tickets.*, `Departure airport`.`scheduled departure`, `Departure airport`.`Gate` \r\n"
                		+ "FROM `Departure airport`\r\n"
                		+ "RIGHT JOIN tickets ON tickets.`Airline Code` = `Departure airport`.`Airline Code` \r\n"
                		+ "AND tickets.`Flight Number` = `Departure airport`.`Flight Number` \r\n"
                		+ "AND tickets.`date_of_flight` = `Departure airport`.`Date` \r\n"
                		+ "WHERE tickets.`date_of_flight` >= CURDATE() AND tickets.userid = ?;";
                stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, userID);
                ResultSet ticketResults = stmt.executeQuery();

                // Add the results to the request object
                request.setAttribute("upcoming_results", ticketResults);
                
                sqlQuery =  "SELECT tickets.*, \r\n"
                		+ "       `Departure airport`.`scheduled departure`, \r\n"
                		+ "       `Departure airport`.`Gate`,\r\n"
                		+ "       `Arrival Airport`.`baggage claim`\r\n"
                		+ "FROM `Departure airport`\r\n"
                		+ "JOIN tickets ON tickets.`Airline Code` = `Departure airport`.`Airline Code` \r\n"
                		+ "AND tickets.`Flight Number` = `Departure airport`.`Flight Number` \r\n"
                		+ "AND tickets.`date_of_flight` = `Departure airport`.`Date` \r\n"
                		+ "JOIN `Arrival Airport` ON tickets.`Airline Code` = `Arrival Airport`.`Airline Code` \r\n"
                		+ "AND tickets.`Flight Number` = `Arrival Airport`.`Flight Number` \r\n"
                		+ "AND tickets.`date_of_flight` = `Arrival Airport`.`Date` \r\n"
                		+ "WHERE tickets.`date_of_flight` >= CURDATE() AND tickets.userid = ?;\r\n";
                stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, userID);
                ResultSet baggage = stmt.executeQuery();

                // Add the results to the request object
                request.setAttribute("baggage", baggage);
            }
            
            

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/UpcomingTickets.jsp");
            
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}


}
