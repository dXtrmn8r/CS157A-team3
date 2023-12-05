package com.lumipad.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
@WebServlet("/SearchArrival")
public class SearchArrival extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sortOption = request.getParameter("sortOption");
		String searchQuery = request.getParameter("search");
		
		
		String airline = request.getParameter("airline");
		String arrivalAirport = request.getParameter("arrivalAirport");
		String departureAirport = request.getParameter("departureAirport");

		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String dbUser = "root";
		String dbPassword = "password";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false", dbUser, dbPassword);
			PreparedStatement stmt;
			if (searchQuery != null && !searchQuery.isEmpty()) {
			    stmt = con.prepareStatement("SELECT * FROM ("
			            + "SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n"
			            + "       `Departure Airport`.`Flight Number`,\n" 
			            + "       `Arrival Airport`.`Origin`,\n"
			            + "       Airports.`Display Name` AS `Destination`,\n"
			            + "       `Departure Airport`.`Scheduled Departure`,\n"
			            + "       `Arrival Airport`.`Scheduled Arrival`,\n" 
			            + "       `Flights`.`Status`\n" 
			            + "FROM `Departure Airport`"
			            + "JOIN Airports ON `Departure Airport`.Destination = Airports.`Airport Code`\n"
			            + "JOIN `Arrival Airport` ON `Departure Airport`.`Flight Number` = `Arrival Airport`.`Flight Number`\n"
			            + "JOIN `Flights` ON `Departure Airport`.`Flight Number` = `Flights`.`Flight Number`\n"
			            + "ORDER BY " + sortOption
			            + ") AS DefaultResults WHERE `Airline` LIKE ? OR `Flight Number` LIKE ?");
			    stmt.setString(1, "%" + searchQuery + "%");
			    stmt.setString(2, "%" + searchQuery + "%");
			} else if (airline != null && !airline.isEmpty() && arrivalAirport != null && !arrivalAirport.isEmpty()
			        && departureAirport != null && !departureAirport.isEmpty()) {
			    stmt = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n"
			            + "       `Departure Airport`.`Flight Number`,\n" 
			            + "       `Arrival Airport`.`Origin`,\n"
			            + "       Airports.`Display Name` AS `Destination`,\n"
			            + "       `Departure Airport`.`Scheduled Departure`,\n"
			            + "       `Arrival Airport`.`Scheduled Arrival`,\n" 
			            + "       `Flights`.`Status`\n" 
			            + "FROM `Departure Airport`"
			            + "JOIN Airports ON `Departure Airport`.Destination = Airports.`Airport Code`\n"
			            + "JOIN `Arrival Airport` ON `Departure Airport`.`Flight Number` = `Arrival Airport`.`Flight Number`\n"
			            + "JOIN `Flights` ON `Departure Airport`.`Flight Number` = `Flights`.`Flight Number`\n"
			            + "WHERE `Departure Airport`.`Airline Code` = ?\n" 
			            + "AND `Departure Airport`.Destination = ?\n"
			            + "AND `Arrival Airport`.`Origin` = ?\n" 
			            + "ORDER BY " + sortOption + ";");

			    stmt.setString(1, airline);
			    stmt.setString(2, arrivalAirport);
			    stmt.setString(3, departureAirport);
			} else {
			    // Default View
			    stmt = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n"
			            + "       `Departure Airport`.`Flight Number`,\n" 
			            + "       `Arrival Airport`.`Origin`,\n"
			            + "       Airports.`Display Name` AS `Destination`,\n"
			            + "       `Departure Airport`.`Scheduled Departure`,\n"
			            + "       `Arrival Airport`.`Scheduled Arrival`,\n" 
			            + "       `Flights`.`Status`\n" 
			            + "FROM `Departure Airport`"
			            + "JOIN Airports ON `Departure Airport`.Destination = Airports.`Airport Code`\n"
			            + "JOIN `Arrival Airport` ON `Departure Airport`.`Flight Number` = `Arrival Airport`.`Flight Number`\n"
			            + "JOIN `Flights` ON `Departure Airport`.`Flight Number` = `Flights`.`Flight Number`\n"
			            + "ORDER BY " + sortOption + ";");
			}


			ResultSet rs = stmt.executeQuery();
			// Add the results to the request object
			request.setAttribute("results", rs);
			// Forward the request back to the JSP page
			request.getRequestDispatcher("/ArrivalsBoard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
