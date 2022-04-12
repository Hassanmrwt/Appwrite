import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Great Job')),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('Welcome to Home'),
              Icon(Icons.home, size: 100, color: Colors.lightGreen),
            ],
          ),
        ),
      ),
    );
  }
}
