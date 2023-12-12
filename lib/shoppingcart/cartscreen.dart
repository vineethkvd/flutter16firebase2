import 'package:flutter/material.dart';

import 'cartproducts.dart';
import 'carttotal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: SafeArea(child:Column(children: [
        CartProducts(),
        CartTotal()
      ],)),
    );
  }
}
