import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var name, phone, email, password;
  final _form = GlobalKey<FormState>();
  var url = "https://flutter16firebase2-69980-default-rtdb.firebaseio.com/" +
      "registration.json";
  bool isLoading = true;
  List<String> namelist = [];
  List<String> emaillist = [];
  List<String> phonellist = [];
  void writeData() async {
    _form.currentState?.save();
    //real time data url + tablename.json

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "name": name,
          "email": email,
          "passwortd": password,
          "phone": phone
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  void readData() async {
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        namelist.add(blogData["name"]);
        emaillist.add(blogData["email"]);
        phonellist.add(blogData["phone"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Container(
          child: Form(
              key: _form,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Registration"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter name", label: Text("Name")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter email", label: Text("Email")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        phone = value!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter phone number", label: Text("Phone")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter password", label: Text("password")),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              writeData();
                            },
                            child: const Text("Submit")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              readData();
                            },
                            child: const Text("Display")),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Registred user details"),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: namelist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              trailing: Text("phone number"),
                              title: Text(namelist[index]),
                              subtitle: Text(emaillist[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ))),
    );
  }
}
