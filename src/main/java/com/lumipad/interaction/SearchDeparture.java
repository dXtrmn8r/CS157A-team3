package com.lumipad.interaction;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchDeparture
 */
@WebServlet("/searchdeparture")
public class SearchDeparture extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchQuery = request.getParameter("search");
        // Your database connection and query logic here
        // For example:
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false", "root", "password");
            PreparedStatement stmt;
            if (searchQuery == null || searchQuery.isEmpty()) {
                // Default query that selects all records
                stmt = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`, `Departure Airport`.`Flight Number`, Airports.`Display Name` AS `Destination`, `Departure Airport`.`Scheduled Departure`, `Departure Airport`.`Estimated Departure`, `Departure Airport`.Gate FROM `Departure Airport`, Airports WHERE `Departure Airport`.Destination = Airports.`Airport Code` ORDER BY `Scheduled Departure`;");
            } else {
                // Search query
                stmt = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`, `Departure Airport`.`Flight Number`, Airports.`Display Name` AS `Destination`, `Departure Airport`.`Scheduled Departure`, `Departure Airport`.`Estimated Departure`, `Departure Airport`.Gate FROM `Departure Airport`, Airports WHERE `Departure Airport`.Destination = Airports.`Airport Code` AND `Departure Airport`.`Flight Number` LIKE ? ORDER BY `Scheduled Departure`;");
                stmt.setString(1, "%" + searchQuery + "%");
            }
            ResultSet rs = stmt.executeQuery();
            // Add the results to the request object
            request.setAttribute("results", rs);
            // Forward the request back to the JSP page
            request.getRequestDispatcher("/lumipad.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
	}


}
