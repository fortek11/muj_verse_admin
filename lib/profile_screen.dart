import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profilescreen';

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 100,
            width: 350,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 3)
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(color: Colors.black12)],
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 65, 82, 104).withOpacity(0.8),
                              Color.fromARGB(255, 65, 82, 104),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Icon(
                      Icons.book,
                      color: Colors.white,
                      size: 40,
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataState.clubdata['name'],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Club Name',
                      style: TextStyle(color: Colors.grey),
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
            padding: EdgeInsets.all(10),
            height: 80,
            width: 350,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 3)
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black87),
                ),
                Divider(
                  indent: 3,
                  endIndent: 3,
                ),
                Row(
                  children: [
                    Text(
                      'Email:  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataState.clubdata['admin'] ?? '',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
