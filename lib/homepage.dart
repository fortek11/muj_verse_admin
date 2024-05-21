import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:try_flutter_web/dashboard_widget.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/events_table.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'homepage';
  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<DataState>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome back,",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              Text('${stateData.clubdata['name']}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              DashboardWidget(),
              SizedBox(
                height: 30,
              ),
              Text(
                'Events',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              EventsTable(),
            ],
          ),
        )
      ],
    );
  }
}
