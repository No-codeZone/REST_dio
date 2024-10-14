import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restdio1/streams_listening/time_data.dart';


class TimeWidget extends StatefulWidget {
  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  late TimeData timeData;
  late StreamSubscription<String> _streamSubscription;
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    timeData = TimeData();
      _streamSubscription = timeData.timeStream.listen((time) {
        debugPrint('Time received\t${time.toString()}');
        setState(() {
          currentTime = time;
          debugPrint('Time received\t${currentTime.toString()}');
        });
      });

  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    timeData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Time:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              currentTime,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
