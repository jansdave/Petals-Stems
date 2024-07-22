import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  List<String> _notifications = [];

  List<String> get notifications => _notifications;

  void addNotification(String notification) {
    _notifications.add(notification);
    notifyListeners();
  }
}
