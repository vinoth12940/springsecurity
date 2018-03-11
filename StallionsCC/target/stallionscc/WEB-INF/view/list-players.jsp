<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<p>
				User: <security:authentication property="principal.username" />, Role(s): <security:authentication property="principal.authorities" />
			</p>
		

			<security:authorize access="hasAnyRole('ADMIN')">
			
				<!-- put new button: Add Player -->
			
				<input type="button" value="Add Player"
					   onclick="window.location.href='showFormForAdd'; return false;"
					   class="add-button"
				/>
			
			</security:authorize>
	
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					
					<%-- Only show "Action" column for managers or admin --%>
					<security:authorize access="hasAnyRole('ADMIN')">
					
						<th>Action</th>
					
					</security:authorize>
					
				</tr>
				
				<!-- loop over and print our players -->
				<c:forEach var="tempPlayer" items="${players}">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/player/showFormForUpdate">
						<c:param name="playerId" value="${tempPlayer.id}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/player/delete">
						<c:param name="playerId" value="${tempPlayer.id}" />
					</c:url>					
					
					<tr>
						<td> ${tempPlayer.firstName} </td>
						<td> ${tempPlayer.lastName} </td>
						<td> ${tempPlayer.email} </td>

						<security:authorize access="hasAnyRole('ADMIN')">
						
							<td>
								<security:authorize access="hasAnyRole('ADMIN')">
									<!-- display the update link -->
									<a href="${updateLink}">Update</a>
								</security:authorize>
	
								<security:authorize access="hasAnyRole('ADMIN')">
									<a href="${deleteLink}"
									   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
								</security:authorize>
							</td>

						</security:authorize>
												
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	
	<p></p>
		
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" class="add-button" />
	
	</form:form>

</body>

</html>









