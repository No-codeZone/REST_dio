import 'dart:html';
import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart';

class avatarUpload extends StatefulWidget {
  const avatarUpload({super.key});

  @override
  State<avatarUpload> createState() => _avatarUploadState();
}

class _avatarUploadState extends State<avatarUpload> {

  late File _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);
    PickedFile pickedFile=(await picker.pickImage(source: ImageSource.gallery)) as PickedFile;

    // imageFile = File(await ImagePicker().pickImage(source: ImageSource.gallery).then((pickedFile) => pickedFile?.path));

    setState(() {
      if (pickedFile != null) {
        // _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    PickedFile filePicked=(await picker.pickImage(source: ImageSource.camera)) as PickedFile;

    setState(() {
      if (filePicked != null) {
        // _image = File(filePicked.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Take Photo'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: showOptions,
            child: Text('Select Image'),
          ),
          Center(
            child: _image==null ? Text('No Image selected') : Image.file(_image as io.File),
          ),
        ],
      ),
    );
  }
}
