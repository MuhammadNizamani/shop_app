import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myshop"),
      ),
      body: Center(child: Text('Let\'s build a shop!')),
    );
  }
}
