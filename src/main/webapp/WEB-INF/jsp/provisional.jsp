<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER PROFILE PRIVATE</title>
</head>
<body>
<div>
        WELCOME : <c:out value="${user}"></c:out>
        
</div>

   <c:url value='/j_spring_security_logout' var="logoutUrl" />"
   
   <!--  soporte para crsf -->
   <form name="logoutForm" id="logoutForm" method="POST" >
      <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}"/> 
   </form>
  
   <c:if test="${pageContext.request.userPrincipal.name != null}">
         <h2> Hi : ${pageContext.request.userPrincipal.name} | <a href="javascript:formSubmit()">Logout</a></h2>
   </c:if>

  
</body>
</html>