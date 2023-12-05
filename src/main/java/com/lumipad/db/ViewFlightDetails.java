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

@WebServlet("/ViewFlightDetails")
public class ViewFlightDetails extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchQuery = request.getParameter("viewFlight");
		String flightNumber = request.getParameter("flightNumber");
		if(searchQuery == null && flightNumber !=null) {
			searchQuery = flightNumber;
		}
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
            	stmt = con.prepareStatement("SELECT CONCAT (`Airline Code`, `Flight Number`) AS fligth_id,\r\n"
            			+ "                               flights.`Date`,\r\n"
            			+ "                               `flights`.`Departure`,\r\n"
            			+ "                               `flights`.`Arrival`,\r\n"
            			+ "                               `flights`.`Depart_time`,\r\n"
            			+ "                               `flights`.`Arrival_time`,\r\n"
            			+ "                               `flights`.`first_class_seat_aval` AS `First Class Available`,\r\n"
            			+ "                               `flights`.`buss_class_seat_aval` AS `Bussiness Class Available`,\r\n"
            			+ "                               `flights`.`eco_class_seat_aval` AS `Economic Class Available`,\r\n"
            			+ "                               `flights`.`first_class_price` AS `First Class Price`,\r\n"
            			+ "                               `flights`.`buss_class_price` AS `Bussiness Class Price`,\r\n"
            			+ "                               `flights`.`eco_class_price` AS `Economic Class Price`                        \r\n"
            			+ "                        FROM flights\r\n"
            			+ "                        WHERE concat(`Airline Code`,`Flight Number`) LIKE ?;" );

                stmt.setString(1, "%" + searchQuery + "%");
                ResultSet rs = stmt.executeQuery();
                // Add the results to the request object
                request.setAttribute("flight_results", rs);
            }else {
            	stmt = con.prepareStatement("SELECT CONCAT (`Airline Code`, `Flight Number`) AS fligth_id,\n" +
                        "       flights.`Date`,\n" +
                        "       `flights`.`Destination`,\n" +
                        "       `flights`.`Arrival`,\n" +
                        "       `flights`.`Depart_time`,\n" +
                        "       `flights`.`Arrival_time`,\n" +
                        "       `flights`.`first_class_seat_avail` AS `First Class Available`,\n" +
                        "       `flights`.`buss_class_seat_avail` AS `Bussiness Class Available`,\n" +
                        "       `flights`.`eco_class_seat_avail` AS `Economic Class Available`,\n" +
                        "       `flights`.`first_class_price` AS `First Class Price`,\n" +
                        "       `flights`.`buss_class_price` AS `Bussiness Class Price`,\n" +
                        "       `flights`.`eco_class_price` AS `Economic Class Price`\n" +                        
                        "FROM flights;");
             ResultSet rs = stmt.executeQuery();
                // Add the results to the request object
                request.setAttribute("flight_results", rs);
            }
            // Forward the request back to the JSP page
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}


}
