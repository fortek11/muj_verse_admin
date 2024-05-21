import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/new_event_prize_tile.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent5 extends StatelessWidget {
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

    return Column(
      children: [
        NewEventTitleAndDescription(
          title: 'Event Perks and Prizes',
          description:
              'Attract attendees and boost engagement for your Muj-Verse event by offering enticing perks and prizes.',
        ),
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
                    height: dataState.newEventPerksMap.entries.length * 110,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dataState.newEventPerksMap.entries.length,
                        itemBuilder: (context, indexx) {
                          return PerksAndPrizeTile(indexx);
                        })),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton.icon(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.greenAccent),
                  onPressed: () {
                    dataState.newEventPerksMap.addAll({
                      "${dataState.newEventPerksMap.entries.length + 1}": {
                        'position': '',
                        'prize': ''
                      }
                    });
                    print(dataState.newEventPerksMap.entries);
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
    );
  }
}
