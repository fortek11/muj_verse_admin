import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/navigating_state.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<NavigatingState>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: 250,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1D2228),
                Color.fromARGB(235, 37, 43, 49),
              ],
              stops: [
                0.6,
                1
              ]),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 100,
                child: Image.asset('assets/logo.png'),
              ),
              const Divider(
                color: Color.fromARGB(100, 255, 255, 255),
                endIndent: 10,
                indent: 10,
              ),
              InkWell(
                onTap: () {
                  stateData.changePageIndexTo(0);
                },
                child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: stateData.pageIndex == 0
                          ? Colors.white.withOpacity(1)
                          : Colors.transparent),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.event,
                        color: stateData.pageIndex == 0
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Events',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: stateData.pageIndex == 0
                                ? Colors.black
                                : Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  stateData.changePageIndexTo(1);
                },
                child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: stateData.pageIndex == 1
                          ? Colors.white.withOpacity(1)
                          : Colors.transparent),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.person_outline_outlined,
                        color: stateData.pageIndex == 1
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: stateData.pageIndex == 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              leading: const Icon(
                Icons.logout,
                color: Colors.grey,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
