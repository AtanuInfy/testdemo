import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Demo Page is On the Way!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
