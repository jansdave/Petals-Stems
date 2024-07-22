import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Import the BottomNavBar widget
import 'account_settings_screen.dart'; // Import the AccountSettingsScreen
import 'help_support_screen.dart'; // Import the HelpSupportScreen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock user data for demonstration
    final String userName = 'User';
    final String userEmail = 'Information';
    final String userProfilePicUrl = 'https://example.com/profile_pic.jpg'; // Replace with actual URL

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(userProfilePicUrl),
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 16),
            Text(
              userName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              userEmail,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.green[700]),
                title: Text('Account Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.help, color: Colors.green[700]),
                title: Text('Help & Support'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpSupportScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 24), // Add some space before the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700], // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 16), // Add some space after the button
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3), // Ensure BottomNavBar is imported
    );
  }
}
