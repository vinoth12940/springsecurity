<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>My Login Page !!!!</p>
<form:form action="${ pageContext.request.contextPath }/authendicateTheUser" method="POST">
	
	<!-- login error message -->
	<c:if test="${ param.error != null }">
		<p style="color: red;font-style: italic;"> Bad credentials !! please verfiy your username and password</p>
	</c:if>
	
	<!-- logout message -->
	<c:if test="${ param.logout != null }">
		<p style="color: green;font-style: italic;"> logged out successfully</p>
	</c:if>
	
		UserName: <input style="border: thick; border-color: black;" type="text" name="username"/>
		</br>
		</br>
		password: <input style="border: thick; border-color: black; type="password" name="password"/>
		</br>
		</br>
		<input type="submit" value="Login">
</form:form>

</body>
</html>