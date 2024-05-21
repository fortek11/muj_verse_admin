import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_buttons.dart';
import 'package:try_flutter_web/new_event/title_and_description.dart';

class NewEvent6 extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    final contactHashmap = dataState.contactsHashMap;
    final contact1 = contactHashmap.entries.elementAt(0).value;
    final contact2 = contactHashmap.entries.elementAt(1).value;
    const pattern = r'\d{10}';
    final regExp = RegExp(pattern);

    onSubmitted() {
      final validate = _key.currentState!.validate();
      if (!validate) {
        return;
      }
      print(contactHashmap);
      dataState.newEventNextPage();
    }

    return Form(
      key: _key,
      child: Column(
        children: [
          NewEventTitleAndDescription(
              title: 'Contact Information',
              description:
                  'This allows interested users to reach you with their queries.'),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: 224,
            width: 400,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0,
                  spreadRadius: 3)
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Contact 1',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    TextFormField(
                      initialValue: contact1['name'],
                      onChanged: (value) {
                        contact1['name'] = value;
                      },
                      onFieldSubmitted: (value) {
                        contact1['name'] = value;
                      },
                      onSaved: (newValue) {
                        contact1['name'] = newValue;
                      },
                      validator: (value) {
                        if (contact1['name'] == null) {
                          return 'Name cannot be empty';
                        }
                        if (contact1['name'] == '') {
                          return 'Name cannot be empty';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    TextFormField(
                      initialValue: contact1['number'],
                      onChanged: (value) {
                        contact1['number'] = value;
                      },
                      onFieldSubmitted: (value) {
                        contact1['number'] = value;
                      },
                      onSaved: (newValue) {
                        contact1['number'] = newValue;
                      },
                      maxLength: 10,
                      validator: (value) {
                        if (contact1['number'] == null) {
                          return 'Number cannot be empty';
                        }
                        if (contact1['number'].length < 10) {
                          return 'Please provide correct number';
                        }
                        if (!regExp.hasMatch(contact1['number'])) {
                          return 'Number can only be in digits.';
                        }
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'Phone Number'),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: 224,
            width: 400,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0,
                  spreadRadius: 3)
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Contact 2',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    TextFormField(
                      initialValue: contact2['name'],
                      onChanged: (value) {
                        contact2['name'] = value;
                      },
                      onFieldSubmitted: (value) {
                        contact2['name'] = value;
                      },
                      onSaved: (newValue) {
                        contact2['name'] = newValue;
                      },
                      validator: (value) {
                        if (contact2['name'] == null) {
                          return 'Name cannot be empty';
                        }
                        if (contact2['name'] == '') {
                          return 'Name cannot be empty';
                        }
                      },
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    TextFormField(
                      initialValue: contact2['number'],
                      onChanged: (value) {
                        contact2['number'] = value;
                      },
                      onFieldSubmitted: (value) {
                        contact2['number'] = value;
                      },
                      onSaved: (newValue) {
                        contact2['number'] = newValue;
                      },
                      maxLength: 10,
                      validator: (value) {
                        if (contact2['number'] == null) {
                          return 'Number cannot be empty';
                        }
                        if (contact2['number'].length < 10) {
                          return 'Please provide correct number';
                        }
                        if (!regExp.hasMatch(contact2['number'])) {
                          return 'Number can only be in digits.';
                        }
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'Phone Number'),
                    )
                  ],
                )
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
