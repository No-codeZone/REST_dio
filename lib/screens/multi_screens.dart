import 'package:flutter/material.dart';
import 'package:restdio1/screens/permission_handler/permission_handler.dart';
import 'package:restdio1/screens/realtime_api/date_time_widget.dart';
import 'package:restdio1/screens/realtime_api/socketio_stream.dart';
import 'package:restdio1/screens/realtime_api/stream_socket.dart';
import 'package:restdio1/screens/realtime_api/stream_websocket.dart';
import 'package:restdio1/screens/stepper/custom_stepper.dart';
import 'package:restdio1/screens/stepper/demo_fs.dart';
import 'package:restdio1/screens/stepper/select_cscpro.dart';
import 'package:restdio1/volume%20controller/slider_volume.dart';
import 'package:restdio1/volume%20controller/volumectrl.dart';
import '../avatar/avatar_profile.dart';
import '../streams_listening/date_time_kol.dart';
import '../streams_listening/stream_api_listening.dart';
import '../streams_listening/stream_api_trail.dart';
import '../streams_listening/time_widget.dart';
import '../streams_listening/we_socket_demo.dart';
import '../volume controller/circular_controller.dart';
import '../volume controller/controller_canvas.dart';
import '../whatsapp_avatar/avatar_whatsapp.dart';
import 'avatar_rough_screen/avatar_img_upload.dart';
import 'brightness_ctrl/screen_brightness.dart';
import 'color_picker.dart';
import 'dio_screen/dio_implementation.dart';

class MultipleScreens extends StatefulWidget {
  const MultipleScreens({super.key});

  @override
  State<MultipleScreens> createState() => _MultipleScreensState();
}

class _MultipleScreensState extends State<MultipleScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const dioImplementationClass()),
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('dioImplementationClass'),
              ),
            ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const avatarImgUpload()),
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('avatarImgUpload'),
              ),
            ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => myAvatarProfile()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Customize avatar'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const avatarWhatsapp()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('whatsapp avatar'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const intraDayData()),
              // MaterialPageRoute(builder: (context) => const streamApiTrail()),
              // MaterialPageRoute(builder: (context) => DateTimeWidget()),
              // MaterialPageRoute(builder: (context) => const webSocketDemo()),
              // MaterialPageRoute(builder: (context) => TimeWidget()),
              // MaterialPageRoute(builder: (context) => realTimeKol()),
              MaterialPageRoute(builder: (context) => TimeWidgetWebSocket()),
              // MaterialPageRoute(builder: (context) => const BuildWithSocketStream()),
              // MaterialPageRoute(builder: (context) => const streamSocketDemo()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Stream Controller 1'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const intraDayStats()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Stream Controller 2'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const stepperDemo()),
              MaterialPageRoute(builder: (context) => const stepperTest()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Stepper'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const permissionHandlerDemo()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Permission Handler'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => selectCSCpro()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Select CSC pro'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const BrightnessCtrl()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Brightness controller'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const ColorPickerDemo()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Color palette'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const VolumeSlider()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Volume controller'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const VolumeController()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Volume controller 1.0'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const CanvasController()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Canvas Progress controller'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>RadialGaugeWidget()),
            ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Canvas Progress controller 1,0'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
