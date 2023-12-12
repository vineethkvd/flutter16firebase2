import 'package:flutter/material.dart';
import 'package:flutter16firebase2/shoppingcart/cartscreen.dart';
import 'package:flutter16firebase2/shoppingcart/carttotal.dart';
import 'package:flutter16firebase2/shoppingcart/catalogproducts.dart';
import 'package:get/get.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CatalogProducts(),
          ElevatedButton(
            onPressed: () => Get.to(() => CartScreen()),
            child: Text("Go to Cart"),
          )
        ],
      )),
    );
  }
}
