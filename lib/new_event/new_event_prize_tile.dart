import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class PerksAndPrizeTile extends StatelessWidget {
  final int index;
  PerksAndPrizeTile(this.index);
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    final elementData =
        dataState.newEventPerksMap.entries.elementAt(index).value;
    return Container(
      width: 600,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 450,
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: TextFormField(
                    initialValue: elementData['position'],
                    validator: (value) {
                      if (elementData['position'] == '') {
                        return "Field cannot be empty";
                      }
                      if (elementData['position'] == ' ') {
                        return "Field cannot be empty";
                      }
                    },
                    onChanged: (value) {
                      elementData['position'] = value;
                    },
                    onSaved: (newValue) {
                      elementData['position'] = newValue;
                    },
                    onFieldSubmitted: (value) {
                      elementData['position'] = value;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: 'Position',
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  ':',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    initialValue: elementData['prize'],
                    onChanged: (value) {
                      elementData['prize'] = value;
                    },
                    onSaved: (newValue) {
                      elementData['prize'] = newValue;
                    },
                    onFieldSubmitted: (value) {
                      elementData['prize'] = value;
                    },
                    validator: (value) {
                      if (elementData['prize'] == '') {
                        return "Field cannot be empty";
                      }
                      if (elementData['prize'] == ' ') {
                        return "Field cannot be empty";
                      }
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: 'Prize',
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
              maxRadius: 15,
              backgroundColor: Colors.redAccent,
              child: IconButton(
                  onPressed: () {
                    dataState.notifyListeners();
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 15,
                  )))
        ],
      ),
    );
  }
}
