import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class streamSocketDemo extends StatefulWidget {
  const streamSocketDemo({super.key});

  @override
  State<streamSocketDemo> createState() => _streamSocketDemoState();
}

StreamSocket streamSocket = StreamSocket();
String datiDaServer='dateTime';

class _streamSocketDemoState extends State<streamSocketDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: streamSocket.getResponse,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(snapshot.hasError){
            return
              const Center(
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
          }else {
            return
            Column(
              children: [
                Text(datiDaServer),
              ],
            );
          }
        },
      ),
    );
  }
}
@override
void initSocket() {
  connectAndListen();
}

// STEP1:  Stream setup
class StreamSocket {
  final _socketResponse = StreamController<String>();
  void Function(String) get addResponse => _socketResponse.sink.add;
  Stream<String> get getResponse => _socketResponse.stream;
  void dispose() {
    _socketResponse.close();
  }
}


void connectAndListen() {
  IO.Socket socket = IO.io('http://worldtimeapi.org/api/timezone/Asia/Kolkata',
     OptionBuilder().setTransports(['websocket']).build());

  socket.connect();
  socket.onConnect((_) {
    if (kDebugMode) {
      print('connect socket.io');
    }
    if (kDebugMode) {
      print(socket.id);
    }
  });

  //When an event recieved from server, data is added to the stream
  socket.on('message', (data) => streamSocket.addResponse);
  socket.on('message', (data) {
    if (kDebugMode) {
      print(data.toString());
    }
    if (kDebugMode) {
      print(data.toString().length);
    }
    // datiDaServer = data;
    datiDaServer += data.toString();
  });

  socket.onDisconnect((_) => print('disconnect'));
}
