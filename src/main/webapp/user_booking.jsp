<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String pagename="user_booking.jsp"; session.setAttribute("pagename", pagename); %>
<head>
    <meta charset="utf-8">
    <title>Airline Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link rel="icon" href="title_logo.png" type="text/x-icon">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
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
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Header Start -->
        <div class="container-fluid bg-dark px-0">
            <div class="row gx-0">
                <div class="col-lg-3 bg-dark d-none d-lg-block">
                    <a href="index.jsp" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                        <h1 class="m-0 text-primary text-uppercase">Lumipad</h1>
                    </a>
                </div>
                <div class="col-lg-9">
                    
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
                        
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="user_login_pass.jsp" class="nav-item nav-link">Home</a>
                                <a href="lumipad.jsp" class="nav-item nav-link">Check Availability</a>
                                <a href="booking.jsp" class="nav-item nav-link active">Booking</a>
                                <a href="Cancellation.jsp" class="nav-item nav-link">Cancellation</a>
                            </div>
                            <a href="index.jsp" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block">LogOut As<small> 
                                    <%  String U_name=(String)session.getAttribute("username");  
                                        out.print(U_name);  
                                    %>  
                            </small><i class="fa fa-arrow-right ms-3"></i></a>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Header End -->


        
        
        

        <!-- Booking Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Tickets Booking</h6>
                    <h1 class="mb-5">Book A <span class="text-primary text-uppercase">Plane Ticket</span></h1>
                </div>
                
                <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 p-1">
                            <div class="text-center p-1">
                            
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-end">
                            <figure>
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.1s" src="images/about-1.png" style="margin-top: 25%;">
                            </figure>
                            </div>
                           
                        </div>
                    </div>
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
                            
                            <form method="post" action="user_booking_final_check">
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