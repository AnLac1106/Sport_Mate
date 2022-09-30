import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SPMTimePickerCuper extends StatefulWidget {
  const SPMTimePickerCuper({Key? key}) : super(key: key);

  @override
  State<SPMTimePickerCuper> createState() => _SPMTimePickerCuperState();
}

class _SPMTimePickerCuperState extends State<SPMTimePickerCuper> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIme Picker Cuper'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              onDateTimeChanged: (dateTime) {
                setState(() {
                  debugPrint("$dateTime");
                  _dateTime = dateTime;
                });
              },
              initialDateTime: _dateTime,
            ),
          )
        ],
      ),
    );
  }
}
