import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel product=ProductModel(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return product;
  }

// static List<ProductModel> products = [
  //   ProductModel("Product 1", 10.99,
  //       "https://firebasestorage.googleapis.com/v0/b/flutter16firebase2-69980.appspot.com/o/img%201.jpg?alt=media&token=622d00a9-7aac-4096-b778-62ee3fcfc848&_gl=1*1fmxu6t*_ga*NzM2ODU1NTcxLjE2OTUwNDcwMzk.*_ga_CW55HF8NVT*MTY5ODI1MTMzOC4xMC4xLjE2OTgyNTEzOTAuOC4wLjA."),
  //   ProductModel("Product 2", 19.99,
  //       "https://firebasestorage.googleapis.com/v0/b/flutter16firebase2-69980.appspot.com/o/img%203.jpg?alt=media&token=730d1531-bad1-4153-9e9c-e54dda5aeb84&_gl=1*d3fbwd*_ga*NzM2ODU1NTcxLjE2OTUwNDcwMzk.*_ga_CW55HF8NVT*MTY5ODI1MTMzOC4xMC4xLjE2OTgyNTE0MTIuNjAuMC4w"),
  //   ProductModel("Product 3", 5.99,
  //       "https://firebasestorage.googleapis.com/v0/b/flutter16firebase2-69980.appspot.com/o/img%205.jpg?alt=media&token=eaf9eca5-4675-4b3f-ba14-dab6ff23f348&_gl=1*s5ukwq*_ga*NzM2ODU1NTcxLjE2OTUwNDcwMzk.*_ga_CW55HF8NVT*MTY5ODI1MTMzOC4xMC4xLjE2OTgyNTE0MzUuMzcuMC4w"),
  // ];
}
