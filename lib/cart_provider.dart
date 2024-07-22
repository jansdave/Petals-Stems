import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(String name, double price, int quantity, String color, String wrap, String notes) {
    _cartItems.add({
      'name': name,
      'price': price,
      'quantity': quantity,
      'color': color,
      'wrap': wrap,
      'notes': notes,
    });
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  // New method to clear the cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
