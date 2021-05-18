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
    final hours = time.hour.toString().padLeft(2, '0');
    final mintues = time.minute.toString().padLeft(2, '0');

    datetime =
        'Date: ${DateFormat.yMMMd().format(date)}\n\n Time: $hours:$mintues';
    SnackBar mySnackBar = SnackBar(
        duration: Duration(seconds: 5),
        content: Text(
          datetime,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
  }

  String getText() {
    if (date == null || time == null) {
      return 'Please Select Date';
    } else {
      return datetime;
      // return '${date.day}/${date.month}/${date.year} ${time.hour}:${time.minute}';
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
            InkWell(
              onTap: pickDateAndTime,
              child: Text(
                'Press here to Pick Date and time',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      )),
    );
  }
}
