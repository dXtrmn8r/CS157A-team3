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
 * Servlet implementation class SearchDeparture
 */
@WebServlet("/SearchDeparture")
public class SearchDeparture extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchQuery = request.getParameter("search");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String dbUser = "root";
		String dbPassword = "password";
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad?autoReconnect=true&useSSL=false", dbUser, dbPassword);
            PreparedStatement stmt;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                // Search query
                stmt = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n" +
                        "       `Departure Airport`.`Flight Number`,\n" +
                        "       Airports.`Display Name` AS `Destination`,\n" +
                        "       `Departure Airport`.`Scheduled Departure`,\n" +
                        "       `Departure Airport`.`Estimated Departure`,\n" +
                        "       `Departure Airport`.Gate\n" +
                        "FROM `Departure Airport`, Airports\n" +
                        "WHERE `Departure Airport`.Destination = Airports.`Airport Code`\n" + 
                        "LIKE ? ORDER BY `Scheduled Departure`;");
                stmt.setString(1, "%" + searchQuery + "%");
                ResultSet rs = stmt.executeQuery();
                // Add the results to the request object
                request.setAttribute("results", rs);
            }else {
            	stmt = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`,\n" +
                        "       `Departure Airport`.`Flight Number`,\n" +
                        "       Airports.`Display Name` AS `Destination`,\n" +
                        "       `Departure Airport`.`Scheduled Departure`,\n" +
                        "       `Departure Airport`.`Estimated Departure`,\n" +
                        "       `Departure Airport`.Gate\n" +
                        "FROM `Departure Airport`, Airports\n" +
                        "WHERE `Departure Airport`.Destination = Airports.`Airport Code`\n" + 
                        "ORDER BY `Scheduled Departure`;");
                ResultSet rs = stmt.executeQuery();
                // Add the results to the request object
                request.setAttribute("results", rs);
            }
            // Forward the request back to the JSP page
            request.getRequestDispatcher("/lumipad.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}


}
