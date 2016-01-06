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
<%@page import="org.json.simple.JSONObject"%>


<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core" > 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- <link href="/resources/js/bootstrap.js" /> -->
<!-- <link href="/resources/css/bootstrap-responsive.css"/> -->

<link rel="stylesheet"  href="/resources/css/normalize.css"  media="screen" />
<link rel="stylesheet"  href="resources/css/foundation.min.css" media="screen" />   
<meta name="easybasket" content="dragdrop=yes; showhide=yes" />
<!--  estos enlaces los coge OK -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"> <!--  jstl -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/angular.js" />"> </script>
<script type="text/javascript" src="<c:url value="/resources/js/mycartapp.js" />"> </script>





<!-- <link href="<c:url value="/resources/js/cart.js" />" >
<script src="../../resources/js/mycart.js"></script> -->
<!--<script src="../lib/angular.js"></script>-->
<!-- <script src="../lib/app1.js"></script>
<script src="../lib/mycart.js"></script> -->
<!-- <script src="/resources/js/principal.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>-->
 
<script>




/*
$(document).ready(function(){
	
  $('.addCart').click(function(){
    	var arrayCodes=[];
    	var i=0;
    	alert("Por el nuevo ahora");

    	var $row = $(this).closest("tr");
    	var $code = $row.find("td:nth-child(1)"); 	

    //	arrayCodes[i]= $tds.text();
    //	alert($tds.text());
    	alert("Elcodigo de nuevo"+ $code.text());
    	var $idCode=$code.text();

    	alert("EL num de nuevo"+ $idCode);


		
	
    	$.ajax({
			   url : "/addtoCart.do",			   
	           type : "POST",
	           async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
            cache: false,    //This will force requested pages not to be cached by the browser          
            processData:false, //To avoid making query String instead of JSON
			   data: JSON.stringify($idCode),
			   beforeSend: function(bs){
                alert("Entra en ajax before send");  
				   bs.setRequestHeader("Accept","application/json");
				   bs.setRequestHeader("Content-Type","application/json"); 
				   },
			   success: function(result)
			      {
			       	    alert("JSON OK");
			      },
		       error: function(error)
				   {   
				     alert("JSON EError: "+error);
			       }	
			});
		
		alert("FIN JSON");
		return true;

    			

	});

});

*/


     function multidelete()
     {
    
         var tabla=document.getElementById("tblDelete");        
         var numFilas= 0;
         var checkedVector = new Array();
         numFilas= tabla.rows.length;      
         var j=0;
         try
         {
             
         for(var i=0; i<numFilas; i++)
             {
        	// alert("Entra en for: "+i);
               var fila= tabla.rows[i];
              
               var chbDelete=fila.cells[5].childNodes[0];
               if (chbDelete != null && chbDelete.checked == true)
                   { 
            	
              	     checkedVector[j]=fila.cells[0].childNodes[0];
                     tabla.deleteRow(i);
                     numFilas--;
                     i--;
                     j++;
                   } 
             }//for
         }
         catch(e)
         {
             alert("Excepcion="+e);
         }

        //alert("vector="+checkedVector);
     	//alert("antes de ajax, parametro="+checkedVector[0]);
		
		//var json = { "producto" : checkedVector[1]};
		//var dato = checkedVector[0];
		//var dato = "{\"product\":\"raton\",\"codeProduct\":3}";
	
		alert("va a entrar en ajax 3");

		var nameProduct="Teclado";
		var codeProduct="1";
		//var objJSON = {"product": checkedVector[0]};
		var objJSON = {"codeProduct": codeProduct};
		

		alert("objJSON="+objJSON);
		
		$.ajax({
			   url : "${pageContext.request.contextPath}/multiDelete.do",			  
			   //url : "/multiDelete.do",
	           type : "POST",
	           async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
               cache: false,    //This will force requested pages not to be cached by the browser          
               processData:false, //To avoid making query String instead of JSON
			   data: JSON.stringify(checkedVector[0]),
			   beforeSend: function(bs){
                   alert("Entra en ajax before send");  
				   bs.setRequestHeader("Accept","application/json");
				   bs.setRequestHeader("Content-Type","application/json"); 
				   },
			   success: function(result)
			      {
			       	    alert("JSON OK codeProduct="+result.codeProduct);
			      },
		       error: function(error)
				   {   
				     alert("JSON error "+error);
			       }	
			});
		
		alert("FIN JSON");
		return true;
     }

     function updateHiddenField() {
        var trPaid = document.getElementById('productfield'); //assume tr field's id is trPaid
        var borrarSN = confirm("Eliminar el producto... "+trPaid);
        if (borrarSN)
        {
          window.location=url;
        }
    	else
        {
        alert("Producto no eliminado");
        }
       
    }

          
