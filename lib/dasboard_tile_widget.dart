import 'package:flutter/material.dart';

class DashboardTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon iconData;
  DashboardTileWidget(this.title, this.subtitle, this.iconData);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: 220,
      height: 75,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 10.0, spreadRadius: 3)
          ],
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: Colors.black12)],
                  gradient: LinearGradient(colors: [
                    Color(0xFF1D2228).withOpacity(0.8),
                    Color(0xFF1D2228),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: iconData),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600))
            ],
          )
        ],
      ),
    );
  }
}
