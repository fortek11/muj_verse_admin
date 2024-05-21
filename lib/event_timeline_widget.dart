import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTimelineWidget extends StatelessWidget {
  final Map<String, dynamic> timelineData;
  EventTimelineWidget(this.timelineData);

  Widget build(BuildContext context) {
    return Column(
      children: timelineData.entries.map((e) {
        final eachTimelineData = e.value as Map<String, dynamic>;
        final DateTime timestamp = eachTimelineData['timestamp'].toDate();

        return Stack(
          children: [
            const Positioned(
                left: 89,
                child: DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  lineLength: 70,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.MMMd().format(timestamp),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          DateFormat.jmv().format(timestamp),
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 10,
                    child: Icon(
                      Icons.circle_outlined,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eachTimelineData['title'],
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${eachTimelineData['subtitle']}',
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
