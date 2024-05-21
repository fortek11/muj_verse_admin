import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent1 extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    String? title = dataState.newEventTitle ?? '';
    String? price = dataState.newEventPrice ?? '';
    String? location = dataState.newEventLocation ?? '';
    const pattern = r'\d$';
    final regExp = RegExp(pattern);
    onSubmitted() {
      final validate = _key.currentState!.validate();
      if (!validate) {
        return;
      }

      dataState.newEventTitle = title;
      dataState.newEventLocation = location;
      dataState.newEventPrice = price;
      dataState.newEventNextPage();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewEventTitleAndDescription(
            title: 'Get Your Event Noticed',
            description:
                'With this Muj-Verse, organizing and promoting your clubs events has never been easier. Lets get the campus buzzing about your next big thing!',
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 450,
            child: Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: dataState.newEventTitle,
                      onChanged: (value) {
                        title = value;
                      },
                      onFieldSubmitted: (value) {
                        title = value;
                      },
                      onSaved: (newValue) {
                        title = newValue;
                      },
                      validator: (value) {
                        if (title == null) {
                          return 'Title Cannot be Empty';
                        }
                        if (title!.length <= 4) {
                          return 'Title should be atleast 5 letters';
                        }
                      },
                      cursorColor: const Color.fromARGB(133, 29, 34, 40),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(200, 29, 34, 40),
                                  width: 2)),
                          border: OutlineInputBorder(),
                          hintText: 'Title'),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      initialValue: dataState.newEventPrice,
                      onChanged: (value) {
                        price = value;
                      },
                      onFieldSubmitted: (value) {
                        price = value;
                      },
                      onSaved: (newValue) {
                        price = newValue;
                      },
                      validator: (value) {
                        if (price == null || price == '') {
                          return 'Price Cannot be Empty';
                        }
                        if (price != 'Free' && !regExp.hasMatch(price!)) {
                          print(price);
                          return 'Price Field can only be "Free" or digits ("100", "200")';
                        }
                      },
                      cursorColor: Color.fromARGB(133, 29, 34, 40),
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              '₹',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade600),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(200, 29, 34, 40),
                                  width: 2)),
                          border: const OutlineInputBorder(),
                          hintText: 'Price'),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      initialValue: dataState.newEventLocation,
                      onChanged: (value) {
                        location = value;
                      },
                      onFieldSubmitted: (value) {
                        location = value;
                      },
                      onSaved: (newValue) {
                        location = newValue;
                      },
                      validator: (value) {
                        if (location == null) {
                          return 'Price Cannot be Empty';
                        }
                        if (!location!.contains(',') || location!.length <= 4) {
                          return 'Invalid Input, location should be like this "220-AB1, Campus" or "B7 Court, GHS"';
                        }
                      },
                      cursorColor: const Color.fromARGB(133, 29, 34, 40),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey.shade600,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(200, 29, 34, 40),
                                  width: 2)),
                          border: const OutlineInputBorder(),
                          hintText: 'Location'),
                    )
                  ],
                )),
          ),
          const SizedBox(height: 15),
          const SizedBox(
            height: 20,
          ),
          NewEventButtons(onSubmitted),
        ],
      ),
    );
  }
}
