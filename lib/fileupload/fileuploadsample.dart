import 'package:flutter/material.dart';

class FileUploadSample extends StatefulWidget {
  const FileUploadSample({super.key});

  @override
  State<FileUploadSample> createState() => _FileUploadSampleState();
}

class _FileUploadSampleState extends State<FileUploadSample> {
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("File Upload"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: (imageUrl != null)
                    ? Image.network(imageUrl!)
                    : Image.network('https://i.imgur.com/sUFH1Aq.png')
            ),
          ],
        ),
      ),
    );
  }
}
