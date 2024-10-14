import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class intraDayStats extends StatefulWidget {
  const intraDayStats({super.key});

  @override
  State<intraDayStats> createState() => _intraDayStatsState();
}

class _intraDayStatsState extends State<intraDayStats> {
  final http.Client _client = http.Client();
  final String _url = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam";
  final StreamController<String> _streamController =
      StreamController<String>.broadcast();
  final StreamController<List<dynamic>> streamController =
      StreamController<List<dynamic>>();

  /*Future<void> fetchDataFromAPI() async {
   *//* // final response=await http.get('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=1min&apikey=demo');
    // final response = await http.get(Uri.parse(
    //     "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=1min&apikey=demo"));
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> dataList = data.entries
            .map((e) => {'email': e.key}).toList();
            // .map((e) => {'time': e.key})
        _streamController.add(dataList);
        debugPrint('Response body\t${data.entries.toString()}');
        debugPrint('Stream Data\t${dataList.toString()}');
      }
    } catch (exception) {
      debugPrint('Encountered exception here is\t${exception.toString()}');
    }*//*

    final Uri uri = Uri.parse(_url);
    final Map<String, String> headers = {"Content-Type": "application/json"};

    final response = await http.get(uri,
      headers: headers,
    );
    debugPrint('Response body is here\t${response.body.toString()}');
    if (response.statusCode == 200) {
      final Map<String,dynamic> data = json.decode(response.body);
      final String currentTime=data['dateTime'];
      debugPrint('Current Time is here\t${currentTime.toString()}');
      _streamController.add(currentTime);
    } else {
      throw Exception('Failed to load data');
    }
  }*/

  // Future<void> fetchData() async {
  //   final Uri url = Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam');
  //   final response = await http.get(
  //     url,
  //     headers: {'accept':'application/json'},
  //   );
  //   debugPrint('Response here is\t${response.body.toString()}');
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     final String currentTime = data['dateTime'];
  //     _streamController.add(currentTime);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
  Future<void> fetchDataList() async {
    // final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    var response = await http.get(
      url
    );
    var finalData='';
    debugPrint('Response here is\t${response.body.toString()}');
    try{
      if (response.statusCode == 200) {
        var dataList = json.decode(response.body);
        debugPrint('try-catch block is here !');
        finalData=dataList['datetime'];
        _streamController.stream.listen((finalData) {
          debugPrint('Stream Listening\t${finalData.toString()}');
        },
        onDone: (){
          debugPrint('Listening event is\t${finalData.toString()}');
        },
          onError: (exception){
          debugPrint('Encountered exception while listening to the stream\t${exception.toString()}');
          }
        );
        debugPrint('DateTime\t${finalData.toString()}');
        _streamController.sink.add(finalData);
        debugPrint('Fetched value successfully !');
      }
    }catch(exception){
      debugPrint('Exception encountered here is\t${exception.toString()}');
    }
    /*if (response.statusCode == 200) {
      final List<dynamic> dataList = json.decode(response.body) as List;
      streamController.add(dataList);
    } else {
      throw Exception('Failed to load data');
    }*/
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      fetchDataList();
    });
    // _streamController.stream.listen((event) {
    //   debugPrint('EventsThisTime\t${event.toString()}');
    // });


    // while(_streamController.hasListener){
    //    Future.delayed(const Duration(milliseconds: 500),(){
    //     setState(() {
    //       fetchDataList();
    //     });
    //   });
    // }
    // fetchDataList();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<String>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dataDateTime = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(dataDateTime),
                ],
              ),
            );
              /*ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final item = dataList;
                return ListTile(
                  subtitle: Text(item['utc_datetime']),
                );
              },
            );*/
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
        },
      ),
    );
  }
}
