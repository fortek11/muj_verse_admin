import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_web/data_state.dart';

class DescriptionTile extends StatelessWidget {
  final int index;
  DescriptionTile(this.index);
  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    return Container(
      width: 600,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 450,
            child: TextFormField(
              initialValue: dataState.newEventDescriptionArray[index],
              maxLines: 4,
              onChanged: (value) {
                dataState.newEventDescriptionArray[index] = value;
              },
              validator: (value) {
                if (value == null) {
                  return "Event Description cannot be empty";
                }
                if (value == '') {
                  return "Event Description cannot be empty";
                }
                if (value.length <= 8) {
                  return "Description bullet cannot be less or equal to 8 letters";
                }
              },
              onSaved: (newValue) {
                if (newValue == null) {
                  return;
                }
                dataState.newEventDescriptionArray[index] = newValue;
              },
              onFieldSubmitted: (value) {
                dataState.newEventDescriptionArray[index] = value;
              },
              decoration: InputDecoration(
                  hintText: '${index + 1}. Type Here',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder()),
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
                    dataState.newEventDescriptionArray.removeAt(index);
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
