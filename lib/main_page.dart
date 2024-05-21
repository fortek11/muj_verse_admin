import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/homepage.dart';
import 'package:try_flutter_web/navigating_state.dart';
import 'package:try_flutter_web/new_event/new_event_screen.dart';
import 'package:try_flutter_web/profile_screen.dart';
import 'package:try_flutter_web/side_drawer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<NavigatingState>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            children: [
              SideDrawer(),
              stateData.pageIndex == 0 ? HomePage() : ProfileScreen()
            ],
          ),
        ),
        floatingActionButton: stateData.pageIndex == 0
            ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewEventScreen();
                  }));
                },
                backgroundColor: Color(0xFF1D2228),
                foregroundColor: Colors.white,
                label: Text('New Event'),
                icon: Icon(
                  Icons.post_add_rounded,
                  color: Colors.white,
                ),
              )
            : null);
  }
}
