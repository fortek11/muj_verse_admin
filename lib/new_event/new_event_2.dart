import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/new_event_description_tile.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent2 extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    onSubmitted() {
      final validate = _key.currentState!.validate();
      if (!validate) {
        return;
      }
      dataState.newEventNextPage();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewEventTitleAndDescription(
              title: 'Event Description',
              description:
                  'Clearly articulate the benefits of attending the event and why it is a valuable opportunity, using bullet Points'),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0,
                  spreadRadius: 3)
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _key,
                  child: SizedBox(
                      width: 600,
                      height: (dataState.newEventDescriptionArray.length) * 120,
                      child: ListView.builder(
                          itemCount: dataState.newEventDescriptionArray.length,
                          itemBuilder: (context, index) {
                            print(dataState.newEventDescriptionArray.length);
                            return DescriptionTile(index);
                          })),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      dataState.newEventDescriptionArray.add('');
                      dataState.notifyListeners();
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add Bullet')),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NewEventButtons(onSubmitted),
        ],
      ),
    );
  }
}
