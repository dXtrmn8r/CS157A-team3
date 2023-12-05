<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Board</title>
</head>
<body>
	<h2>Which board would you like to see?</h2>
	<form action="ArrivalsBoard.jsp" method="get">
		<input type="submit" value="Arrivals">
	</form>
	<form action="DeparturesBoard.jsp" method="get">
		<input type="submit" value="Departure">
	</form>
</body>
</html>