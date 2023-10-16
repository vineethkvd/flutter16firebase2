// //not working
// // mport 'dart:io';
// //
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:permission_handler/permission_handler.dart';
// //
// // class FileUploadSample extends StatefulWidget {
// //   const FileUploadSample({super.key});
// //
// //   @override
// //   State<FileUploadSample> createState() => _FileUploadSampleState();
// // }
// //
// // class _FileUploadSampleState extends State<FileUploadSample> {
// //   String? imageUrl;
// //   uploadImage() async {
// //     final _firebaseStorage = FirebaseStorage.instance;
// //     final _imagePicker = ImagePicker();
// //     PickedFile image;
// //     //Check Permissions
// //     await Permission.photos.request();
// //
// //     var permissionStatus = await Permission.photos.status;
// //
// //     if (permissionStatus.isGranted) {
// //       //Select Image
// //       final XFile? testImage = await _imagePicker.pickImage(source: ImageSource.gallery);
// //       var file = File(testImage!.path);
// //       if (testImage != null) {
// //         var snapshot = await _firebaseStorage.ref()
// //             .child('images/imageName')
// //             .putFile(file)
// //             .whenComplete(() => null);
// //
// //         String url = (await snapshot.ref.getDownloadURL()).toString();
// //         setState(() {
// //           imageUrl = url;
// //         });
// //       }
// //       else{
// //         print('No Image Path Received');
// //
// //       }
// //     } else {
// //       print('Permission not granted. Try Again with permission access');
// //
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.teal,
// //         centerTitle: true,
// //         title: Text("File Upload"),
// //       ),
// //       body: Container(
// //         color: Colors.white,
// //         child: Column(
// //           children: [
// //             Container(
// //                 margin: EdgeInsets.all(15),
// //                 padding: EdgeInsets.all(15),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.all(
// //                     Radius.circular(15),
// //                   ),
// //                   border: Border.all(color: Colors.white),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black12,
// //                       offset: Offset(2, 2),
// //                       spreadRadius: 2,
// //                       blurRadius: 1,
// //                     ),
// //                   ],
// //                 ),
// //                 child: (imageUrl != null)
// //                     ? Image.network(imageUrl!)
// //                     : Image.network('https://i.imgur.com/sUFH1Aq.png')),
// //             ElevatedButton(
// //                 onPressed: () {
// //                   uploadImage();
// //                 },
// //                 child: Text("Upload file"))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //working code
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PermissionHandler extends StatefulWidget {
//   const PermissionHandler({Key? key}) : super(key: key);
//
//   @override
//   State<PermissionHandler> createState() => _PermissionHandlerState();
// }
//
// class _PermissionHandlerState extends State<PermissionHandler> {
//   bool? permissionGranted;
//   String? imageUrl;
//   List<UploadTask> _uploadTasks = [];
//   final _firebaseStorage = FirebaseStorage.instance;
//
//   _getFromGallery() async {
//     try {
//       XFile? pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 1800,
//         maxHeight: 1800,
//       );
//       if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
//         // You can use the 'imageFile' here for further processing or display.
//         UploadTask uploadTask =
//         _firebaseStorage.ref().child('images/imageName').putFile(imageFile);
//
//         TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           imageUrl = downloadUrl;
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Permission handler'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _getFromGallery();
//             },
//             child: Text('Request Storage Permission'),
//           ),
//           (imageUrl != null)
//               ? Image.network(imageUrl!)
//               : Image.network('https://i.imgur.com/sUFH1Aq.png')
//         ],
//       ),
//     );
//   }
// }
//
