import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class realTimeKol extends StatefulWidget {
  @override
  _realTimeKolState createState() => _realTimeKolState();
}

class _realTimeKolState extends State<realTimeKol> {
  late Timer _timer;
  late StreamController<String> _controller;
  late String _currentTime;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<String>();
    _currentTime = '';
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      updateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.close();
    super.dispose();
  }

  void updateTime() async {
    var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        _currentTime = data['datetime'];
      });
      _controller.add(_currentTime);
    } else {
      throw Exception('Failed to load time data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Time:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            StreamBuilder<String>(
              stream: _controller.stream,
              initialData: _currentTime,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
