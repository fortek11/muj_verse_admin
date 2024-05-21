import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/new_event_timeline_tile.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent4 extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    onSubmitted() {
      final validate = _key.currentState!.validate();
      if (!validate) {
        return;
      }
      for (var i = 0; i < dataState.timelineHashmap.entries.length; i++) {
        if (dataState.timelineHashmap.values.elementAt(i)['timestamp'] ==
            DateTime(2000)) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              content: Text(
                  " Please Select timestamp for the element at index ${i + 1}")));
          return;
        }
      }
      dataState.newEventNextPage();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NewEventTitleAndDescription(
            title: 'Event Timeline',
            description:
                'This feature allows you to chronicle the key moments of your event, providing attendees with a clear understanding of the flow and structure of the event.'),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, blurRadius: 10.0, spreadRadius: 3)
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _key,
                child: SizedBox(
                    width: 600,
                    height: dataState.timelineHashmap.entries.length * 173,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dataState.timelineHashmap.entries.length,
                        itemBuilder: (context, indexx) {
                          print(dataState.timelineHashmap.entries.length);
                          return TimelineTile("${indexx + 1}");
                        })),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton.icon(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.greenAccent),
                  onPressed: () {
                    dataState.timelineHashmap.addAll({
                      "${dataState.timelineHashmap.entries.length + 1}": {
                        'title': '',
                        'subtitle': '',
                        'timestamp': DateTime(2000),
                      }
                    });
                    dataState.notifyListeners();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Bullet')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  dataState.timelineHashmap = {
                    "1": {
                      'title': '',
                      'subtitle': '',
                      'timestamp': DateTime(2000),
                    }
                  };
                  dataState.notifyListeners();
                },
                icon: Icon(Icons.refresh),
                label: Text('erase all'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              ),
            ],
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
