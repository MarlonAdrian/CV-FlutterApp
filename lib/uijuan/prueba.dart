import 'package:flutter/material.dart';

class prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material app bar'),
      ),
      body: const Center(child: Text('Hola mundo')),
    );
  }
}
