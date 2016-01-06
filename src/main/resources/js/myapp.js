'use strict';
var myapp = angular.module("myapp", []);
myapp.controller('productoController', function($scope){
$scope.producto = {
        articulo: "Mesa",
		   precio: "100", 
		   Ficha: function() {
		       var productoObjeto;
			   productoObjeto = $scope.producto;
            return  	productoObjeto.articulo + " " + productoObjeto.precio;		   
         	}	   
     };				
 });
