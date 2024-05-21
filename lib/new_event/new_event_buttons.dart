import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';
import 'package:try_flutter_web/new_event/confirm_submit.dart';

class NewEventButtons extends StatelessWidget {
  final VoidCallback function;
  NewEventButtons(this.function);

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (dataState.newEventpageIndex != 0)
          ElevatedButton(
            onPressed: () {
              dataState.newEventPrevPage();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Back')
              ],
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                foregroundColor: Color(0xFF1D2228)),
          ),
        SizedBox(
          width: 20,
        ),
        dataState.newEventpageIndex != 7
            ? ElevatedButton(
                onPressed: () {
                  function();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Next'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_sharp,
                      size: 18,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xFF1D2228),
                    foregroundColor: Colors.white),
              )
            : ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DialogFb1();
                      });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Submit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xFF1D2228),
                    foregroundColor: Colors.white),
              )
      ],
    );
  }
}
