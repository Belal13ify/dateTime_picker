import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date;
  TimeOfDay time;

  String datetime;
  void pickDateAndTime() async {
    var newDate = await showDatePicker(
        context: context,
        initialDate: date ?? DateTime(1950),
        firstDate: DateTime(1000),
        lastDate: DateTime(2021));
    var newTime = await showTimePicker(
        context: context, initialTime: time ?? TimeOfDay.now());

    setState(() {
      date = newDate;
      time = newTime;
    });
    String hours = time.hour.toString().padLeft(2, '0');
    String mintues = time.minute.toString().padLeft(2, '0');
    String _date = DateFormat.yMMMd().format(date);

    datetime = 'Date: $_date\n\nTime: $hours:$mintues';
    SnackBar mySnackBar = SnackBar(
        duration: Duration(seconds: 8),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 30,
            ),
            Text('Date: $_date',
                style: TextStyle(fontSize: 18, color: Colors.limeAccent)),
            Icon(
              Icons.alarm,
              color: Colors.white,
              size: 30,
            ),
            Text('Time: $hours:$mintues',
                style: TextStyle(fontSize: 18, color: Colors.limeAccent)),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
  }

  String getText() {
    if (date == null || time == null) {
      return 'Please Select Date';
    } else {
      return datetime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getText(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red)),
                onTap: pickDateAndTime,
                child: Text(
                  'Press to Pick Date and time',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
