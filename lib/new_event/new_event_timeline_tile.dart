import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class TimelineTile extends StatelessWidget {
  final String index;
  String? title;
  String? subtitle;

  TimelineTile(this.index);

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    final timelineData = dataState.timelineHashmap.entries
        .firstWhere((element) => element.key == index);
    bool istTimelineUpdated =
        timelineData.value['timestamp'] == DateTime(2000) ? false : true;

    return Container(
      width: 600,
      height: 168,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(maxRadius: 15, child: Text('${index}')),
              SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 50)))
                      .then((value) {
                    if (value == null) {
                      return;
                    }
                    timelineData.value['timestamp'] = value;
                    print(timelineData.value['timestamp']);
                    showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 18, minute: 00))
                        .then((value) {
                      if (value == null) {
                        return;
                      }
                      timelineData.value['timestamp'] = DateTime(
                        timelineData.value['timestamp'].year,
                        timelineData.value['timestamp'].month,
                        timelineData.value['timestamp'].day,
                        value.hour,
                        value.minute,
                      );
                      print(timelineData.value['timestamp']);

                      dataState.notifyListeners();
                    });
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 450,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: istTimelineUpdated
                          ? Border.all(
                              color: Color.fromARGB(200, 29, 34, 40),
                              width: 1.5)
                          : Border.all(color: Colors.grey.shade500)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: istTimelineUpdated
                            ? Colors.black
                            : Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        istTimelineUpdated
                            ? '${DateFormat.yMMMd().format(timelineData.value['timestamp']!)} - ${DateFormat.jmv().format(timelineData.value['timestamp']!)}'
                            : 'TimeStamp for Round ${index}',
                        style: TextStyle(
                          color: istTimelineUpdated
                              ? Color.fromARGB(255, 29, 34, 40)
                              : Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 550,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        onChanged: (value) {
                          timelineData.value['title'] = value;
                        },
                        onSaved: (newValue) {
                          timelineData.value['title'] = newValue;
                        },
                        onFieldSubmitted: (value) {
                          timelineData.value['title'] = value;
                        },
                        validator: (value) {
                          if (timelineData.value['title'] == null) {
                            return "Title Field cannot be empty";
                          }
                          if (timelineData.value['title'] == '') {
                            return "Title Field cannot be empty";
                          }
                        },
                        maxLines: 1,
                        initialValue: timelineData.value['title'] ?? '',
                        decoration: InputDecoration(
                            hintText: ' Round ${index}',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 410,
                      child: TextFormField(
                        initialValue: timelineData.value['subtitle'] ?? '',
                        onChanged: (value) {
                          timelineData.value['subtitle'] = value;
                        },
                        onSaved: (newValue) {
                          timelineData.value['subtitle'] = newValue;
                        },
                        onFieldSubmitted: (value) {
                          timelineData.value['subtitle'] = value;
                        },
                        validator: (value) {
                          if (timelineData.value['subtitle'] == null) {
                            return "Subtitle Field cannot be empty";
                          }
                          if (timelineData.value['subtitle'] == '') {
                            return "Subtitle Field cannot be empty";
                          }
                          if (timelineData.value['subtitle'].length < 5) {
                            return "Subtitle cannot be less then 5 characters";
                          }
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: 'Subtitle Here',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            endIndent: 150,
            indent: 150,
          )
        ],
      ),
    );
  }
}
