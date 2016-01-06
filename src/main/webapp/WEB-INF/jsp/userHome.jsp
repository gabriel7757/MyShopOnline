<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.*" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.dao.implementations.*" %>
<%@ page import="java.util.*" %>

<%@page session="false" %>
 
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Main Page User Home</title>
 
  <style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}
 
.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
 
#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
 
 <script type="text/javascript">
     function paypalAccess()
     {
        accessWindows = window.open("","_PPIdentityWindow_","location=1,status=0,scrollbars=0,width=200,height=200");
        return true;         
     }
     
 </script>
 
  
</head>
<body onload='document.loginForm.j_username.focus();'>
  <h1>LOGIN ACCESS</h1>
  <nav></nav>
  
  <div id="login-box">
  
  <c:if test="${not empty error}">
         <div class="error"> ${error} <h2>Error en el Login</h2></div>
  </c:if>
  <c:if test="${not empty msg}">
         <div class="msg">${msg}</div>
  </c:if>
  
   <form name='loginForm' action="<c:url value="/j_spring_oauth_security_check"></c:url>"  method="POST" role="form" >
   <!--<form action="j_spring_security_check" method="POST" >-->
   <table border="1">
   <tr style="background-color: orange">
      <td>User</td><td><input type='text' name='j_username' value=''></td> 
  </tr>
  <tr style="background-color: orange">
      <td>Password</td><td><input type='text' name='j_password' value=''></td>
       <td> <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}"/></td> 
  </tr>
  
  <tr>
  <td colspan="2">
        <input type="submit" type="submit" value="Access Login"/>
        <input type="reset"  name="reset" value="Clear"/>
   </td>
   </tr>
   </table>     
  </form>
   
  <!--  <spring:url value="/j_spring_security_check" var="form_url_google" />
   <form action="form_url_google" name="login_google" id="login_google" method="POST" >
   <input type="submit" name="action1" value="Access Login"/>
   <input type="hidden" name="google_name"  id="google_id" size="60" maxlength="150" value="http://www.google.com/accounts/o8/id">
    -->
 </div>  
 <div>
    <a href="https://accounts.google.com/ServiceLogin?hl=ES">Sign in</a> 
</div>

<h3>PAYPAL</h3>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="MCRPYFRNHVW2C">
<input type="image" src="https://www.paypalobjects.com/es_ES/ES/i/btn/btn_buynowCC_LG.gif"  name="submit" alt="PayPal. La forma rápida y segura de pagar en Internet.">
<img alt="" border="0" src="https://www.paypalobjects.com/es_ES/i/scr/pixel.gif" width="1" height="1">
</form>

<!-- <form name='paypalForm' action="<c:url value="/userHome/paypal"></c:url>"  method="POST" target="_PPIdentityWindow_" >
      <input type="image" src="https://www.paypalobjects.com/webstatic/en_US/developer/docs/lipp/loginwithpaypalbutton.png" onClick="paypalAccess();" />
</form> -->

<form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="bussiness"   value="gabrielpz533@gmail.com">
<input type="hidden" name="hosted_button_id" value="B8CZU5C44C6VJ">
<input type="hidden" name="item_name"   value="Premium_Subscription">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="amount" value="0.01">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="return" value="http://localhost:8080/MyShopOnline/">
<input type="hidden" name="cancel_return" value="http://localhost:8080/MyShopOnline/">
<input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif" name="submit" alt="">
</form>


<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="RFLA8RTJ59RS6">
<input type="hidden" name="bussiness"   value="gabrielpz533@gmail.com">
<input type="hidden" name="currency_code" value="EUR">
<input type="hidden" name="amount" value="0.01">
<input type="image" src="https://www.sandbox.paypal.com/es_ES/ES/i/btn/btn_buynowCC_LG.gif" name="submit" alt="PayPal. La forma rápida y segura de pagar en Internet.">
<img alt="" border="0" src="https://www.sandbox.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
</form>


<form target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="VFKLD3MQCJRJ8">
<input type="image" src="https://www.paypalobjects.com/es_ES/ES/i/btn/btn_cart_LG.gif" name="submit" alt="PayPal. La forma rápida y segura de pagar en Internet.">
<img alt="" border="0" src="https://www.paypalobjects.com/es_ES/i/scr/pixel.gif" width="1" height="1">
</form>
      
     
</body>
</html>