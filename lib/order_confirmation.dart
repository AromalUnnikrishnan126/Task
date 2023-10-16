import 'package:flutter/material.dart';
import 'package:flutter_application_cart/product_list.dart';

class OrderConfirmationPage extends StatelessWidget {
  final Map<String, dynamic>? selectedCartItemProperties;

  OrderConfirmationPage(this.selectedCartItemProperties);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 167, 255),
        title: Center(child: Text('Order Confirmation')),
        automaticallyImplyLeading: false,
      ),
      body: selectedCartItemProperties != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                  Text(
                    'Order Confirmed!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    title: Text(
                      selectedCartItemProperties!['name'].toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$${selectedCartItemProperties!['price']}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                'No item selected for order confirmation.',
                style: TextStyle(fontSize: 18),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 189, 86, 86),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            // Navigate to the Product List Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListPage(),
              ),
            );
          },
          child: Text('Back to Product List'),
        ),
      ),
    );
  }
}
