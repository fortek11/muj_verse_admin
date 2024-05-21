import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/event_detail_screen.dart';

class EventsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventsData = Provider.of<DataState>(context).eventsData;

    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 300,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: eventsData.entries.length,
              itemBuilder: (context, index) {
                final event = eventsData.entries.elementAt(index).value;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventDetailScreen(event)));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300.withOpacity(0.5),
                              blurRadius: 10.0,
                              spreadRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 300,
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ImageNetwork(
                                  image: event['image'],
                                  height: 90,
                                  width: 90,
                                  onLoading: CircularProgressIndicator(),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                event['title'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 30,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          child: FittedBox(
                              child: Text(
                            'Interested: ${event['interested'] ?? 'null'}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 80, 6),
                            ),
                          )),
                        ),
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(14, 29, 34, 40),
                          child: Icon(Icons.arrow_forward_rounded),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
