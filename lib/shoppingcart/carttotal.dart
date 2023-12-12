import 'package:flutter/material.dart';
import 'package:flutter16firebase2/shoppingcart/controller/cartcontroller.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final CartController controller=Get.find();
  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 45),
      child: Container(
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Total",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "${controller.total}",
            style: TextStyle(fontSize: 24),
          )
        ]),
      ),
    ));
  }
}
