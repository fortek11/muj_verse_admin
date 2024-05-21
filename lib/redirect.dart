import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

import 'package:try_flutter_web/main_page.dart';

import 'package:try_flutter_web/new_login.dart';

class Redirect extends StatelessWidget {
  static const routeName = 'redirect';
  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<DataState>(context, listen: false);
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snap) {
              //if user loged in
              if (snap.hasData) {
                final username = FirebaseAuth.instance.currentUser!.email;
                Map<String, dynamic>? clubData;

                Future<Map<String, dynamic>> fetchClubData() async {
                  print('fetchind data from db');
                  await FirebaseFirestore.instance
                      .collection('clubs')
                      .where("admin", isEqualTo: username)
                      .get()
                      .then(
                    (value) {
                      for (var element in value.docs) {
                        clubData = element.data();
                        stateData.clubdata = element.data();
                        print('data = ' + element.data().toString());
                      }
                    },
                  ).then((valueeeee) async {
                    final List eventsIdList = clubData!['events'];
                    for (int i = 0; i < eventsIdList.length; i++) {
                      await FirebaseFirestore.instance
                          .collection('upcoming-events')
                          .doc(eventsIdList[i].toString())
                          .get()
                          .then((value) {
                        final Map<String, dynamic> eventData = {
                          eventsIdList[i].toString():
                              value.data() as Map<String, dynamic>
                        };

                        stateData.eventsData.addAll(eventData);
                      });
                    }
                    print('eventsData = ' + stateData.eventsData.toString());
                  });
                  return clubData!;
                }

                return FutureBuilder(
                    future: fetchClubData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Column(
                            children: [
                              Text(snapshot.error.toString()),
                              IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                  },
                                  icon: Icon(Icons.logout))
                            ],
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return MainPage();
                      } else {
                        return Center(
                            child: SpinKitFadingCube(
                          color: Color.fromARGB(255, 65, 82, 104),
                        ));
                      }
                    });
              } else {
                //is user not found
                return NewLogin();
              }
            }));
  }
}
