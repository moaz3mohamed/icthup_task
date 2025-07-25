import 'package:flutter/material.dart';

// ignore: camel_case_types
class productscreen extends StatelessWidget {
  const productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.production_quantity_limits_outlined, size: 35),
          Center(child: Text('product screen', style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
