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

$scope.cantidad = '500';
 });

myapp.controller('GreetingController', ['$scope', function($scope) {
	   $scope.amount = '80';
}]);