<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dojo Ninjas</title>
</head>
<body>
	<h1><c:out value="${dojo.name}"/> Ninjas</h1>
	<div>
	<table>
		<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ninja" items="${dojo.ninjas}">
				<tr>
					<td><c:out value="${ninja.firstName}"/></td>
					<td><c:out value="${ninja.lastName}"/></td>
					<td><c:out value="${ninja.age}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<a href="/dashboard">Return Home</a>
</body>
</html>