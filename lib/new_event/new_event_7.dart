import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/pick_image_widget.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';
import 'package:try_flutter_web/new_event/upload_image_widget.dart';

class NewEvent7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    bool isImagePicked = dataState.isImagePicked;

    onSubmitted() {}
    return Column(
      children: [
        NewEventTitleAndDescription(
            title: 'Upload a Stellar Image for your Event',
            description:
                'A picture is worth a thousand words, and in the case of your, it could mean a thousand excited attendees!'),
        const SizedBox(height: 30),
        !isImagePicked ? PickImageWidget() : UploadImageWidget(),
        SizedBox(
          height: 30,
        ),
        NewEventButtons(onSubmitted),
      ],
    );
  }
}
