<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<jsp:include page="Background.jsp" />

<!DOCTYPE html>
<html lang="en">
<% String pagename="user_booking_failed.jsp"; session.setAttribute("pagename", pagename); %>

<style>
table, th, td {
	border: 1px solid;
	text-align: center;
	padding: 5px;
}
</style>

<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    
<script>
        function booking_validate(){
            if(document.getElementById("userid").value===""){
                alert("Please Enter userid!");
                return false;
            }
            else if(document.getElementById("flight_id").value===""){
                alert("Please Enter Flight Id!");
                return false;
            }
            else if(document.getElementById("no_of_seats").value===""){
                alert("Please Enter Total Number Of Seats");
                return false;
            }
            
            else if(document.getElementById("date_of_flight").value===""){
                alert("Please Enter Date Of Flight!");
                return false;
            }
           }
        
    </script>    
</head>

<body>
    <div class="container-xxl bg-white p-0">

        <!--
        
        <h5><span class="text-primary text-uppercase">Your Ticket ID Is ->  </span></h5>
        <h6 type="text" id="mainCaptcha"></h6>
        <p><input type="button" class="btn btn-primary w-75" value="Refresh" id="refresh" onclick="Captcha();"/></p>
        
        -->

        <div class="container-xxl py-5">
            <div class="main">
                <h1>Flight Details</h1>
				
				<table class="center">
					<tr>
						<th>Flight Number</th>
						<th>Date</th>
						<th>Departure</th>
						<th>Arrival</th>
						<th>Arrival_time</th>
						<th>Depart_time</th>
						<th>First Class Available</th>
						<th>Business Class Available</th>
						<th>Economic Class Available</th>
						<th>First Class Price</th>
						<th>Business Class Price</th>
						<th>Economic Class Price</th>
					</tr>
					<%
					ResultSet rs = (ResultSet) request.getAttribute("flight_results");
					if (rs != null) {
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getTime(5)%></td>
						<td><%=rs.getTime(6)%></td>
						<td><%=rs.getInt(7)%></td>
						<td><%=rs.getInt(8)%></td>
						<td><%=rs.getInt(9)%></td>
						<td><%=rs.getInt(10)%></td>
						<td><%=rs.getInt(11)%></td>
						<td><%=rs.getInt(12)%></td>					
					</tr>
					<%
					}
					} else {
						%>
					<tr><td colspan='12'>No results found</td></tr>
					<%} %>			
				</table>
                
                <!-- Booking Start -->                
                <!-- Booking Start -->				
				<h1 class="mb-5">Book A <span class="text-primary text-uppercase">Plane Ticket</span></h1>      
               <form name="m_f" method="post" action="User_booking_validation">
                   <div class="row g-3">
                   		<div class="form-floating">
                           		<label for="name">Your UserID</label>                          
                               <input type="text" class="form-control" id="userid" placeholder="Your User Name" name="userid">
                        </div>
                       
                           <div class="form-floating">
                           		<label for="name">Provide Plane Number</label>
                               <input type="text" class="form-control" id="flight_id" placeholder="Plane Id" name="flight_id">                               
                           </div>
                       
                           <div class="form-floating">
                               <label for="number">Number of Seats</label>                           
                               <input type="number" class="form-control" id="no_of_seats" placeholder="Total Number Of Seats" name="no_of_seats">
                           </div>
                           <div class="form-floating">
                           		<label for="select3">Select Ticket Type</label>
                               <select class="form-select" id="select3" name="Ticket_type">
                                 <option value="Business Class">Business Class</option>
                                 <option value="First Class">First Class</option>
                                 <option value="Economic Class">Economic Class</option>
                               </select>                               
                           </div>
                           <div class="form-floating date">
                               <label for="checkin">Date Of Flight</label>                           
                               <input type="date" class="form-control" placeholder="Date Of Flight" id="date_of_flight" name="date_of_flight">
                               
                           </div>
                       
                       <div class="col-12">
                           <div class="form-floating">
                               <button class="btn btn-primary w-100 py-3" onclick="return booking_validate();" type="submit">Book Now</button>
                           </div>
                       </div>
                     </div>
                  </form>

            
            	</div>
        	</div>
		</div>
	        

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
<script>
    alert("Booking Can't Be Processed!\n\
            Either Date Of Flight Is Incorrect!\n\
            Either Plane Id Is Incorrect!\n\
            Either Check Again For Available Seats!\n\
            Either Adults and Child Seats are not equal to total number of seat Allotments");
            
</script>
</html>

