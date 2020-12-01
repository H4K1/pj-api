#Preview

[Link api](https://stark-sands-65032.herokuapp.com/api/v1/stores)

# Endpoints

## Store - endpoints
* GET   | __/api/v1/stores/ - Todas las tiendas__
* GET   | __/api/v1/stores/:id - Información sobre una tienda__
* GET   | __/api/v1/stores/:id/products - Ver los productos disponibles de una tienda__
* GET   | __/api/v1/stores/:id/orders - Ver las ordenes de una tienda__
* POST  | __/api/v1/stores/ - Crea una tienda__
* PUT   | __/api/v1/stores/:id - Actualiza los datos de una tienda__ 
* DELETE| __/api/v1/stores/:id - Borra una tienda__

Ejemplo:

```json
{
  "store": {
    "name": "Store name", 
    "email": "user@example.com",
    "address": "Localhost3000",
    "phone": "00000000"
  }
}
```
Por defecto agrega todos los productos a la tienda pero se les puede pasar manualmente.

```json
{
  "store": {
    "name": "Store name", 
    "email": "user@example.com",
    "address": "Localhost3000",
    "phone": "00000000",
    "product_ids": [
      1,2,3,4
    ]
  }
}

```

## Products - endpoints

* GET   | __/api/v1/products/ - Muestra todos los productos disponibles__
* GET   | __/api/v1/products/:id - Información sobre un producto__
* POST  | __/api/v1/products/ - Crea un producto__
* PUT   | __/api/v1/products/:id - Actualiza un producto__
* DELETE| __/api/v1/products/:id - Borra un producto__

Ejemplo:

```json
{
  "product": {
    "name": "Product name",
    "sku" : "0000000",
    "type": "Pizza" o "Complement",
    "price": 20
  }
}
```

## Orders - endpoints

* GET   | __/api/v1/orders - Muestra todas las ordenes__ 
* GET   | __/api/v1/orders/:id - Información sobre una orden__
* POST  | __/api/v1/orders/ - Crea una orden__
* PUT   | __/api/v1/orders/:id - Actualiza una orden__ 
* DELETE| __/api/v1/products/:id - Borra una orden__ 

Ejemplo:

```json
{
  "order": {
  "store_id": store_id,
  "product_ids": [
    1,3,5,2
    ]
  }
}
```
