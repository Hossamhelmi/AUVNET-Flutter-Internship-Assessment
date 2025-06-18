import 'package:flutter/material.dart';

class DeliverScreen extends StatelessWidget {
  const DeliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deliver'),
      ),
      body: const Center(
        child: Text('Deliver', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
