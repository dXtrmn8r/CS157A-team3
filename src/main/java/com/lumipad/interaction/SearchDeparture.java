package com.lumipad.interaction;

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
			Class.forName("com.mysql.jdbc.Driver");//optional in new java version
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad",dbUser, dbPassword);
			PreparedStatement pst = con.prepareStatement("SELECT `Departure Airport`.`Airline Code` AS `Airline`, `Departure Airport`.`Flight Number`, Airports.`Display Name` AS `Destination`, `Departure Airport`.`Scheduled Departure`, `Departure Airport`.`Estimated Departure`, `Departure Airport`.Gate" +
					"FROM `Departure Airport`, Airports"+
					"WHERE `Departure Airport`.Destination = Airports.`Airport Code` AND `Departure Airport`.`Flight Number`"+
					"LIKE ?"+
					"ORDER BY `Scheduled Departure`;");
            
			pst.setString(1, "%" + searchQuery + "%");
			
			
			ResultSet rs = pst.executeQuery();
			request.setAttribute("results", rs);
			request.getRequestDispatcher("/your-jsp-page.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


}
