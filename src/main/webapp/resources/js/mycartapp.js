//bloopers=bug
//Javascript se ha creado un estandar ECMAScript 5 ISO 16262 . eval()
//decide sobre HTML, css y javascript. Protege el DOM 
// OJO esto no seria politicamente correcto  var dato = $("#elem").primero("li").title("p").val();
// el correecto es totalmente visible    var dato= $scope.dato;
//Two-way data binding actualizacion permanente entre modelo y vista. el responsable es Scope
//plantillas son las que aumentan las keywords lenguaje HTML
//ejemplos python tiene el framework django   asp.net=motor de vistas razor (.cshtml) code behind  
// los controladores son la logica de progamación y tienen un comportamiento "imperativo" comunicar modelo con vista
// las vistas son declarativas
// 3 formas de declarar los modelos
// 1- forma primitiva           
//   'libro el Quijote' : string
//   1200: number
// 2- Objeto hash o formato JSON
//   { articulo: 'libro azul', precio : 100 }
// 3- por tipo
// function articulo(){
//          this.articulo = 'libro azul';
//          this.precio= 100; 
// }

'use strict';
var myapp = angular.module("myCart", []);
myapp.controller( 'MycartController',  ['$scope','ProductosService', 'CarritoService',
	function ($scope, prodService, carService) {
	 $scope.productos = [];	//
	
	 $scope.productos=miservico.getProductos();//asignacion imperativo
	 
	 
	 $scope.agregarPrueba = function(var1) {	// es una acción dupla variable:action
			
		    var code= var1;
			alert("alert 1 ["+code.nameProduct+"]")
		    //var nameProduct=angular.fromJson(code);
			var nameProduct=var2;
			var stock = var3;
			var price= var4; 
			alert("alert 2 ["+code+" - "+ nameProduct+" - "+stock+" - "+price+"]");
	 }
	 
	 $scope.agregar = function (product) { // es una acción dupla variable:action
	        carService.agregar(product);
	  }	
	 
	$scope.cantidad = '110'; // es una asignación imperativa 
	
//	 prodService.listar(function(data){ //Se llamaria automticamente a la funcion, asignacio imperativa
//	        $scope.productos = data;
//	  });


 }]);

miCarrito.controller(
	    'CartController', ['$scope', 'CarritoService',

	function ($scope, carService) {
	    $scope.carrito = [];
	    
	    /*carService.listar(function(data){
	        $scope.carrito = data;
	    });*/
	    
	    carService.carrito = $scope.carrito;//le asignamos imperativamente los datos agregados anteriormente en el carrito 
	    
	    $scope.precioTotal = function(){
	        var total = 0;
	        angular.forEach($scope.carrito, function(item){
	            total = total + (item.Cantidad * item.Producto.Precio);
	        });
	        
	        return total;
	    };
	    
	    $scope.eliminar = function(item){//accion dupla, variable:accion
	        carService.eliminar(item);
	    };
	    
	}]);



myapp.controller('GreetingController', ['$scope', function($scope) {
	   $scope.amount = '80';

}]);



miCarrito.factory('CarritoService', ['$http', function($http){
    var servicio = {};
    
    servicio.carrito = [];
    
    var filtrar = function(id){
        for (var i = 0; i < servicio.carrito.length; i++) {
            if (servicio.carrito[i].Producto.code == id) {
                return servicio.carrito[i];
            }
        };
        return null;
    };
        
    servicio.agregar = function(p){
    	
    	alert("alert 1 ["+p.nameProduct+"]")
        var itemActual = filtrar(p.code);

        if (!itemActual) {
            servicio.carrito.push({
                Producto: p,
                Cantidad: 1
            });
        } else {
            itemActual.Cantidad++;
        }        

    };
    
    servicio.eliminar = function(item){
        servicio.carrito.splice(servicio.carrito.indexOf(item),1);
    };
    
    return servicio;
}]);




		