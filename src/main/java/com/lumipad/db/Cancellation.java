package com.lumipad.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Cancellation")
public class Cancellation extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "lumipad";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "password";
        Statement st=null;
        System.out.println("-------------------------------INSIDE CANCELLATION ----------------------");
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");
            String PNR = request.getParameter("PNR");
            
            String vpnr = "";
            String pnrq = "SELECT PNR FROM tickets WHERE PNR LIKE ? ";
            PreparedStatement pq1=conn.prepareStatement(pnrq);
            pq1.setString(1,PNR);
            ResultSet rspnr = pq1.executeQuery();
            while(rspnr.next()){
                vpnr = rspnr.getString(1);
            }
            System.out.println("Valid PNR="+vpnr);
            System.out.println("PNR="+PNR);
            
            HttpSession session = request.getSession();
            session.setAttribute("PNR", PNR);
            
            
            if(PNR.equals(vpnr)){
                String Ticket_type = "";
                int no_of_seats = 0;
                String query = "SELECT Ticket_type, no_of_seats FROM tickets WHERE PNR LIKE ? ";
                PreparedStatement pq=conn.prepareStatement(query);
                pq.setString(1,PNR);
                ResultSet rq = pq.executeQuery();
                while(rq.next()){
                    Ticket_type = rq.getString(1);
                    no_of_seats = rq.getInt(2);
                }       
            
                System.out.println("Ticket_type= "+Ticket_type);
                System.out.println("no_of_seats= "+no_of_seats);
            
                String flight_num = "";
                String airline_code = "";
                String query1 = "SELECT `Flight Number`,`Airline Code` FROM tickets WHERE PNR LIKE ? ";
                PreparedStatement pq21=conn.prepareStatement(query1);
                pq21.setString(1,PNR);
                ResultSet rq1 = pq21.executeQuery();
                while(rq1.next()){
                    flight_num = rq1.getString(1);
                    airline_code = rq1.getString(2);
                }
                System.out.println("flight_num= "+flight_num);
                System.out.println("airline_code= "+airline_code);
            
                if( null != Ticket_type)
                   switch (Ticket_type) {
                        case "Business Class":
                           System.out.println("Executing Cancellation operations for Business Class in flights");
                           int buss_class_seat_booked=0, buss_class_seat_aval=0;
                           String bs = "SELECT buss_class_seat_booked, buss_class_seat_aval FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?; ";
                           PreparedStatement pbs=conn.prepareStatement(bs);
                           pbs.setString(1,flight_num);
                           pbs.setString(2,airline_code);
                           ResultSet rbs = pbs.executeQuery();
                           while(rbs.next()){
                                buss_class_seat_booked = rbs.getInt(1);
                                buss_class_seat_aval = rbs.getInt(2);
                            }
                            System.out.println("buss_class_seat_booked= "+buss_class_seat_booked);
                            System.out.println("buss_class_seat_aval= "+buss_class_seat_aval);
                        
                            buss_class_seat_booked = buss_class_seat_booked - no_of_seats;
                            buss_class_seat_aval = buss_class_seat_aval + no_of_seats;
                        
                            System.out.println("After Correction");
                            System.out.println("buss_class_seat_booked= "+buss_class_seat_booked);
                            System.out.println("buss_class_seat_aval= "+buss_class_seat_aval);
                        
                            String bsup = "UPDATE flights SET buss_class_seat_booked = ?, buss_class_seat_aval = ? WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?;";
                            PreparedStatement pbsup=conn.prepareStatement(bsup);
                            pbsup.setInt(1, buss_class_seat_booked);
                            pbsup.setInt(2, buss_class_seat_aval);
                            pbsup.setString(3,flight_num);
                            pbsup.setString(4,airline_code); 
                            int i1=pbsup.executeUpdate();
                            if(i1==1)
                            {
                                 System.out.print("Update Seats Allingment Sucessfully For Business Class");
                            }
                       
                            break;
                        case "Economic Class":
                            System.out.print("Executing Cancellation operations for Economic Class in flights");
                            int eco_class_seat_booked=0, eco_class_seat_aval=0;
                            String cs = "SELECT eco_class_seat_booked, eco_class_seat_aval FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?; ";
                            PreparedStatement pcs=conn.prepareStatement(cs);
                            pcs.setString(1,flight_num);
                            pcs.setString(2,airline_code);
                            ResultSet rcs = pcs.executeQuery();
                            while(rcs.next()){
                                eco_class_seat_booked = rcs.getInt(1);
                                eco_class_seat_aval = rcs.getInt(2);
                            }
                            System.out.println("eco_class_seat_booked= "+eco_class_seat_booked);
                            System.out.println("eco_class_seat_aval= "+eco_class_seat_aval);
                        
                            eco_class_seat_booked = eco_class_seat_booked - no_of_seats;
                            eco_class_seat_aval = eco_class_seat_aval + no_of_seats;
                        
                            System.out.println("After Correction");
                            System.out.println("eco_class_seat_booked= "+eco_class_seat_booked);
                            System.out.println("eco_class_seat_aval= "+eco_class_seat_aval);
                        
                            String csup = "UPDATE flights SET eco_class_seat_booked = ?, eco_class_seat_aval = ? WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?;";
                            PreparedStatement pcsup=conn.prepareStatement(csup);
                            pcsup.setInt(1, eco_class_seat_booked);
                            pcsup.setInt(2, eco_class_seat_aval);
                            pcsup.setString(3,flight_num);
                            pcsup.setString(4,airline_code);    
                            int i2=pcsup.executeUpdate();
                            if(i2==1)
                            {
                                 System.out.print("Update Seats Allingment Sucessfully For Economic Class");
                            }
                            break;
                        case "First Class":
                            System.out.println("Executing Cancellation operations for First Class in flights");
                            int first_class_seat_booked=0, first_class_seat_aval=0;
                            String fs = "SELECT first_class_seat_booked, first_class_seat_aval FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?; ";
                            PreparedStatement pfs=conn.prepareStatement(fs);
                            pfs.setString(1,flight_num);
                            pfs.setString(2,airline_code);
                            ResultSet rfs = pfs.executeQuery();
                            while(rfs.next()){
                                first_class_seat_booked = rfs.getInt(1);
                                first_class_seat_aval = rfs.getInt(2);
                            }
                            System.out.println("first_class_seat_booked= "+first_class_seat_booked);
                            System.out.println("first_class_seat_aval= "+first_class_seat_aval);
                        
                            first_class_seat_booked = first_class_seat_booked - no_of_seats;
                            first_class_seat_aval = first_class_seat_aval + no_of_seats;
                        
                            System.out.println("After Correction");
                            System.out.println("first_class_seat_booked= "+first_class_seat_booked);
                            System.out.println("first_class_seat_aval= "+first_class_seat_aval);
                        
                            String fsup = "UPDATE flights SET first_class_seat_booked = ?, first_class_seat_aval = ? WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?;";
                            PreparedStatement pfsup=conn.prepareStatement(fsup);
                            pfsup.setInt(1, first_class_seat_booked);
                            pfsup.setInt(2, first_class_seat_aval);
                            pfsup.setString(3,flight_num);
                            pfsup.setString(4,airline_code);    
                            int i3=pfsup.executeUpdate();
                            if(i3==1)
                            {
                                System.out.print("Update Seats Allingment Sucessfully For First Class");
                            }
                            break;
                        default:
                            break;
                    }
            
                    PreparedStatement ps1 = conn.prepareStatement("delete from payment_details where PNR LIKE ?");
                    ps1.setString(1, PNR);
                    int i1 = ps1.executeUpdate();
                    if(i1 > 0) {
                        System.out.println("User successfully removed payment_details table...");
                    }
                    PreparedStatement ps2 = conn.prepareStatement("delete from tickets where PNR LIKE ?");
                    ps2.setString(1, PNR);
                    int i2 = ps2.executeUpdate();
                    if(i2 > 0) {
                         System.out.println("User successfully removed tickets table...");
                    }
            
                    RequestDispatcher view = request.getRequestDispatcher("Cancellation_confirmed.jsp");
                    view.forward(request, response);
                    conn.close();
                    System.out.println("Disconnected!");
                }
            else {
                RequestDispatcher error = request.getRequestDispatcher("Cancellation_failed.jsp");
                error.forward(request, response);
                conn.close();
                System.out.println("Disconnected!");
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("-------------------------------INSIDE CANCELLATION ----------------------");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
