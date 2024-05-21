import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class PickImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    Future<void> pickImage() async {
      try {
        // Pick image using ImagePicker
        dataState.pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );

        if (dataState.pickedImage != null) {
          // Get image file bytes

          dataState.bytes = await dataState.pickedImage!.readAsBytes();

          if (dataState.bytes!.lengthInBytes > 1 * 1024 * 1024) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Image is too large (above 1MB)."),
              backgroundColor: const Color.fromARGB(255, 150, 18, 9),
            ));
            // Display a user-friendly message, e.g., using a Flutter dialog
            return; // Discard the image
          }
          dataState.toogleImagePickedTo(true);
        }
      } catch (error) {
        print('Error picking image: $error');
      }
    }

    return Container(
      width: 500,
      height: 250,
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
          const Icon(
            Icons.cloud_upload_outlined,
            size: 65,
            color: Color.fromARGB(255, 68, 93, 121),
          ),
          TextButton(
              onPressed: () {
                pickImage();
              },
              child: const Text(
                'Click Here to Upload',
                style: TextStyle(
                    color: Color.fromARGB(255, 68, 93, 121),
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Max File Size: 1MB',
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
