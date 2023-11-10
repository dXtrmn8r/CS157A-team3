package com.lumipad.registration;

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
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upass = request.getParameter("pass");
		String ure_pass = request.getParameter("re_pass");
		String umobile = request.getParameter("contact");
		
		String ubirth = request.getParameter("birthday");
		String uaddress = request.getParameter("address");
		String ubillinginfo = request.getParameter("billing_info");
		
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
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lumipad",dbUser, dbPassword);
			PreparedStatement pst = con.prepareStatement("insert into passengers(Name, `Date of Birth`, Address, Phone, Billing_Info, Email, Password) values(?,?,?,?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, ubirth);
			pst.setString(3, uaddress);
			pst.setString(4, umobile);
			pst.setString(5, ubillinginfo);
			pst.setString(6, uemail);
			
			//Still need to test password for the same 
			//for simplicity, no need to encrypt
			pst.setString(7, upass);
			
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowCount > 0) {//should be 1, only 1 user was inserted, 1 successful
				//redirect to samepage but shows success
				request.setAttribute("status", "success");
			}else {
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
