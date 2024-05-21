import 'package:flutter/material.dart';

class NewEventTitleAndDescription extends StatelessWidget {
  final String title;
  final String description;
  NewEventTitleAndDescription({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.grey.shade900),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 600,
          child: Text(
            description,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
            maxLines: 4,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
