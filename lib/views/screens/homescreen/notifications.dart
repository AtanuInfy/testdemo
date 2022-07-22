import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Notification Page is On the Way!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
