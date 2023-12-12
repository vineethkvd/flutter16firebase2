import 'package:flutter16firebase2/shoppingcart/firebaseDb/firestoredb.dart';
import 'package:flutter16firebase2/shoppingcart/model/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final products=<ProductModel>[].obs;
  @override
  void onInit() {
    products.bindStream(FireStoreDB().getAllProducts());
    // TODO: implement onInit
    super.onInit();
  }
}