</script>

 
<title>Product Management</title>
</head>
<body ng-app="myCart">
<header> MAIN MENU </header>
<div class="capatop"><h1>CARRITO DE COMPRAS</h1></div>
<nav>
  <form:form action="redirect_userHome.do" method="GET"  commandName="product" >
   <input type="submit" name="action1" value="Customer Area"/>
  </form:form>
  
  <a class="btn btn-large btn-primary right" href="/MyShopOnline/userHome">Access Login</a>  
  
 </nav>

<br>
<form:form action="product.do" method="POST"  commandName="product" > 

<table class="table">
  <tr style="background-color: orange">
      <td>Code Product</td><td><form:input path="code" /></td> 
  </tr>
  <tr style="background-color: orange">
      <td>Product name</td><td><form:input path="nameProduct" /></td>
  </tr>
  <tr style="background-color: orange">      
      <td>Stock</td><td><form:input path="stock"/></td>
  </tr>
  <tr style="background-color: orange">      
  <td>Price</td><td><form:input path="price"/></td>
  </tr>
  
  
  <tr>
  <td colspan="2">
        <input type="submit" name="action" value="Edit"/>
        <input type="submit" name="action" value="Delete"/>
        <input type="submit" name="action" value="Add"/>
        <input type="submit" name="action" value="Search"/>
   </td>
   </tr>
   </table>     
</form:form>
<div ng-controller="MycartController">
<form:form action="productDelete.do" method="POST"  commandName="product" > 
<c:if test="${!empty listProducts}">
<table id="tblCart" border="1">
  <tr style="background-color: orange"> <td colspan="">Report List Products</td> </tr>
  <tr style="background-color: orange">
  <td>Code</td>
  <td>Product name</td>
  <td>Stock</td>
  <td>Price</td>
  <td>Add Cart</td>
  </tr>
  <c:forEach items="${listProducts}" var="product">
     <tr>
        <td>${product.code}</td>
        <td>${product.nameProduct}</td>
        <td>${product.stock}</td>
        <td>${product.price}</td>
      	<td> {{cantidad}}</td>
      	<!-- <td>${product.getAsJson()}</td>-->
      	<td>${product.getAsJson()}</td>
      	<td>${product}</td>
      	<c:set var="pro" value="JSON.parse('${product}')" /> 
       <td><input type="button" class="addCart" name="addCart" value="Add" ng-click='agregar(${product.getAsJson()})'/></td>
     </tr>
  </c:forEach>
</table>
</c:if>
</form:form>
</div>

<form:form name="frmDelete" id="frmDelete" action="" method="POST"  commandName="product" > 
<table id="tblDelete" border="1">
    <thead>
       <tr style="background-color: orange">
       <th>Code Product</th> 
       <th>Product name</th>
       <th>Stock</th>
       <th>Price</th>
       <th>Actions</th>
       <th>Delete</th>
       </tr>
   </thead>
   <tbody>
      <c:forEach items="${listProducts}" var="product">
        <tr>  
        <td><c:out value="${product.code}" /></td>
        <td><c:out value="${product.nameProduct}" /></td>
        <td><c:out value="${product.stock}" /></td>
        <td><c:out value="${product.price}" /></td>
        <td><input type="button" name="edit" value="Edit" /></td>
        <td><input type="checkbox" name="chbDelete" id ="chbDelete" value=""/></td>
        </tr>
      </c:forEach>
    </tbody>
   </table>
  <input type="button" name="delete" value="Delete" onclick="multidelete();" />
