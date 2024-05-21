import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent3 extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    String? tagsCompleteString = dataState.newEventsTagsArray != null
        ? dataState.newEventsTagsArray!.join(',')
        : '';
    onSubmitted() {
      print(tagsCompleteString);
      final validate = _key.currentState!.validate();
      if (!validate) {
        return;
      }
      List<String> tags = tagsCompleteString!.split(",");
      dataState.newEventsTagsArray = tags;
      dataState.newEventNextPage();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NewEventTitleAndDescription(
            title: 'Tags',
            description:
                'By incorporating relevant tags, you ensure that your events are discoverable to the right audience, maximizing attendance and engagement.'),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            width: 700,
            child: Form(
                key: _key,
                child: TextFormField(
                  initialValue: dataState.newEventsTagsArray != null
                      ? dataState.newEventsTagsArray!.join(",")
                      : '',
                  onChanged: (value) {
                    tagsCompleteString = value;
                  },
                  validator: (value) {
                    if (tagsCompleteString == null) {
                      return "Value cannot be null";
                    }
                    if (tagsCompleteString == '') {
                      return "Value cannot be empty";
                    }
                    // Split the input into words
                    List<String> words = tagsCompleteString!.split(",");

                    // Check if the input has exactly 3 words
                    if (words.length < 3) {
                      return "Minimum 3 tags are allowed"; // invalid input
                    }
                  },
                  onFieldSubmitted: (value) {
                    tagsCompleteString = value;
                  },
                  onSaved: (newValue) {
                    tagsCompleteString = newValue;
                  },
                  maxLines: 1,
                ))),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 650,
          child: Text(
            'Use "," between the tags',
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            maxLines: 4,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        NewEventButtons(onSubmitted),
      ],
    );
  }
}
