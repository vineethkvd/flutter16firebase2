import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter16firebase2/screens/loginpage.dart';
import 'package:flutter16firebase2/screens/realtime_database/realtimedbread.dart';
import 'package:flutter16firebase2/screens/realtime_database/realtimedbwrite.dart';
import 'package:flutter16firebase2/screens/registrationform/adduser.dart';

import 'firebase_crud_operation/displaytask.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DisplayTask(),
    );
  }
}
