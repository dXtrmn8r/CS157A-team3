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
                sqlQuery =  "SELECT * FROM lumipad.tickets WHERE date_of_flight >= CURDATE() AND userid = ?;";
                stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, userID);
                ResultSet ticketResults = stmt.executeQuery();

                // Add the results to the request object
                request.setAttribute("upcoming_results", ticketResults);
            }

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/UpcomingTickets.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
