
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<%
String pagename = "user_booking.jsp";
session.setAttribute("pagename", pagename);
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Lumipad</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />

<script>
	function payment_validate() {
		console.log("Entered payment_validate function");
		if (document.getElementById("address").value === "") {
			alert("Advised To Enter Your Address!");
			return false;
		}
		if (document.getElementById("payment_type").value === "") {
			alert("Advised To Provide Your Payment Type!");
			return false;
		}
		if (document.getElementById("amount").value === "") {
			alert("Provided Amount Is Empty!");
			return false;
		}
		var ff = document.getElementById("ff").value;
		if (document.getElementById("amount").value === ff) {
			alert("Provided Amount Is Incorrect!");
			return false;
		}
		if (document.getElementById("upino").value === "") {
			alert("Advised To Provide UPI/Credit/Debit No!");
			return false;
		}
		if (document.getElementById("payment_type").value === "") {
			alert("Advised To Provide Your Payment Type!");
			return false;
		}
		if (document.getElementById("payment_type").value === "Debit Card PAY") {
			if (document.getElementById("upino").len < 12) {
				alert("Advised To Provide Proper Debit Card No!");
				return false;
			}
		}
	}
</script>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="ArrivalsBoard.jsp"><img
				src="images/lumipad-logo.png" alt="Lumipad Logo"
				style="height: 100px" /> Lumipad</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Cancellation.jsp">Cancel</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="TicketHistory">Ticket
							History</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="UpcomingFlights">Upcoming
							Tickets</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a>
					</li>
					<!-- This above line needs a servlet to allow logout -->

					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name")%></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<div>
				<!-- Header Start -->
				<div>

					<!-- Booking Start -->
					<div>
						<div>
							<div>
								<h1 class="mb-5">Book A Plane Ticket</h1>
							</div>
							<div>

								<div>
									<div>
										<h3>
											<small>Your PNR No Is> <%
											String pnrno = (String) session.getAttribute("pnrno");
											out.print(pnrno);
											session.setAttribute("PNR", pnrno);
											String ticket_type = (String) session.getAttribute("ticket_type");
											session.setAttribute("ticket_type", ticket_type);
											%>

											</small>
										</h3>

										<h3>
											<small>Your Total Fair: <%
											String ff = (String) session.getAttribute("ff");
											out.print(ff);
											%>
											</small>
										</h3>

										<form method="post" action="User_booking"
											onsubmit="return payment_validate();">

											<input type="hidden" id="ff" value="<%=ff%>">
											<div>
												<div>
													<div>
														<input type="text" class="form-control" id="name"
															placeholder="Your Address" name="address"> <label
															for="address">Your Address</label>
													</div>
												</div>
												<div>
													<div>
														<select class="form-select" id="select3"
															placeholder="Select Payment Type" name="payment_type">
															<option value="UPI PAY">UPI PAY</option>
															<option value="Debit Card PAY">Debit Card PAY</option>
															<option value="Credit Card PAY">Credit Card PAY</option>
														</select> <label for="select3">Select Payment Type</label>
													</div>
												</div>

												<div>
													<div>
														<input type="text" class="form-control" id="name"
															placeholder="Enter UPI ID/ Credit Or Debit Card Number"
															name="upino"> <label for="address">Enter
															UPI ID/ Credit Or Debit Card Number</label>
													</div>
												</div>

												<div>
													<div>
														<button class="btn btn-primary w-100 py-3"
															onclick="return payment_validate();" type="submit">Pay
															Now</button>
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
				<!--  <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a> -->
			</div>

		</div>
	</header>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Lumipad</small>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
