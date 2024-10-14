import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stepper_flutter_form/stepper_flutter_form.dart';


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> item = [];
//     item.add("Sign up");
//     item.add("Enter Details");
//     item.add("Upload documents");
//     item.add("Esign");
//     item.add("Upload documents");
//     item.add("Esign");
//     item.add("Upload documents");
//     item.add("Esign");
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(
//         title: 'Flutter Stepper Form Demo',
//         items: item,
//         selectedColor: Colors.green,
//         unSelectedColor: Colors.red,
//         inProcess: 5,
//         menuTitleSize: 15,
//       ),
//     );
//   }
// }

class stepperDemo extends StatefulWidget {
  int inProcess = 1;
  Color selectedColor;
  Color unSelectedColor;
  final String title;
  List<String> items;
  double menuTitleSize;

  stepperDemo(
      {super.key,
      required this.title,
      required this.items,
      required this.inProcess,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.menuTitleSize});

  @override
  State<stepperDemo> createState() => _stepperDemoState();
}

class _stepperDemoState extends State<stepperDemo> {
  List<String> item2 = [];
  List<String> item3 = [];

  @override
  void initState() {
    // TODO: implement initState

    item2.add("Basic Detail");
    item2.add("Contact Information");
    item2.add("Address");
    item2.add("Documents");

    item3.add("PAN");
    item3.add("Aadhar");
    item3.add("Bank Detail");
    item3.add("Documents");
    item3.add("eSign");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Scrollable Stepper"),
            const SizedBox(
              height: 10,
            ),
            FormStepper(
              items: widget.items,
              selectedColor: Colors.green,
              unSelectedColor: Colors.red,
              inProcess: 5,
              menuTitleSize: 12,
              height: 80,
              onItemClicked: (index) {
                print('ClickedIndex' + index.toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Stepper with custom colors "),
            SizedBox(
              height: 10,
            ),
            FormStepper(
              items: item2,
              selectedColor: Colors.blue,
              unSelectedColor: Colors.black,
              inProcess: 1,
              menuTitleSize: 12,
              height: 80,
              onItemClicked: (index) {
                print('ClickedIndex' + index.toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Stepper with custom colors "),
            SizedBox(
              height: 10,
            ),
            FormStepper(
              items: item3,
              selectedColor: Colors.green,
              unSelectedColor: Colors.pinkAccent,
              inProcess: 0,
              menuTitleSize: 12,
              height: 80,
              onItemClicked: (index) {
                print('ClickedIndex' + index.toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Stepper with custom colors "),
            SizedBox(
              height: 10,
            ),
            FormStepper(
              items: item3,
              selectedColor: Colors.green,
              unSelectedColor: Colors.pinkAccent,
              inProcess: 2,
              menuTitleSize: 12,
              height: 80,
              onItemClicked: (index) {
                print('ClickedIndex' + index.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
