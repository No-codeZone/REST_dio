// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class BackgroundImg extends StatefulWidget {
//   const BackgroundImg({super.key});
//
//   @override
//   State<BackgroundImg> createState() => _BackgroundImgState();
// }
//
// class _BackgroundImgState extends State<BackgroundImg> {
//   late File _image;
//   ImagePicker picker=ImagePicker();
//
//   Future _getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//
//         print('_image: $_image');
//       } else {
//         print('No image selected');
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//         decoration: BoxDecoration(
//         image: DecorationImage(
//         image: Image(_image),
//     ),
//     );
//   }
// }
