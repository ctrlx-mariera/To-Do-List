import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Homepage'),
        elevation: 2,
      ),
      body: const Center(
        child: Text('My Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/todos'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
