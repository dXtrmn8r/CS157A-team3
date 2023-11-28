package com.lumipad.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/addflight")
public class AddFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Get data from jsp
        String airlineCode = request.getParameter("airlinecode");
        String flightno = request.getParameter("flightno");

        String origin = request.getParameter("origin");
        String deptime = request.getParameter("deptime");
        String depgate = request.getParameter("depgate");

        String destination = request.getParameter("destination");
        String arrtime = request.getParameter("arrtime");
        String arrgate = request.getParameter("arrgate");
        String baggage = request.getParameter("baggage");

        String aircraftcode = request.getParameter("aircraftcode");
        String date = request.getParameter("date");

//		PrintWriter out = response.getWriter();
//		out.print(uname);
//		out.print(uemail);
//		out.print(upass);
//		out.print(umobile);
//
//		out.print(ubirth);
//		out.print(uaddress);
//		out.print(ubillinginfo);

        RequestDispatcher dispatcher = null;

        String dbUser = "root";
        String dbPassword = "password";
        Connection con = null;
        try {
            //Insert entry into db
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad",dbUser, dbPassword);
            PreparedStatement pstFlight = con.prepareStatement("INSERT INTO Flights(`Airline Code`, `Flight Number`, `Aircraft Code`, Date) Values(?,?,?,?)");
            pstFlight.setString(1, airlineCode);
            pstFlight.setString(2, flightno);
            pstFlight.setString(3, aircraftcode);
            pstFlight.setString(4, date);

            PreparedStatement pstDeparture = con.prepareStatement("INSERT INTO `Departure Airport`(`Airline Code`, `Flight Number`, Destination, Date, `Scheduled Departure`, `Estimated Departure`, Gate) Values(?,?,?,?,?,?,?)");
            pstDeparture.setString(1, airlineCode);
            pstDeparture.setString(2, flightno);
            pstDeparture.setString(3, origin);
            pstDeparture.setString(4, date);
            pstDeparture.setString(5, deptime);
            pstDeparture.setString(6, deptime);
            pstDeparture.setString(7, depgate);

            PreparedStatement pstArrival = con.prepareStatement("INSERT INTO `Departure Airport`(`Airline Code`, `Flight Number`, Destination, Date, `Scheduled Departure`, `Estimated Departure`, Gate, `Baggage Claim`) Values(?,?,?,?,?,?,?,?)");
            pstArrival.setString(1, airlineCode);
            pstArrival.setString(2, flightno);
            pstArrival.setString(3, destination);
            pstArrival.setString(4, date);
            pstArrival.setString(5, arrtime);
            pstArrival.setString(6, arrtime);
            pstArrival.setString(7, arrgate);
            pstArrival.setString(8, baggage);

            int rowCountFlight = pstFlight.executeUpdate();
            int rowCountDep = pstDeparture.executeUpdate();
            int rowCountArr = pstArrival.executeUpdate();
            dispatcher = request.getRequestDispatcher("add-flight.jsp");
            if(rowCountFlight > 0 && rowCountDep > 0 && rowCountArr > 0) {//should be 1, only 1 flight was inserted, 1 successful
                //redirect to samepage but shows success
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);
        } catch(Exception e) {
            e.printStackTrace();
        }finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }

}
