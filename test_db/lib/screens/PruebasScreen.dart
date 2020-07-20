import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PruebasScreen extends StatelessWidget {
  File _image;
  static const routeName = '/pruebasScreen';
  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    Future getImage() async {
      final image = await picker.getImage(source: ImageSource.camera);
      _image = File(image.path);
    }

    Future uploadPic(BuildContext context) async {
      String fileName = "/img/cosa";
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      
        print("Profile picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Profile picture uploaded")));
      
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cosa'),
      ),
      body: Builder(
          builder: (context) => Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: SizedBox(
                            child: (_image != null)
                                ? Image.file(_image, fit: BoxFit.fill)
                                : Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/labapp-8eeb7.appspot.com/o/img%2Flogo-standard.png?alt=media&token=83ed529f-6f0a-476e-b7c9-7f6ebbaa3b2d",
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                    RaisedButton(onPressed: (){
                      uploadPic(context);
                    },
                    child: Text("Submit"),)
                  ],
                ),
              )),
    );
  }
}
