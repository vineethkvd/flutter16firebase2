import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add products"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          child: Column(
        children: [
          Row(children: [
            Text("Add image :"),
            Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
              child: Text("Image"),
            )
            
          ],)
        ],
      )),
    );
  }
}
