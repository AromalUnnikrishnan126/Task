import 'package:flutter/material.dart';
import 'package:flutter_application_cart/cart.dart';
import 'package:flutter_application_cart/product_list.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});
  //final cartItems=cartItems;
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 167, 255),
        title: Center(child: Text('Product Details')),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
             Image.asset(
              product['images'], 
              width: 200, 
              height: 200, 
            ),
            Text(product['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
            SizedBox(
              height: 20,
            ),
            Text('\$${product['price']}'),
             SizedBox(
              height: 40,
            ),
            Text(product['details']),
           
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, foregroundColor: Colors.white),
              onPressed: () {
                
                addToCart(product);

                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                    settings: RouteSettings(arguments: cartItems),
                  ),
                );
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product['name']} added to cart'),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
    
  }
  void addToCart(Map<String, dynamic> product) {
     String productName = product['name'];
    double productPrice = product['price'];
    
    cartItems.add({
      'productId': products.indexOf(product),
       
       'name':productName,
       'price':productPrice,
       'quantity': 1, 
    });
  }
}


List<Map<String, dynamic>> cartItems = [];


