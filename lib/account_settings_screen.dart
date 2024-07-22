// account_settings_screen.dart
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Profile Section
            ListTile(
              leading: Icon(Icons.person, color: Colors.green[700]),
              title: Text('Profile Information'),
              subtitle: Text('Edit your personal details'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to profile information screen
              },
            ),
            Divider(),

            // Email Section
            ListTile(
              leading: Icon(Icons.email, color: Colors.green[700]),
              title: Text('Email Address'),
              subtitle: Text('Change your email address'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to email change screen
              },
            ),
            Divider(),

            // Password Section
            ListTile(
              leading: Icon(Icons.lock, color: Colors.green[700]),
              title: Text('Change Password'),
              subtitle: Text('Update your password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to password change screen
              },
            ),
            Divider(),

            // Notifications Section
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.green[700]),
              title: Text('Notifications'),
              subtitle: Text('Manage notification settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to notification settings screen
              },
            ),
            Divider(),

            // Privacy Section
            ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.green[700]),
              title: Text('Privacy Settings'),
              subtitle: Text('Update your privacy settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to privacy settings screen
              },
            ),
            Divider(),

            // Logout Section
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 248, 206, 206), // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
