// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../models/QuesAns.dart';
//
// final List<Map<String, String>> messages = [];
// const String openAiKey = 'API_KEY';
//
// class CompletionPage extends StatefulWidget {
//   final ChatGpt chatGpt;
//
//   const CompletionPage({super.key, required this.chatGpt});
//
//   @override
//   State<CompletionPage> createState() => _CompletionPageState();
// }
//
// class _CompletionPageState extends State<CompletionPage> {
//   ///Ref
//   Future<String> chatGPTAPI(String prompt) async {
//     messages.add({
//       'role': 'user',
//       'content': prompt,
//     });
//     try {
//       final res = await Dio().post('https://api.openai.com/v1/chat/completions',
//         options: Options(
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $openAiKey',
//             }
//         ),
//         data: jsonEncode({
//           "model": "gpt-3.5-turbo",
//           "messages": messages,
//         }),
//       );
//
//       if (res.statusCode == 200) {
//         String content =
//         jsonDecode(res.data)['choices'][0]['message']['content'];
//         content = content.trim();
//         messages.add({
//           'role': 'assistant',
//           'content': content,
//         });
//         return content;
//       }
//       return 'An internal error occurred';
//     } catch (e) {
//       return e.toString();
//     }
//   }
//
//   ///GitHub
//   String? answer;
//   bool loading = false;
//   final testPrompt =
//       'Which Disney character famously leaves a glass slipper behind at a royal ball?';
//
//   final List<QuestionAnswer> questionAnswers = [];
//
//   late TextEditingController textEditingController;
//
//   StreamSubscription<CompletionResponse>? streamSubscription;
//   StreamSubscription<StreamCompletionResponse>? chatStreamSubscription;
//
//   @override
//   void initState() {
//     textEditingController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     textEditingController.dispose();
//     chatStreamSubscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: questionAnswers.length,
//                   itemBuilder: (context, index) {
//                     final questionAnswer = questionAnswers[index];
//                     final answer = questionAnswer.answer.toString().trim();
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Text('Q: ${questionAnswer.question}'),
//                         const SizedBox(height: 12),
//                         if (answer.isEmpty && loading)
//                           const Center(child: CircularProgressIndicator())
//                         else
//                           Text('A: $answer'),
//                       ],
//                     );
//                   },
//                   separatorBuilder: (context, index) =>
//                   const SizedBox(height: 12),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: textEditingController,
//                       decoration: const InputDecoration(hintText: 'Type in...'),
//                       onFieldSubmitted: (_) => _sendMessage(),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   ClipOval(
//                     child: Material(
//                       color: Colors.blue, // Button color
//                       child: InkWell(
//                         onTap: _sendMessage,
//                         child: const SizedBox(
//                           width: 48,
//                           height: 48,
//                           child: Icon(
//                             Icons.send_rounded,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _sendMessage() async {
//     final question = textEditingController.text;
//     setState(() {
//       textEditingController.clear();
//       loading = true;
//       questionAnswers.add(
//         QuestionAnswer(
//           question: question,
//           answer: StringBuffer(),
//         ),
//       );
//     });
//
//     final testRequest = CompletionRequest(
//       prompt: [question],
//       stream: true,
//       maxTokens: 256,
//       model: ChatGptModel.gpt4.modelName,
//       stop: ['END'],
//     );
//     await _streamResponse(testRequest);
//     setState(() => loading = false);
//   }
//
//   _streamResponse(CompletionRequest request) async {
//     streamSubscription?.cancel();
//     try {
//       final stream = await widget.chatGpt.createCompletionStream(request);
//       streamSubscription = stream?.listen(
//             (event) => setState(
//               () {
//             if (event.streamMessageEnd) {
//               streamSubscription?.cancel();
//             } else {
//               return questionAnswers.last.answer.write(
//                 event.choices?.first.text,
//               );
//             }
//           },
//         ),
//       );
//     } catch (error) {
//       setState(() {
//         loading = false;
//         questionAnswers.last.answer.write("Error");
//       });
//       log("Error occurred: $error");
//     }
//   }
// }
