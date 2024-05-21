import 'package:cross_file_image/cross_file_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class UploadImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    Future<void> uploadImage() async {
      try {} catch (error) {
        // Create a reference to the Firebase Storage location
        final storageRef = FirebaseStorage.instance.ref().child('filename.jpg');

        // Upload image to Firebase Storage
        final uploadTask = storageRef.putData(dataState.bytes!);

        //  Get download URL after upload completes
        final downloadURL = await (await uploadTask).ref.getDownloadURL();
        print('Image uploaded, download URL: $downloadURL');
      }
    }

    return Container(
      width: 500,
      height: 378,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 80, 108, 141).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: const Color.fromARGB(255, 75, 99, 130).withOpacity(0.5),
              width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
            child: Image(
              image: XFileImage(dataState.pickedImage!),
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              dataState.resetImage();
            },
            child: Text(
              'Change',
              style: TextStyle(
                  color: Color.fromARGB(255, 68, 93, 121),
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
