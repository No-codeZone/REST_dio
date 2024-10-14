import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void backgroundTask(SendPort sendPort) async {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) async {
    if (message is SendPort) {
      try {
        final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(response.body);
          final String dateTime = data['datetime'];
          debugPrint('DateTime is here\t${dateTime.toString()}');
          message.send(dateTime);
          debugPrint('after send time to receiver is here}');
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        message.send(e.toString());
      }
    }
  });
}
