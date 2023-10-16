import 'package:flutter/material.dart';
import 'package:flutter_application_cart/order_confirmation.dart';
import 'package:flutter_application_cart/product_list.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, dynamic>? selectedCartItem;
  Map<String, dynamic> selectedCartItemProperties = {}; 

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems =
        ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 167, 255),
        title: Center(child: Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          final product = products[cartItem['productId']];
          final isSelected = cartItem == selectedCartItem; 

          
          final bgColor = isSelected ? const Color.fromARGB(255, 216, 3, 244) : Colors.white;
          return GestureDetector(
            onTap: () {
              
              setSelectedCartItemProperties(cartItem);
              selectedCartItem = cartItem;
            },
         
          
          child :Container(
            color: bgColor, 
            child: ListTile(
              title: Text(product['name']),
              subtitle: Text('\$${product['price']}'),
              trailing: Text('Quantity: ${cartItem['quantity']}'),
            ),
          ),
          );
           
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 182, 37, 37), 
                foregroundColor: Colors.white, 
                ),
          onPressed: () {
            if (selectedCartItem != null) {
              
              cartItems.remove(selectedCartItem);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderConfirmationPage(selectedCartItemProperties),
                ),
              );
            }
          },
          child: Text('Place Order'),
        ),
      ),
    );
  }
  void setSelectedCartItemProperties(Map<String, dynamic> cartItem) {
    setState(() {
      
      selectedCartItemProperties = {
      'name': cartItem['name'],
      'price': cartItem['price'],
      'quantity': cartItem['quantity'],
      } ;
      print(selectedCartItemProperties);
    });
  }
  
}



