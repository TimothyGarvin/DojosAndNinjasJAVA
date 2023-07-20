<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Ninja</title>
</head>
<body>
	<a href="/dashboard">Return Home</a>
	<h1>New Ninja</h1>
	<form:form action="/ninjas/add" method="post" modelAttribute="ninja">
		<div>
			<form:label path="firstName">First Name:</form:label>
			<div></div>
			<form:input type="text" path="firstName"/>
		</div><hr/>
		<div>
			<form:label path="lastName">Last Name:</form:label>
			<div></div>
			<form:input type="text" path="lastName"/>
		</div><hr/>
		<div>
			<form:label path="age">Age: </form:label>
			<div></div>
			<form:input type="number" path="age"/>
		</div><hr/>
		<div>
			<form:label path="dojo">Dojo:</form:label>
			<form:select path="dojo">
				<c:forEach var="dojo" items="${dojos}">
					<option value="${dojo.id}">${dojo.name}</option>
				</c:forEach>
			</form:select>
		</div><hr/>
		<div>
			<input type="submit" value="Add Ninja">
		</div>
	</form:form>
</body>
</html>