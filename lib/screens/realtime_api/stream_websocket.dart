import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class webSocketDemo extends StatefulWidget {
  const webSocketDemo({super.key});

  @override
  State<webSocketDemo> createState() => _webSocketDemoState();
}

class _webSocketDemoState extends State<webSocketDemo> {
  String dateTimeKol = "0";
  // final wsUrl=Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
  final channel = IOWebSocketChannel.connect('wss://stream.binance.com:9443/ws/bnbusdt@trade');



  @override
  void initState() {
    super.initState();
    debugPrint('Channel is\t${channel.toString()}');
  }


  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${dateTimeKol.toString()}'),
          ],
        ),
      ),
    );
  }
}
