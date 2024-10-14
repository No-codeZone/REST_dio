import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class TimeData {
  late String time;
  late StreamController<String> _controller;

  TimeData() {
    _controller = StreamController<String>();
    updateTime();
  }

  Stream<String> get timeStream => _controller.stream;

  void updateTime() async {
    var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      time = data['datetime'];
      _controller.add(time);
    } else {
      throw Exception('Failed to load time data');
    }
  }

  void dispose() {
    _controller.close();
  }
}
