import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RealtimeDbRead extends StatefulWidget {
  const RealtimeDbRead({super.key});

  @override
  State<RealtimeDbRead> createState() => _RealtimeDbReadState();
}

class _RealtimeDbReadState extends State<RealtimeDbRead> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> titlelist = [];
  List<String> notelist = [];
  Future<void> readData() async {
    //real time data url + tablename.json
    var url = "https://flutter16firebase2-69980-default-rtdb.firebaseio.com/" +
        "data.json";
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        titlelist.add(blogData["title"]);
        notelist.add(blogData["note"]);
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
      appBar: AppBar(title: Text("real time db read")),
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
        itemCount: titlelist.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text(titlelist[index]),
                      subtitle: Text(notelist[index]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
