import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RealTimeDbSample extends StatefulWidget {
  const RealTimeDbSample({super.key});

  @override
  State<RealTimeDbSample> createState() => _RealTimeDbSampleState();
}

class _RealTimeDbSampleState extends State<RealTimeDbSample> {
  final _form = GlobalKey<FormState>();
  String? title, note;
  void writeData() async {
    _form.currentState?.save();
    //real time data url + tablename.json
    var url = "https://flutter16firebase2-69980-default-rtdb.firebaseio.com/" +
        "data.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title, "note": note}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real time db sample"),
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    title = value!;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter title", label: Text("Title")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    note = value!;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter note", label: Text("Note")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      writeData();
                    }, child: const Text("Submit")),
              )
            ],
          )),
    );
  }
}
