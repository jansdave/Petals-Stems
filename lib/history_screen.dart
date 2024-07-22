import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification History'),
        backgroundColor: Colors.green[700],
      ),
      body: notificationProvider.notifications.isEmpty
          ? Center(child: Text('No notifications yet'))
          : ListView.builder(
              itemCount: notificationProvider.notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.notifications, color: Colors.green[700]),
                  title: Text(notificationProvider.notifications[index]),
                );
              },
            ),
    );
  }
}
