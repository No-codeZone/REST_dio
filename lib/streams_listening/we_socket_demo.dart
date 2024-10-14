import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class TimeWidgetWebSocket extends StatefulWidget {
  @override
  _TimeWidgetWebSocketState createState() => _TimeWidgetWebSocketState();
}

class _TimeWidgetWebSocketState extends State<TimeWidgetWebSocket> {
  late WebSocketChannel _channel;
  late int _currentTime=0;
  bool isLoading=true;

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade'));
    _channel.stream.listen((data) {
      Map<String, dynamic> response = jsonDecode(data);
      // debugPrint('Response from websocket\t${response.toString()}');
      setState(() {
        isLoading=false;
        _currentTime = response['b'];
        debugPrint('BTC[t]\t$_currentTime');
      });
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BTC Widget'),
      ),
      body: isLoading ? const Center(
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
      ) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current slot trend BTC:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              '$_currentTime',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
