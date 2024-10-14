import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'AlertDialog.dart';
import 'bottom_picker_sheet.dart';

class AvatarUploader extends StatefulWidget {
  @override
  _AvatarUploaderState createState() => _AvatarUploaderState();
}

class _AvatarUploaderState extends State<AvatarUploader> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  // File? _image= AssetImage('assets/images/avatar.png') as File?;
  bool uploadStatus = false;

  Future<File> _imageFromCamera() async {
    debugPrint('image from cam is here !');
    final PickedFile pickedImage =
        (await _picker.pickImage(source: ImageSource.camera, imageQuality: 50)) as PickedFile;
    // if (pickedImage == null) {
    //   showAlertDialog(
    //       context: context,
    //       title: "Error Uploading!",
    //       content: "No Image was selected.");
    //   return;
    // }
    final File fileImage = File(pickedImage.path);
    _imageToBase64(fileImage.path);
    /*if (imageConstraint(fileImage)) {
      debugPrint(
          'File type is (test 1) ${fileImage.path.split('.').last.toString()}');
      setState(() {
        _image = fileImage as XFile?;
      });
    }*/
    setState(() {
      _image = fileImage;
      debugPrint('Selected file from cam is here\t${_image.toString()}');
    });
    return fileImage;
  }



  Future<File> _imageFromGallery() async {
    debugPrint('image from galry is here !');
    final XFile pickedImage = (await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50)) as XFile;
    // if (pickedImage == null) {
    //   showAlertDialog(
    //       context: context,
    //       title: "Error Uploading!",
    //       content: "No Image was selected.");
    //   return;
    // }
    final File fileImage = File(pickedImage.path);
    _imageToBase64(fileImage.path);
    /*if (imageConstraint(fileImage)) {
      debugPrint(
          'File type is (test 2) ${fileImage.path.split('.').last.toString()}');
      setState(() {
        _image = fileImage as XFile?;
      });
    }*/
    setState(() {
      // final File _image = fileImage;
      _image = fileImage;
      debugPrint('Selected file from gal is here\t${_image?.path.split('.').toString()}');
    });
    return fileImage;
  }

  Future<void> _imageToBase64(String imgPath) async {

    final bytes = File(imgPath).readAsBytesSync();

    String img64 = base64Encode(bytes);
    if (kDebugMode) {
      print(
          "ImagePath=$imgPath\n Base64=${img64.substring(hashCode.bitLength)}");
    }
    // throw UnimplementedError('readAsBytes() has not been implemented.');
  }


  /*bool imageConstraint(File image) {
    if (!['bmp', 'jpg', 'jpeg','png']
        .contains(image.path.split('.').last.toString())) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image format should be jpg/jpeg/bmp.");
      return false;
    }
    if (image.lengthSync() > 100000) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image Size should be less than 100KB.");
      return false;
    }
    return true;
  }*/

  // uploadImage() async {
  //   if (_image == null) {
  //     showAlertDialog(
  //         context: context,
  //         title: "Error Uploading!",
  //         content: "No Image was selected.");
  //     return;
  //   }
  //
  //   setState(() {
  //     uploadStatus = true;
  //   });
  //   var response = await http
  //       .post(Uri.parse('https://pcc.edu.pk/ws/file_upload.php'), body: {
  //     "image": _image?.readAsBytes().toString(),
  //     "name": _image?.path.split('/').last.toString()
  //   });
  //   print('response');
  //   if (response.statusCode != 200) {
  //     showAlertDialog(
  //         context: context,
  //         title: "Error Uploading!",
  //         content: "Server Side Error.");
  //   } else {
  //     var result = jsonDecode(response.body);
  //     print(result);
  //     showAlertDialog(
  //         context: context, title: "Image Sent!", content: result['message']);
  //   }
  //   setState(() {
  //     uploadStatus = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: uploadStatus
              ? const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 7,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('Button pressed');
                          bottomPickerSheet(
                              context, _imageFromCamera, _imageFromGallery);
                        },
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6,
                          backgroundColor: Colors.white,
                          backgroundImage: _image != null
                              ?
                          // Image.file(File(_image!.path)).image :
                          // Image.asset('assets/images/avatar.png').image,
                          FileImage(_image as File)
                              : const AssetImage('assets/images/avatar.png')
                                  as ImageProvider,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ElevatedButton(
                      //   onPressed: uploadImage,
                      //   child: const Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Icon(Icons.file_upload),
                      //         Text(
                      //           'Upload Image',
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
