import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const backgroundColor = "#f3f3f3";

class avatarWhatsapp extends StatefulWidget {
  const avatarWhatsapp({super.key});

  @override
  State<avatarWhatsapp> createState() => _avatarWhatsappState();
}

class _avatarWhatsappState extends State<avatarWhatsapp> {
  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;
    final dWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: dHeight * 0.15,
      ),*/
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        // backgroundColor: Color(0xfffcfafa),
        backgroundColor: Colors.white,
        elevation: 5.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: dHeight * 0.02,
                  ),
                  SizedBox(
                    height: dHeight * 0.15,
                    width: dWidth * 0.15,
                    child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                            radius: 50.0,
                            backgroundColor: Colors.transparent,
                          ),
                          Positioned(
                              bottom: 10,
                              right: -30,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                child: MaterialButton(
                                  onPressed: () {
                                    debugPrint('Edit button clicked !');
                                  },
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0))),
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.0)),
                                        color: Color(0xff4ee080)),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ))
                        ]),
                  ),
                  SizedBox(
                    height: dHeight * 0.05,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person_outline_outlined,
                          color: Colors.grey,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Name',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const Text(
                                    'Vivek_VK',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const Text(
                                    'This si not your username or pin, '
                                        'This name ',
                                    style: TextStyle(color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const Icon(Icons.edit_outlined,
                                color: Color(0xff4ee080),size: 25.0,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    color: Color(0xfff3f3f3),
                    height: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Colors.grey,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'When going get TOUGH, TOUGH gets going',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Icon(Icons.edit_outlined,
                                color: Color(0xff4ee080),size: 25.0,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    color: Color(0xfff3f3f3),
                    height: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 25.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'When going get TOUGH, TOUGH gets going',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Icon(Icons.edit_outlined,
                                color: Color(0xff4ee080),size: 25.0,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
