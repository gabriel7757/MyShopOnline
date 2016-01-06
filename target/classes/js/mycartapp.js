var app = angular.module("mycartapp",[]);

app.controller("cartController", function($scope, $shop){
	
	
	$scope.agregar = function(producto)
	{
		alert("llegamos a add");
		var product = {};
		product.id = producto.id;
		product.price = producto.price;
		product.name = producto.name;
		product.category = producto.category;
		product.qty = parseInt(producto.total || 1,10);
		$shop.add(product);
	}
	

	 $scope.amount = '70';
	

	
	
	/**
	* @desc - elimina un producto del carrito por su id
	*/
	$scope.remove = function(id)
	{
		if($shop.remove(id))
		{
			alert("Producto eliminado correctamente");
			return;
		}
		else
		{
			alert("Ha ocurrido un error eliminando el producto, seguramente porqué no existe");
			return;
		}
	}
	
	
	
	
});
		