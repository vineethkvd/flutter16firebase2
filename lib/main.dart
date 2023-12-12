import 'package:flutter/material.dart';
import 'package:flutter16firebase2/payments/payments.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test UPI',
      home: PaymentTest(),
    );
  }
}
