import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class DialogFb1 extends StatelessWidget {
  const DialogFb1({Key? key}) : super(key: key);
  final primaryColor = const Color.fromARGB(255, 33, 45, 61);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);

    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1)),
              ]),
          child: !dataState.isUploading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 25,
                        child: Icon(
                          Icons.question_mark,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("How are you doing?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 3.5,
                    ),
                    const Text("This is a sub text, use it to clarify",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SimpleBtn1(
                          text: "Cancel",
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          invertedColors: true,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SimpleBtn1(
                          text: "Upload",
                          onPressed: () {
                            dataState.submitOnServer(context);
                          },
                        ),
                      ],
                    )
                  ],
                )
              : dataState.isUploading == true && dataState.isUploaded == false
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Text('Uploaded!'),
                    )),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  const SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = const Color.fromARGB(255, 33, 45, 61);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
