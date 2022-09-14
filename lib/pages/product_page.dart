import 'package:flutter/material.dart';

import '../const.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Products",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          "Product",
          style: myTextStyle(26, Colors.teal),
        ),
      ),
    );
  }
}
