import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/dasboard_tile_widget.dart';
import 'package:try_flutter_web/data_state.dart';

class DashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clubData = Provider.of<DataState>(context);
    final Map<String, dynamic> eventsData = clubData.eventsData;

    int totalImpressions() {
      int impressions = 0;
      eventsData.entries.forEach((element) {
        impressions += element.value['interested'] as int;
      });
      return impressions;
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DashboardTileWidget(
            eventsData.entries.length.toString(),
            'Upcoming Events',
            const Icon(
              Icons.event_note_rounded,
              color: Colors.white,
              size: 40,
            )),
        DashboardTileWidget(
            totalImpressions().toString(),
            'Total Impressions',
            const Icon(
              Icons.remove_red_eye_rounded,
              color: Colors.white,
              size: 40,
            )),
        DashboardTileWidget(
            clubData.clubdata['rating'].toString() ?? 'NA',
            'Club Rating',
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 40,
            )),
        DashboardTileWidget(
            clubData.clubdata['rating'].toString() ?? 'NA',
            'Club Rating',
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 40,
            ))
      ],
    );
  }
}
