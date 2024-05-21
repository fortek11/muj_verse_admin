import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DataState with ChangeNotifier {
  Map<String, dynamic> clubdata = {};
  Map<String, dynamic> eventsData = {};
  int newEventpageIndex = 0;
  PageController newEventPageController = PageController(initialPage: 0);
  DateTime? newEventDate;
  DateTime? newEventLDOR;
  newEventNextPage() {
    newEventPageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut);
    notifyListeners();
  }

  newEventPrevPage() {
    newEventPageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeInOutSine);
  }

  List<String> newEventDescriptionArray = [
    '',
  ];
  Map<String, dynamic> newEventPerksMap = {
    "1": {'position': '', 'prize': ''}
  };
  Map<String, dynamic> timelineHashmap = {
    "1": {
      'title': '',
      'subtitle': '',
      'timestamp': DateTime(2000),
    }
  };
  Map<String, dynamic> contactsHashMap = {
    "1": {
      'name': '',
      'number': '',
    },
    "2": {
      'name': '',
      'number': '',
    }
  };

  String? newEventTitle;
  String? newEventPrice;
  String? newEventLocation;
  List<String>? newEventsTagsArray;
  bool isImagePicked = false;
  toogleImagePickedTo(bool value) {
    isImagePicked = value;
    notifyListeners();
  }

  String? newEventImageURL;
  bool isUploading = false;
  bool isUploaded = false;
  toogleIsUploadingTo(bool value) {
    isUploading = value;
    notifyListeners();
  }

  XFile? pickedImage;
  Uint8List? bytes;
  resetImage() {
    pickedImage = null;
    bytes = null;
    isImagePicked = false;
    notifyListeners();
  }

  uploadImage(BuildContext context) async {
    try {
      // Create a reference to the Firebase Storage location
      final storageRef =
          FirebaseStorage.instance.ref().child('${newEventTitle}');

      // Upload image to Firebase Storage
      final uploadTask = storageRef.putData(bytes!);

      //  Get download URL after upload completes
      final downloadURL = await (await uploadTask).ref.getDownloadURL();
      print('Image uploaded, download URL: $downloadURL');
      newEventImageURL = downloadURL;
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  submitOnServer(BuildContext context) async {
    toogleIsUploadingTo(true);
    uploadImage(context).then((value) async {
      final timelineData = timelineHashmap.entries;

      for (var i = 0; i < timelineData.length; i++) {
        final data = timelineHashmap.entries.elementAt(i).value['timestamp'];
        timelineHashmap.entries.elementAt(i).value['timestamp'] =
            Timestamp.fromDate(data);
      }

      print('timeline map updated');
      print(clubdata);
      print(newEventTitle);
      print(newEventLocation);
      print(newEventPrice);
      print(Timestamp.fromDate(newEventLDOR!));
      print(DateFormat.Md().format(newEventDate!).toString());
      print(newEventsTagsArray);
      print(newEventDescriptionArray);
      print(newEventPerksMap);
      print(newEventImageURL);
      print(timelineHashmap);
      print(contactsHashMap);

      await FirebaseFirestore.instance.collection('upcoming-events').add({
        'title': newEventTitle,
        'club name': clubdata['name'],
        'description': newEventDescriptionArray,
        'location': newEventLocation,
        'price': newEventPrice,
        'interested': 0,
        'tags': newEventsTagsArray,
        'timeline': timelineHashmap,
        'prize': newEventPerksMap,
        'date': Timestamp.fromDate(newEventDate!),
        'ldor': Timestamp.fromDate(newEventLDOR!),
        'image': newEventImageURL,
        'category': "Test",
        'contact': contactsHashMap,
      }).then((value) {
        print('uploaded');
        List<dynamic> clubEventsArray = clubdata['events'];
        clubEventsArray.add(value.id.toString());
        FirebaseFirestore.instance.collection('clubs').doc('ACM').update({
          'events': clubEventsArray,
        });
        isUploaded = true;
        notifyListeners();
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    });
  }
}
