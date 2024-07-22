import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart'; // Import the CartProvider
import 'notification_provider.dart'; // Import the NotificationProvider
import 'home.dart';
import 'shop.dart';
import 'cart.dart';
import 'profile.dart';
import 'login.dart';
import 'signup.dart';
import 'payment_screen.dart'; // Import the PaymentScreen
import 'history_screen.dart'; // Import the HistoryScreen

void main() {
  runApp(PetalAndStemsApp());
}

class PetalAndStemsApp extends StatelessWidget {
  const PetalAndStemsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()), // CartProvider
        ChangeNotifierProvider(create: (context) => NotificationProvider()), // NotificationProvider
      ],
      child: MaterialApp(
        title: 'Petal & Stems',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/shop': (context) => ShopScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => ProfileScreen(),
          '/signup': (context) => SignupScreen(),
          '/payment': (context) => PaymentScreen(), // Add route for PaymentScreen
          '/history': (context) => HistoryScreen(), // Add route for HistoryScreen
        },
      ),
    );
  }
}
