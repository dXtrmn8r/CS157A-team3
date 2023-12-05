<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- %@page import="com.itextpdf.text.Document"%> -->
<jsp:include page="Background.jsp" />


<% String pagename="payment_success.jsp"; session.setAttribute("pagename", pagename); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>AirLine Reservation System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <div class="main">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h5 class="section-title text-center text-primary text-uppercase">Payment Success</h5>
                <h1 class="mb-5">Payment <span class="text-primary text-uppercase">Success</span></h1>
                <h1 class="mb-5"><a href="GeneratePDF"> ->Click Here To Download Your Invoice<- </a></h1>
                <h5 class="section-title text-center text-primary text-uppercase">We are requesting you to download your Invoice as a Ticket Proof</h5>
            </div>
        </div>
           
        
        <!-- Footer Gappping -->
        <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="row justify-content-center">
                <div class="col-lg-10 p-1">
                    <div class="text-center p-1">
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Gapping -->

        


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