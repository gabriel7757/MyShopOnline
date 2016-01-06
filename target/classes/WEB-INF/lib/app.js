var app = angular.module("app", []);
app.controller('controllerFormCart', function($scope) {
    $scope.products = [
			       	        {description: "wood", 
			          	       	 qty: 2,
			          	       	 cost: 12
			          	        },
			          	        {
			          	       	description: "iron", 
			          	       	qty: 5,
			          	       	cost:15
			          	       	},
			          	       	];
  		 });  
