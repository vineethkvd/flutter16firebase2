import 'package:flutter16firebase2/shoppingcart/model/productmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  //add a dictionary to store the products in the cart
  var _products = {}.obs;
  // create addproduct function
  void addProducts(ProductModel products) {
    if (_products.containsKey(products)) {
      _products[products] += 1;
    } else {
      _products[products] = 1;
    }
    Get.snackbar("product added", "You are added the ${products.name}",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

// remove addproduct function
  void removeProducts(ProductModel products) {
    if (_products.containsKey(products) && _products[products] == 1) {
      _products.removeWhere((key, value) => key == products);
    } else {
      _products[products] -= 1;
    }
  }

//get products
  get products => _products;

//get productssubtotal
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();
//get total
  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);
}
