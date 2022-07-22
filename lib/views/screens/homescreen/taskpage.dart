import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Task Page is On the Way!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
