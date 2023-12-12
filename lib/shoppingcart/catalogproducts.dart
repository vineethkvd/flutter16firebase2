import 'package:flutter/material.dart';
import 'package:flutter16firebase2/shoppingcart/controller/cartcontroller.dart';
import 'package:flutter16firebase2/shoppingcart/controller/productcontroller.dart';
import 'package:get/get.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());
  CatalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Flexible(
            child: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            return CatalogProductCard(
              index: index,
            );
          },
        )));
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatalogProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                NetworkImage(productController.products[index].imageUrl),
          ),
          Text(productController.products[index].name),
          Text("${productController.products[index].price}"),
          IconButton(
              onPressed: () {
                cartController.addProducts(productController.products[index]);
              },
              icon: Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
