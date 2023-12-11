package com.lumipad.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/AddflightServlet")
public class AddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get data from jsp
		String airlineCode = request.getParameter("airlinecode");
		String flightno = request.getParameter("flightno");

		String origin = request.getParameter("origin");
		String deptime = request.getParameter("deptime");
		String depgate = request.getParameter("depgate");

		String destination = request.getParameter("destination");
		String arrtime = request.getParameter("arrtime");
		String arrgate = request.getParameter("arrgate");
		String baggage = request.getParameter("baggage");

		String date = request.getParameter("date");

		// Those extra flight details
		String status = request.getParameter("status");
		String duration = request.getParameter("duration");
		String firstclassbooked = request.getParameter("firstclassbooked");
		String bussclassbooked = request.getParameter("bussclassbooked");
		String ecoclassbooked = request.getParameter("ecoclassbooked");
		String firstclassaval = request.getParameter("firstclassaval");
		String bussclassaval = request.getParameter("bussclassaval");
		String ecoclassaval = request.getParameter("ecoclassaval");
		String firstclassprice = request.getParameter("firstclassprice");
		String bussclassprice = request.getParameter("bussclassprice");
		String ecoclassprice = request.getParameter("ecoclassprice");


		RequestDispatcher dispatcher = null;

		String dbUser = "root";
		String dbPassword = "password";
		Connection con = null;
		try {
			// Insert entry into db
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad", dbUser, dbPassword);
			/*
			 * PreparedStatement pstFlight = con.
			 * prepareStatement("INSERT INTO Flights(`Airline Code`, `Flight Number`, Date) Values(?,?,?)"
			 * ); pstFlight.setString(1, airlineCode); pstFlight.setString(2, flightno);
			 * pstFlight.setString(3, date);
			 */

			PreparedStatement pstDeparture = con.prepareStatement(
					"INSERT INTO `Departure Airport`(`Airport_code`,`Airline Code`, `Flight Number`, Destination, Date, `Scheduled Departure`, `Estimated Departure`, Gate) Values(?,?,?,?,?,?,?,?)");
			pstDeparture.setString(1, origin);
			pstDeparture.setString(2, airlineCode);
			pstDeparture.setString(3, flightno);
			pstDeparture.setString(4, destination);
			pstDeparture.setString(5, date);
			pstDeparture.setString(6, deptime);
			pstDeparture.setString(7, deptime);
			pstDeparture.setString(8, depgate);

			PreparedStatement pstArrival = con.prepareStatement(
					"INSERT INTO `Arrival Airport`(`Airport_code`,`Airline Code`, `Flight Number`, Origin, Date, `Scheduled Arrival`, `Estimated Arrival`, Gate, `Baggage Claim`) Values(?,?,?,?,?,?,?,?,?)");
			pstArrival.setString(1, destination);
			pstArrival.setString(2, airlineCode);
			pstArrival.setString(3, flightno);
			pstArrival.setString(4, origin);
			pstArrival.setString(5, date);
			pstArrival.setString(6, arrtime);
			pstArrival.setString(7, arrtime);
			pstArrival.setString(8, arrgate);
			pstArrival.setString(9, baggage);

			PreparedStatement pstFlight = con.prepareStatement(
					"INSERT INTO Flights(`Airline Code`, `Flight Number`, Date, Status, Departure, Arrival, Depart_time, Arrival_time, Duration, first_class_seat_booked, buss_class_seat_booked, eco_class_seat_booked, first_class_seat_aval, buss_class_seat_aval, eco_class_seat_aval, first_class_price, buss_class_price, eco_class_price) Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstFlight.setString(1, airlineCode);
			pstFlight.setString(2, flightno);
			pstFlight.setString(3, date);
			pstFlight.setString(4, status);
			pstFlight.setString(5, origin);
			pstFlight.setString(6, destination);
			pstFlight.setString(7, deptime);
			pstFlight.setString(8, arrtime);
			pstFlight.setString(9, duration);
			pstFlight.setString(10, firstclassbooked);
			pstFlight.setString(11, bussclassbooked);
			pstFlight.setString(12, ecoclassbooked);
			pstFlight.setString(13, firstclassaval);
			pstFlight.setString(14, bussclassaval);
			pstFlight.setString(15, ecoclassaval);
			pstFlight.setString(16, firstclassprice);
			pstFlight.setString(17, bussclassprice);
			pstFlight.setString(18, ecoclassprice);

			int rowCountFlight = pstFlight.executeUpdate();
			int rowCountDep = pstDeparture.executeUpdate();
			int rowCountArr = pstArrival.executeUpdate();
			dispatcher = request.getRequestDispatcher("add-flight.jsp");
			if (rowCountFlight > 0 && rowCountDep > 0 && rowCountArr > 0) {// should be 1, only 1 flight was inserted, 1
																			// successful
				// redirect to samepage but shows success
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}

			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
