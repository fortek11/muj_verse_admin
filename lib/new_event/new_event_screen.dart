import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/new_event_1.1.dart';
import 'package:try_flutter_web/new_event/new_event_1.dart';
import 'package:try_flutter_web/new_event/new_event_2.dart';
import 'package:try_flutter_web/new_event/new_event_3.dart';
import 'package:try_flutter_web/new_event/new_event_4.dart';
import 'package:try_flutter_web/new_event/new_event_5.dart';
import 'package:try_flutter_web/new_event/new_event_6.dart';
import 'package:try_flutter_web/new_event/new_event_7.dart';

class NewEventScreen extends StatelessWidget {
  static const routeName = 'neweventscreen';

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    final _controller = dataState.newEventPageController;
    var pageIndex = dataState.newEventpageIndex;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                  controller: _controller,
                  count: 8,
                  effect: const ExpandingDotsEffect(
                      expansionFactor: 1.8,
                      dotColor: Color.fromARGB(255, 207, 207, 207),
                      activeDotColor: Color.fromARGB(255, 45, 55, 66))),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: pageIndex == 0
                    ? 505
                    : pageIndex == 2
                        ? 260 +
                            ((dataState.newEventDescriptionArray.length) * 120)
                        : pageIndex == 3
                            ? 332
                            : pageIndex == 4
                                ? 320 +
                                    (dataState.timelineHashmap.entries.length *
                                        180)
                                : pageIndex == 5
                                    ? 270 +
                                        (dataState.newEventPerksMap.entries
                                                .length *
                                            110)
                                    : pageIndex == 6
                                        ? 660
                                        : pageIndex == 1
                                            ? 330
                                            : pageIndex == 7
                                                ? 670
                                                : 305,
                child: PageView(
                  controller: _controller,
                  children: [
                    NewEvent1(),
                    NewEvent1v2(),
                    NewEvent2(),
                    NewEvent3(),
                    NewEvent4(),
                    NewEvent5(),
                    NewEvent6(),
                    NewEvent7()
                  ],
                  onPageChanged: (i) {
                    dataState.newEventpageIndex = i;
                    dataState.notifyListeners();
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
