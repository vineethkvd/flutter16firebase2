import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/cartcontroller.dart';
import 'model/productmodel.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          return CartProductCard(
            controller: controller,
            product: controller.products.keys.toList()[index],
            quantity: controller.products.values.toList()[index],
            index: index,
          );
        },
      ),
    ));
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final ProductModel product;
  final int quantity;
  final int index;
  CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name)),
          IconButton(
              onPressed: () {
                controller.removeProducts(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text("${quantity}"),
          IconButton(onPressed: () {
            controller.addProducts(product);
          }, icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
