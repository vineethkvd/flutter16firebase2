import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter16firebase2/firebase_crud_operation/addtask.dart';

class DisplayTask extends StatefulWidget {
  const DisplayTask({super.key});

  @override
  State<DisplayTask> createState() => _DisplayTaskState();
}

class _DisplayTaskState extends State<DisplayTask> {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('tasks');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text("Flutter CRUD Operation"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddTask(),
            ));
          },
          label: Text("Add task"),
          icon: Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: task.orderBy('timestamp').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot taskSnap =
                        snapshot.data!.docs[index];
                    return Card(
                      child: ListTile(
                          title: Text('${taskSnap['content']}'),
                          leading: Text('${taskSnap['timestamp']}')),
                    );
                  });
            }
            return Container();
          },
        ));
  }
}
