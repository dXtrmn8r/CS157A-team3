<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="Background.jsp" />

<!DOCTYPE html>
<html lang="en">
<% String pagename="user_booking.jsp"; session.setAttribute("pagename", pagename); %>
<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    
  <script>
        function payment_validate(){
            if(document.getElementById("address").value===""){
                alert("Advised To Enter Your Address!");
                return false;
            }
            if(document.getElementById("payment_type").value===""){
                alert("Advised To Provide Your Payment Type!");
                return false;
            }
            if(document.getElementById("amount").value===""){
                alert("Provided Amount Is Empty!");
                return false;
            }
            if(document.getElementById("amount").value===ff){
                alert("Provided Amount Is Incorrect!");
                return false;
            }
            if(document.getElementById("upino").value===""){
                alert("Advised To Provide UPI/Credit/Debit No!");
                return false;
            }
            if(document.getElementById("payment_type").value===""){
                alert("Advised To Provide Your Payment Type!");
                return false;
            }
            if(document.getElementById("payment_type").value==="Debit Card PAY"){
                if(document.getElementById("upino").len<12)
                    alert("Advised To Provide Proper Debit Card No!");
                return false;
            }
            
</script>  
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Header Start -->
        <div class="container-xxl bg-white p-0">
       
        <!-- Booking Start -->
        <div class="row">
            <div class="main">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h1 class="mb-5">Book A <span class="text-primary text-uppercase">Plane Ticket</span></h1>
                </div>               
                <div class="row g-5">
                    
                    <div class="col-lg-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <h3><small>Your PNR No Is> <%  String pnrno=(String)session.getAttribute("pnrno");  
                                        out.print(pnrno);
                                        session.setAttribute("PNR",pnrno);
                                        String ticket_type=(String)session.getAttribute("ticket_type");
                                        session.setAttribute("ticket_type",ticket_type);
                            %>
                             
                                </small></h3>
                            
                            <h3><small>Your Total Fair:
                                <%
                                String ff=(String)session.getAttribute("ff");  
                                    out.print(ff);
                                %>
                            </small></h3>
                            
                            <form method="post" action="User_booking">
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Your Address" name="address">
                                            <label for="address">Your Address</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" id="select3" placeholder="Select Payment Type" name="payment_type">
                                              <option value="UPI PAY">UPI PAY</option>
                                              <option value="Debit Card PAY">Debit Card PAY</option>
                                              <option value="Credit Card PAY">Credit Card PAY</option>
                                            </select>
                                            <label for="select3">Select Payment Type</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Enter UPI ID/ Credit Or Debit Card Number" name="upino">
                                            <label for="address">Enter UPI ID/ Credit Or Debit Card Number</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <button class="btn btn-primary w-100 py-3" onclick="return payment_validate();" type="submit">Pay Now</button>
                                        </div>
                                    </div>
                                </div>
                               </form>
                         </div>
                       </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- Booking End -->


     

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

</html>