import 'package:flutter/material.dart';
import 'package:restdio1/screens/multi_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const DioImplementation(),
      // home: const PostImpDio(),
      // home: const IntegrateOpenAI(),
      // home: MyHomePage(),
      // home: const AnimatedAlertDialog(),
      // home: AvatarUploader(),
      home: const MultipleScreens(),
      // home: const dioImplementationClass(),
    );
  }
}
