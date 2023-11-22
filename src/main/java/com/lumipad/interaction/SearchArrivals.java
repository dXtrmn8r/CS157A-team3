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
public class SearchArrivals extends HttpServlet {

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
                stmt = con.prepareStatement("SELECT `Arrival Airport`.`Airline Code` AS `Airline`, `Arrival Airport`.`Flight Number`, Airports.`Display Name` AS Origin, `Arrival Airport`.`Scheduled Arrival`, `Arrival Airport`.`Estimated Arrival` FROM `Arrival Airport`, Airports WHERE `Arrival Airport`.Origin = Airports.`Airport Code` ORDER BY `Scheduled Arrival`;\r\n");
            } else {
                // Search query
                stmt = con.prepareStatement("SELECT `Arrival Airport`.`Airline Code` AS `Airline`, `Arrival Airport`.`Flight Number`, Airports.`Display Name` AS Origin, `Arrival Airport`.`Scheduled Arrival`, `Arrival Airport`.`Estimated Arrival` FROM `Arrival Airport`, Airports WHERE `Arrival Airport`.Origin = Airports.`Airport Code`  LIKE ? ORDER BY `Scheduled Arrival`;");
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
