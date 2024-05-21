import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent1v2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    bool isEventDateUpdated = dataState.newEventDate != null;
    bool isEvenLDORupdated = dataState.newEventLDOR != null;
    onSubmitted() {
      if (!isEvenLDORupdated) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please Select Last Date and Time of Reg.')));
        return;
      }
      if (!isEventDateUpdated) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please Select Date of Event')));
        return;
      }
      dataState.newEventNextPage();
    }

    return Column(
      children: [
        NewEventTitleAndDescription(
          title: 'Important Dates',
          description:
              'Select Date of Event and Last Date and Time of registration. This input would be directly injected into the app so please fill the correct details',
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 50)))
                .then((value) {
              dataState.newEventDate = value;
              dataState.notifyListeners();
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 450,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: isEventDateUpdated
                    ? Border.all(
                        color: const Color.fromARGB(200, 29, 34, 40),
                        width: 1.5)
                    : Border.all(color: Colors.grey.shade500)),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color:
                      isEventDateUpdated ? Colors.black : Colors.grey.shade600,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  isEventDateUpdated
                      ? DateFormat.yMMMd().format(dataState.newEventDate!)
                      : 'Date of Event',
                  style: TextStyle(
                    color: isEventDateUpdated
                        ? const Color.fromARGB(255, 29, 34, 40)
                        : Colors.grey.shade600,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () async {
            await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 50)))
                .then((value) {
              if (value == null) {
                return;
              }
              dataState.newEventLDOR = value;
            });

            await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 18, minute: 00))
                .then((value) {
              if (value == null) {
                return;
              }
              dataState.newEventLDOR = DateTime(
                dataState.newEventLDOR!.year,
                dataState.newEventLDOR!.month,
                dataState.newEventLDOR!.day,
                value.hour,
                value.minute,
              );
              print(dataState.newEventLDOR);

              dataState.notifyListeners();
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 450,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: isEvenLDORupdated
                    ? Border.all(
                        color: const Color.fromARGB(200, 29, 34, 40),
                        width: 1.5)
                    : Border.all(color: Colors.grey.shade500)),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  color:
                      isEvenLDORupdated ? Colors.black : Colors.grey.shade600,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  isEvenLDORupdated
                      ? '${DateFormat.yMMMd().format(dataState.newEventLDOR!)} - ${DateFormat.jmv().format(dataState.newEventLDOR!)}'
                      : 'Last Date and Time of Registration',
                  style: TextStyle(
                    color: isEvenLDORupdated
                        ? const Color.fromARGB(255, 29, 34, 40)
                        : Colors.grey.shade600,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        NewEventButtons(onSubmitted),
      ],
    );
  }
}
