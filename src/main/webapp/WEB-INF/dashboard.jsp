<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dojos Dashboard</title>
</head>
<body>
	<h1>Dojos Dashboard</h1>
	<table>
		<thead>
			<tr>
				<th>Dojo Name</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dojo" items="${dojos}">
				<tr>
					<td><c:out value="${dojo.name}"/></td>
					<td><a href="/dojos/${dojo.id}">View Ninjas</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr/>
	<a href="/dojos/new">New Dojo</a>
	<div></div>
	<a href="/ninjas/new">New Ninja</a>
</body>
</html>