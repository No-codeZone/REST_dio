import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class AnimatedAlertDialog extends StatefulWidget {
  const AnimatedAlertDialog({super.key});

  @override
  State<AnimatedAlertDialog> createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog> {
  
  showDialog({required BuildContext context, required Function(BuildContext context) builder}){
    return
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return GiffyDialog.image(
          Image.network(
            "https://i.gifer.com/2lrQ.gif",
            height: 200,
            fit: BoxFit.cover,
          ),
          title: const Text(
            'Comeback Soon!',style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Flutter is awesome.',
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, 'CANCEL'),
                    child: const Text('CANCEL',style: TextStyle(color: Color(0xffbd6363)),),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffbd6363)
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                debugPrint('clicked onPressed !');
                showDialog
                (
                    context: context,
                    builder: (BuildContext context)
                {
                  return GiffyDialog.image(
                    Image.network(
                      "https://i.gifer.com/2lrQ.gif",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    title: const Text(
                      'Comeback Soon!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    content: const Text(
                      'Flutter is awesome.',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white
                            ),
                            child: TextButton(
                              onPressed: () => Navigator.pop(context, 'CANCEL'),
                              child: const Text('CANCEL',
                                style: TextStyle(color: Color(0xffbd6363)),),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffbd6363)
                            ),
                            child: TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text(
                                'OK', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
              },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Help Desk'),
                Icon(Icons.question_mark,color: Color(0xff213754),),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
