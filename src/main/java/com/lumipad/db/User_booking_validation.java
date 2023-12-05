package com.lumipad.db;
import java.lang.Math;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/User_booking_validation")
public class User_booking_validation extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
        System.out.println("-------------------------------INSIDE USER_BOOKING_VALIDATION_CHECK ----------------------");
        PrintWriter out = response.getWriter();
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "lumipad";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "password";
        Statement st=null;    
        
        int min = 00000;      
        int max = 99999;
        String PNR = "0"+(int)(Math.random()*(max-min+1)+min);
        
        Random rnd = new Random();
        char a = (char) ('a' + rnd.nextInt(26));
        char b = (char) ('a' + rnd.nextInt(26));
        char c = (char) ('a' + rnd.nextInt(26));
        char A = Character.toUpperCase(a);
        char B = Character.toUpperCase(b);
        char C = Character.toUpperCase(c);
        String transaction_id = "XX"+a+B+c+"YY"+(int)(Math.random()*(max-min+1)+min)+C+b+A;    
        
        String userid=request.getParameter("userid");    
        String flight_id=request.getParameter("flight_id");
        String airline_code= flight_id.substring(0,2);    
        String flight_num = flight_id.substring(2);
        String Ticket_type=request.getParameter("Ticket_type");    
        String date_of_flight=request.getParameter("date_of_flight");  
        String no_of_seats1=request.getParameter("no_of_seats");    
        int no_of_seats=Integer.parseInt(no_of_seats1);
        
        System.out.println("no_of_seats: "+ no_of_seats);
            
        HttpSession session = request.getSession();
        session.setAttribute("pnrno", PNR);
        session.setAttribute("Ticket_type", Ticket_type);
        
        System.out.println(Ticket_type);
        System.out.println(airline_code);
        System.out.println(flight_num);
        System.out.println(transaction_id);
        System.out.println(date_of_flight);
        System.out.println(PNR);
        System.out.println(no_of_seats);
        
        try    
        {    
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");   
               
            if(null != Ticket_type)switch (Ticket_type) {
                case "Business Class":
                    int bs_valid=0;
                    String query_for_bs = "SELECT buss_class_seat_aval FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?;";
                    PreparedStatement pstmt_bs=con.prepareStatement(query_for_bs);
                    pstmt_bs.setString(1,flight_num);
                    pstmt_bs.setString(2,airline_code);
                    ResultSet rst = pstmt_bs.executeQuery();
                    
                    while(rst.next()){
                        bs_valid = rst.getInt(1);
                        }
                    
                    System.out.println("aval seats" + bs_valid);

                    
                    if(no_of_seats > bs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                        
                    }
                    else{
                    
                        int fair_1=1;
                        String cost_1 = "SELECT buss_class_price FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?";
                        PreparedStatement cst1_ps=con.prepareStatement(cost_1);
                        cst1_ps.setString(1, flight_num);
                        cst1_ps.setString(2, airline_code);
                        ResultSet rst_cst1 = cst1_ps.executeQuery();
                        System.out.println("Selected Successfully");
                        
                        while(rst_cst1.next()){
                            fair_1 = rst_cst1.getInt(1);
                        }
                        System.out.println("fair1 Inserted Successfully");
                        
                        int ff_1 = fair_1 * no_of_seats;
                        String bff =String.valueOf(ff_1);
                        String ff= "RS: " + bff + "/-";
                        
                        HttpSession ses=request.getSession();
                        ses.setAttribute("ff",ff);
                        
                        System.out.println("Begin insert");
                        String query="Insert into tickets (userid, `Airline Code`, `Flight Number`, date_of_flight, no_of_seats, Ticket_type, PNR) values (?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, userid);
                        pstmt.setString(2, airline_code);
                        pstmt.setString(3, flight_num);
                        pstmt.setString(4, date_of_flight);
                        pstmt.setInt(5, no_of_seats);
                        pstmt.setString(6, Ticket_type);                      
                        pstmt.setString(7, PNR);
                        
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            System.out.println("Values Inserted Successfully");
                        }
                        
                        
                        String update_bs = "UPDATE flights SET buss_class_seat_booked = buss_class_seat_booked + ?, buss_class_seat_aval = buss_class_seat_aval - ? WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ? ;";
                        PreparedStatement pst_up_bs=con.prepareStatement(update_bs);
                        pst_up_bs.setInt(1,no_of_seats);
                        pst_up_bs.setInt(2,no_of_seats);
                        pst_up_bs.setString(3,flight_num);
                        pst_up_bs.setString(4,airline_code);
                        
                        
                        int y=pst_up_bs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully To Flight Details");
                        }
                        
                        String pay_q_bs="Insert into payment_details (PNR, transaction_id, address, fair) values (?, ?, ?, ?)";
                        PreparedStatement pay_ps_bs =con.prepareStatement(pay_q_bs);
                        pay_ps_bs.setString(1, PNR);
                        pay_ps_bs.setString(2, transaction_id);
                        pay_ps_bs.setString(3, "NULL");
                        pay_ps_bs.setInt(4, ff_1);
                        
                        
                        int pay_bs=pay_ps_bs.executeUpdate();
                        if(pay_bs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }   break;
                case "First Class":
                    
                    int fair_2=1;
                        String cost_2 = "SELECT first_class_price FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?";
                        PreparedStatement cst2_ps=con.prepareStatement(cost_2);
                        cst2_ps.setString(1, flight_num);
                        cst2_ps.setString(2, airline_code);
                        
                        ResultSet rst_cst2 = cst2_ps.executeQuery();
                    
                        while(rst_cst2.next()){
                            fair_2 = rst_cst2.getInt(1);
                        }
                        
                        int ff_2 = fair_2 * no_of_seats;
                        String fff =String.valueOf(ff_2);
                        String ff= "RS: " + fff + "/-";
                        
                        HttpSession ses=request.getSession();
                        ses.setAttribute("ff",ff);
                    
                    int fs_valid=0;
                    String query_for_fs = "SELECT first_class_seat_aval FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ? ";
                    PreparedStatement pstmt_fs=con.prepareStatement(query_for_fs);
                    pstmt_fs.setString(1,flight_num);
                    pstmt_fs.setString(2,airline_code);
                    //ResultSet rst = null;
                    ResultSet rst1 = pstmt_fs.executeQuery();
                    
                    while(rst1.next()){
                        fs_valid = rst1.getInt(1);
                    }
                    
                    if(no_of_seats > fs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                    }
                    else{
                        String query="Insert into tickets (userid, `Airline Code`, `Flight Number`, date_of_flight, no_of_seats, Ticket_type, PNR) values (?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, userid);
                        pstmt.setString(2, airline_code);
                        pstmt.setString(3, flight_num);
                        pstmt.setString(4, date_of_flight);
                        pstmt.setInt(5, no_of_seats);
                        pstmt.setString(6, Ticket_type);                      
                        pstmt.setString(7, PNR);
                        
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            out.println("Values Inserted Successfully");
                        }
                        
                        String update_fs = "UPDATE flights SET first_class_seat_booked = first_class_seat_booked + ?, first_class_seat_aval = first_class_seat_aval - ? WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ? ;";
                        PreparedStatement pst_up_fs=con.prepareStatement(update_fs);
                        pst_up_fs.setInt(1,no_of_seats);
                        pst_up_fs.setInt(2,no_of_seats);
                        pst_up_fs.setString(3,flight_num);
                        pst_up_fs.setString(4,airline_code);
                        
                        
                        int y=pst_up_fs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully");
                        }
                        
                        String pay_q_fs="Insert into payment_details (PNR, transaction_id, address, fair) values (?, ?, ?, ?)";
                        PreparedStatement pay_ps_fs =con.prepareStatement(pay_q_fs);
                        pay_ps_fs.setString(1, PNR);
                        pay_ps_fs.setString(2, transaction_id);
                        pay_ps_fs.setString(3, "NULL");
                        pay_ps_fs.setInt(4, ff_2);
                 
                        
                        int pay_fs=pay_ps_fs.executeUpdate();
                        if(pay_fs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }break;
                    
                case "Economic Class":
                    int fair_3=1;
                        String cost_3 = "SELECT eco_class_price FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ?";
                        PreparedStatement cst3_ps=con.prepareStatement(cost_3);
                        cst3_ps.setString(1, flight_num);
                        cst3_ps.setString(2, airline_code);
                        ResultSet rst_cst3 = cst3_ps.executeQuery();
                    
                        while(rst_cst3.next()){
                            fair_3 = rst_cst3.getInt(1);
                        }
                        
                        int ff_3 = fair_3 * no_of_seats;
                        String eff =String.valueOf(ff_3);
                        String eeff= "RS: " + eff + "/-";
                        
                        HttpSession sess=request.getSession();
                        sess.setAttribute("ff",eeff);
                    
                    int cs_valid=0;
                    String query_for_cs = "SELECT eco_class_seat_aval FROM flights WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ? ";
                    PreparedStatement pstmt_cs=con.prepareStatement(query_for_cs);
                    pstmt_cs.setString(1, flight_num);
                    pstmt_cs.setString(2, airline_code);
                    //ResultSet rst = null;
                    ResultSet rst2 = pstmt_cs.executeQuery();
                    
                    while(rst2.next()){
                        cs_valid = rst2.getInt(1);
                    }
                    
                    if(no_of_seats > cs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                    }
                    else{
                        String query="Insert into tickets (userid, `Airline Code`, `Flight Number`, date_of_flight, no_of_seats, Ticket_type,  PNR) values ( ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, userid);
                        pstmt.setString(2, airline_code);
                        pstmt.setString(3, flight_num);
                        pstmt.setString(4, date_of_flight);
                        pstmt.setInt(5, no_of_seats);
                        pstmt.setString(6, Ticket_type);                      
                        pstmt.setString(7, PNR);
                        
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            out.println("Values Inserted Successfully");
                        }
                        
                        String update_cs = "UPDATE flights SET eco_class_seat_booked = eco_class_seat_booked + ?, eco_class_seat_aval = eco_class_seat_aval - ? WHERE `Flight Number` LIKE ? AND `Airline Code` LIKE ? ;";
                        PreparedStatement pst_up_cs=con.prepareStatement(update_cs);
                        pst_up_cs.setInt(1,no_of_seats);
                        pst_up_cs.setInt(2,no_of_seats);
                        pst_up_cs.setString(3,flight_num);
                        pst_up_cs.setString(4,airline_code);
                        
                        int y=pst_up_cs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully");
                        }
                        
                        String pay_q_cs="Insert into payment_details (PNR, transaction_id, address, fair) values (?, ?, ?, ?)";
                        PreparedStatement pay_ps_cs =con.prepareStatement(pay_q_cs);
                        pay_ps_cs.setString(1, PNR);
                        pay_ps_cs.setString(2, transaction_id);
                        pay_ps_cs.setString(3, "NULL");
                        pay_ps_cs.setInt(4, ff_3);
                   
                        
                        int pay_cs=pay_ps_cs.executeUpdate();
                        if(pay_cs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }break;
                default:
                    break;
            }
           System.out.println("-------------------------------INSIDE USER_BOOKING_VALIDATION_CHECK ----------------------");    
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        out.close();
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
