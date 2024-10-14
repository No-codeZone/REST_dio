// import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
// import 'package:flutter/material.dart';
// import '../utils/ChatCompletion.dart';
// import '../utils/CompletionPage.dart';
//
// const String key='API_KEY';
// final chatGpt=ChatGpt(apiKey: key);
//
// class IntegrateOpenAI extends StatefulWidget {
//   const IntegrateOpenAI({super.key});
//
//   @override
//   State<IntegrateOpenAI> createState() => _IntegrateOpenAIState();
// }
//
// class _IntegrateOpenAIState extends State<IntegrateOpenAI> {
//   @override
//   Widget build(BuildContext context) {
//     return
//     /*Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80.0),
//         child: Text(
//           'ChatGPT',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );*/
//     MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         inputDecorationTheme: InputDecorationTheme(
//           isDense: true,
//           fillColor: Colors.transparent,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Colors.black, width: 2),
//           ),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: const TabBar(
//               tabs: [
//                 Tab(icon: Text('Chat completion')),
//                 Tab(icon: Text('Completion')),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               ChatCompletionPage(chatGpt: chatGpt),
//               CompletionPage(chatGpt: chatGpt),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
