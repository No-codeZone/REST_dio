import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import '../../streams_listening/stream_background.dart';

class DateTimeWidget extends StatefulWidget {
  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late String _dateTime;
  late ReceivePort _receivePort;
  late Isolate _isolate;

  @override
  void initState() {
    super.initState();
    _dateTime = 'Loading...';
    _receivePort = ReceivePort();
    _initIsolate();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolate.kill(priority: Isolate.immediate);
    super.dispose();
  }

  Future<void> _initIsolate() async {
    _isolate = await Isolate.spawn(backgroundTask, _receivePort.sendPort);
    _receivePort.listen((dynamic data) {
      debugPrint('Inside isolateFuture\t${_receivePort}');
      setState(() {
        if (data is String) {
          _dateTime = data;
        } else if (data is Error) {
          _dateTime = 'Error: ${data.toString()}';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Date & Time'),
      ),
      body: Center(
        child: Text(
          'Current Date & Time: $_dateTime',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
