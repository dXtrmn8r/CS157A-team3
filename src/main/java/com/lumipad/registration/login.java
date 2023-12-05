package com.lumipad.registration;

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
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("username");
		String upassword = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String dbUser = "root";
		String dbPassword = "password";
		try {
			Class.forName("com.mysql.jdbc.Driver");//optional in new java version
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad",dbUser, dbPassword);
			PreparedStatement pst = con.prepareStatement("select * from passengers where Email = ? and Password = ?");
			
			pst.setString(1, uemail);
			pst.setString(2, upassword);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {//check if the query has a result, if there is
				session.setAttribute("name", rs.getString("name"));//updates status at top of index.jsp with passenger name
				session.setAttribute("email", uemail);
				dispatcher = request.getRequestDispatcher("ArrivalsBoard.jsp"); //page redirect
			}else {//user isn't in db, or wrong password, etc.
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");//Take them back to the same page
			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