</form:form>

<div>
    <a href="addProduct.jsp">Añadir a Cesta</a> 
</div>


    	 
    	<h2>CARRITO DE COMPRA ANGUJAR.JS</h2>
    	
    	
    	<div ng-controller="MycartController">
         Articulo: <input type="text" ng-model="producto.articulo"><br><br>
	     Precio:   <input type="text" ng-model="producto.precio"><br><br>
	     Ficha: {{producto.Ficha()}}
	     Cantidad:{{cantidad}}
        </div>
        
  <div ng-controller="GreetingController">      
 <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
    <input type="hidden" name="cmd" value="_s-xclick">
 	<input type="hidden" name="hosted_button_id" value="LPBTYT4VU9GSN">
	<input type="image" src="https://www.paypalobjects.com/es_ES/ES/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal. La forma rápida y segura de pagar en Internet.">
	<img alt="" border="0" src="https://www.paypalobjects.com/es_ES/i/scr/pixel.gif" width="1" height="1">
	<input type="hidden" name="currency_code" value="USD">
	<input type="hidden" name="amount" value="{{amount}}">
</form>
   </div>      
    	
      <!--	<div ng-app ng-init="articulo='teclado'">
   			    <p> El artículo es : {{articulo}}</p>
   			    <p>Operación : {{9+8}} </p>
   		      	<input type="text" data-ng-model="articulo" />
   			    <h1 data-ng-show=articulo">Nuevo artículo: {{articulo}}</h1>
   		</div>	    
   		
   		
    	<div data-ng-app="prueba" data-ng-controller="pruebaController">
    	   
    	   Producto: <input type="text" ng-model="articulo.producto"><br>
    	   el producto es: {{articulo.producto}}
    	</div> 
    		-->
   			
   <!--  <div data-ng-app="app" >	
    	<div  data-ng-controller="controllerFormCart">
    	<p>{{products.description}}</p> 
    	<table class="table">
		    <tr>
		      <th>Nombre</th>
		      <th>Cantidad</th>
		      <th>Precio unidad</th>
		      <th>Total producto</th>
		      <th></th>
		    </tr>
		  <tr data-ng-repeat="item in products">		
		      <td><input type="text" data-ng-model="item.description" class="input-small"></td>
		      <td><input type="text" data-ng-model="item.qty"  data-ng-required  class="input-mini"></td>
		      <td><input type="text" data-ng-model="item.cost" data-ng-required class="input-mini"></td>		    
		      <td>{{item.description}}</td>  -->
		    <!--  <td><a href data-ng-click="removeItem($index)">[DELETE]</a></td>-->
		<!--  </tr>
		  <tr>-->  
		     <!-- <td><a href data-ng-click="addItem()" class="btn btn-small">Añadir</a></td>-->
		     <!-- <td></td>
 	    	 <td>total Shopping:</td>
 	    	 <td></td> -->
 	    	 <!-- <td>{{ total() | currency}}</td>-->
		    <!-- </tr>
		</table>
		 -->
    	    
 
    	<!--<form name="cart1" action="paypalButton" method="post" id="formPaypal1">
            <p><input type="radio" name="producto" value="Ordenador">Ordenador</input></p>
            <p><input type="radio" name="producto" value="Monitor">Monitor</input></p>
            <p><input type="radio" name="producto" value="Raton">Raton</input></p>
            <p><input type="radio" name="producto" value="Impresora">Impresora</input></p>
            <p><input type="submit"  name="action1" value="Seleccionar Producto"/></p>
    	</form> -->
    <!--  </div>
    </div>  -->
</body>
</html>