<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p>Welcome to new springframe work !!! - YAHOO !!!
		
		<h1>
		user:<security:authentication property="principal.username"/>
		Role:<security:authentication property="principal.authorities"/>
	
	</h1>
	
	<hr>
		<security:authorize access="hasRole('MANAGER')">
			<p>
				<a href="${ pageContext.request.contextPath }/leaders">leadership meeting</a>
			</p>
		</security:authorize>	
	</hr>
	
	<hr>
		<security:authorize access="hasRole('ADMIN')">	
			<p>
				<a href="${ pageContext.request.contextPath }/systems">IT systems</a>
			</p>
		</security:authorize>	
	</hr>
		</br>
		</br>
		<form:form action="${ pageContext.request.contextPath }/logout" method="POST">
				<input type="submit" value="Logout">
		</form:form>
		
	
</body>
</html>