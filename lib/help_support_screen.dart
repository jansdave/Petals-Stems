// help_support_screen.dart
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help & Support',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // FAQ Section
            Text(
              'Frequently Asked Questions (FAQS!)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.green[700]),
              title: Text('How do I reset my password?'),
              subtitle: Text('Follow these steps to reset your password.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to a detailed FAQ screen or show a dialog
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.green[700]),
              title: Text('How can I update my profile information?'),
              subtitle: Text('Steps to update your profile information.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to a detailed FAQ screen or show a dialog
              },
            ),
            Divider(),

            // Contact Support Section
            SizedBox(height: 16),
            Text(
              'Contact Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green[700]),
              title: Text('Call Us!'),
              subtitle: Text('0916-938-1747'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle phone call action
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green[700]),
              title: Text('Email Us'),
              subtitle: Text('21-01483@g.batstate-u.edu.ph 21-04399@g.batstate-u.edu.ph 21-05474@g.batstate-u.edu.ph 21-06793@g.batstate-u.edu.ph  '),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle email action
              },
            ),
            Divider(),

            // Useful Links Section
            SizedBox(height: 16),
            Text(
              'Useful Links',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.web, color: Colors.green[700]),
              title: Text('Visit our Website'),
              subtitle: Text('https://github.com/jansdave'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Open the website
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.green[700]),
              title: Text('Submit Feedback'),
              subtitle: Text('Help us improve by providing feedback.'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to feedback submission screen
              },
            ),
            Divider(),

            // Additional Information Section
            SizedBox(height: 16),
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'For any further queries, please refer to our detailed help documentation or contact our support team.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
