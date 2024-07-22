import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart'; // Ensure this import is correct
import 'bottom_nav_bar.dart'; // Ensure this import is correct and BottomNavBar is properly defined

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.green[700],
        actions: [],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cartItems = cartProvider.cartItems;

          if (cartItems.isEmpty) {
            return Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            );
          }

          // Calculate total price accurately
          double totalPrice = cartItems.fold(0.0, (sum, item) {
            double price = (item['price'] ?? 0.0).toDouble();
            int quantity = (item['quantity'] ?? 0).toInt();
            return sum + (price * quantity);
          });

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Items in your cart:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      double itemPrice = (item['price'] ?? 0.0).toDouble();
                      int itemQuantity = (item['quantity'] ?? 0).toInt();
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(Icons.local_florist, color: Colors.green[700]),
                          title: Text('${item['name']} x$itemQuantity'),
                          subtitle: Text('Price: ₱${(itemPrice * itemQuantity).toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _showDeleteConfirmationDialog(context, item, cartProvider);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Total Price: ₱${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Pass cart items and total price to PaymentScreen
                    Navigator.pushNamed(
                      context,
                      '/payment',
                      arguments: {
                        'cartItems': cartItems,
                        'totalPrice': totalPrice,
                      },
                    );
                  },
                  child: Text('Proceed to Checkout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: EdgeInsets.symmetric(vertical: 14),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Map<String, dynamic> item, CartProvider cartProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete ${item['name']} from your cart?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cartProvider.removeFromCart(item);
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
