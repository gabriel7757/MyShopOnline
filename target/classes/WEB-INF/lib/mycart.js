/*'use-strict'
angular.module('prueba', []).controller('controllerFormCart', function ($scope) { 



  var app = angular.module('prueba', []);
  
   app.controller('controllerFormCart', function ($scope) 
   { 
	   
	    $scope.products = [
	        {description: 'madera', qty: '2',cost:'12'},
	        {description: 'aluminio', qty: '5',cost:'12'}	        
	    ];
	    
	  $scope.addNew = function(product){
	    	$scope.products.push(product);
	    	$scope.product={};
	    }
	    
	   
   });	   
   
   */
	var app = angular.module('prueba', []);
   app.controller('controllerFormCart',
		   ['$scope', function($scope) {
			   
			   $scope.products = [
			          	        {description: 'wood', qty: '2',cost:'12'},
			          	        {description: 'iron', qty: '5',cost:'15'}	        
			          	    ];
			          	    
		 }]);  
   
   app.controller('GreetingController', ['$scope', function($scope) {
	   $scope.greeting = 'Hola!';
	 }]);
   
   
   
     /*
function controlProducts($scope) {
    $scope.products = [
        {'description': 'madera', 'qty': '2','cost':'12'},
        {'description': 'aluminio', 'qty': '5','cost':'12'}	        
    ];
    
    $scope.addNew = function(){
    	$scope.products.push({description: $scope.description, qty: $scope.qty, cost: $scope.cost });
    }
    
}

*/

/*
 angular.module('prueba', [])
   angular.controller("ProductController", controllerMain); 

     function controllerMain() {
       var $scope= this;  
       $scope.products = ["mesa","silla","cuadro"];
       
       $scope.addNew = function(){
           	$scope.products.push($scope.newProduct);
           	$scope.newProduct="";
       }   
	
	};
*/

