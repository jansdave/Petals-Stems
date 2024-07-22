import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'bottom_nav_bar.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<Map<String, dynamic>> _flowerTypes = [
    {'name': 'Rose', 'description': 'A beautiful red flower.', 'price': 100.0},
    {'name': 'Tulip', 'description': 'A lovely spring flower.', 'price': 75.0},
    {'name': 'Sunflower', 'description': 'A bright yellow flower.', 'price': 50.0},
    {'name': 'Lily', 'description': 'An elegant white flower.', 'price': 125.0},
    {'name': 'Orchid', 'description': 'An exotic flower.', 'price': 150.0},
    {'name': 'Daisy', 'description': 'A simple yet charming flower.', 'price': 25.0},
    {'name': 'Carnation', 'description': 'A popular flower for bouquets.', 'price': 50.0},
    {'name': 'Peony', 'description': 'A fragrant pink flower.', 'price': 100.0},
    {'name': 'Hydrangea', 'description': 'A lush blue flower.', 'price': 125.0},
  ];

  void _showFlowerDetails(Map<String, dynamic> flower) {
    int quantity = 1;
    String selectedColor = 'None';
    String selectedWrap = 'None';
    String additionalNotes = '';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(flower['name']),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(flower['description']),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price: ₱${flower['price'].toStringAsFixed(2)}'),
                    Text('Total: ₱${(flower['price'] * quantity).toStringAsFixed(2)}'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text('Quantity: $quantity'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: selectedColor,
                  hint: Text('Select Color'),
                  items: <String>['None', 'Red', 'Pink', 'Yellow', 'White', 'Blue'].map((String color) {
                    return DropdownMenuItem<String>(
                      value: color,
                      child: Text(color),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedColor = value!;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: selectedWrap,
                  hint: Text('Select Wrap'),
                  items: <String>['None', 'Paper', 'Fabric'].map((String wrap) {
                    return DropdownMenuItem<String>(
                      value: wrap,
                      child: Text(wrap),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedWrap = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Additional Notes',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      additionalNotes = value;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  double price = flower['price'] is double
                      ? flower['price']
                      : double.tryParse(flower['price'].toString()) ?? 0.0;

                  Provider.of<CartProvider>(context, listen: false).addToCart(
                    flower['name'] as String,
                    price,
                    quantity,
                    selectedColor,
                    selectedWrap,
                    additionalNotes,
                  );
                  Navigator.of(context).pop();
                },
                child: Text('Add to Cart'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Available Flowers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[700]),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: _flowerTypes.length,
                itemBuilder: (context, index) {
                  final flower = _flowerTypes[index];
                  return GestureDetector(
                    onTap: () {
                      _showFlowerDetails(flower);
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Removed image display
                            Icon(Icons.local_florist, size: 50, color: Colors.green[700]),
                            SizedBox(height: 10),
                            Text(flower['name'], style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
