import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/AsianTime.dart';
import 'package:http/http.dart' as http;

class streamControllerTrial extends StatefulWidget {
  const streamControllerTrial({super.key});

  @override
  State<streamControllerTrial> createState() => _streamControllerTrialState();
}

class _streamControllerTrialState extends State<streamControllerTrial> {
  final StreamController<AsianTime> streamController = StreamController();
  String something = "Returned something";

  Future<void> getDataFromAPI() async {
    var url = "http://worldtimeapi.org/api/timezone/Asia/Kolkata";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    debugPrint('Response is here\t${response.body.toString()}');
    debugPrint('Response data is here\t${data.toString()}');
    try {
      if (response.statusCode == 200) {
        streamController.sink.add(AsianTime.fromJson(data));
        debugPrint('StatusCode\t${response.statusCode.toString()}');
      }
    } catch (exception) {
      debugPrint('Encountered exception is\t${exception.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AsianTime>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Returned Json object');
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      elevation: 10.0,
                      color: Color(0xfff3f3f3),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(
                          color: Color(0xff54b9b9),
                          strokeWidth: 4.0,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
