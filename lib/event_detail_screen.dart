import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:try_flutter_web/event_timeline_widget.dart';

class EventDetailScreen extends StatelessWidget {
  final Map<String, dynamic> eventData;
  EventDetailScreen(this.eventData);

  Widget build(BuildContext context) {
    final tagsList = eventData['tags'];
    final Map<String, dynamic> contacts = eventData['contact'];
    final DateTime eventLDOR = eventData['ldor'].toDate();
    final Map<String, dynamic> prizeAndPerks = eventData['prize'];
    final Timestamp eventDatee = eventData['date'];

    final date = eventDatee.toDate();
    final List descriptionArray = eventData['description'];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Event Detail"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventData['title'],
                            style: TextStyle(
                                fontSize: 38, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2 - 100,
                            height: 22,
                            child: ListView.builder(
                                itemCount: tagsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7.5, vertical: 0.5),
                                    margin: EdgeInsets.only(
                                      right: 4,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(tagsList[index].toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600,
                                        )),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Card(
                                color: Color.fromARGB(255, 235, 244, 255),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 90,
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Price'),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        eventData['price'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(255, 235, 244, 255),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 90,
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Location'),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${eventData['location']}',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(255, 235, 244, 255),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 90,
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Contact 1'),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${contacts.entries.elementAt(0).value['name']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${contacts.entries.elementAt(0).value['number']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(255, 235, 244, 255),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 90,
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Contact 2'),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${contacts.entries.elementAt(1).value['name']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${contacts.entries.elementAt(1).value['number']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Important Dates:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 224, 224, 224),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ],
                                ),
                                height: 70,
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Last Date Of Registration',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        DateFormat.jm()
                                            .add_yMMMd()
                                            .format(eventLDOR),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 224, 224, 224),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Event Date',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        '${DateFormat.yMMMd().format(date)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Description:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                              children: descriptionArray.map((e) {
                            return Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2 -
                                            300,
                                    child: Text(
                                      "${e}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList()),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Timeline:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          EventTimelineWidget(eventData['timeline']),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Prize and Perks:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          eventData['prize'] != null
                              ? Container(
                                  child: Row(
                                    children: prizeAndPerks.entries.map((e) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 224, 224, 224),
                                              blurRadius: 4.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(0.0, 0.0),
                                            )
                                          ],
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 13, horizontal: 15),
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.value['position'] ?? '',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              e.value['prize'] ?? '',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              : Text('NA')
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ImageNetwork(
                              image: eventData['image'],
                              height: 500,
                              width: 500),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
