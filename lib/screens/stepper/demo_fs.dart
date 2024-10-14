import 'package:android_intent_plus/android_intent.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_detector/platform_detector.dart';
import 'package:url_launcher/url_launcher.dart';

class stepperTest extends StatefulWidget {
  const stepperTest({Key? key}) : super(key: key);

  @override
  _stepperTestState createState() => _stepperTestState();
}

class _stepperTestState extends State<stepperTest> {
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();

  bool hide = false;

  int _activeCurrentStep = 0;
  int _activePaymentMethod = 0;

  List<Step> stepList() => [
        Step(
          title: const Text('Account'),
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          content: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      helperText: 'Enter your name',
                      hintText: 'UserName',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          // color: Color(0xfff3f3f3),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xff71b8fa)))),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    helperText: 'Enter registered mobile number',
                    hintText: 'Phone',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone,
                        // color: Color(0xfff3f3f3),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff71b8fa))),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    helperText: 'Enter customer ID',
                    hintText: 'Customer ID',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.account_box,
                        // color: Color(0xfff3f3f3),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff71b8fa))),
                  ),
                ),
              ],
            ),
          ),
          isActive: _activeCurrentStep >= 0,
        ),
        Step(
          title: const Text('Address'),
          state:
              _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
          content: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      helperText: 'Enter your Address line 1',
                      hintText: 'Address',
                      fillColor: Colors.white,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.home_work,
                          // color: Color(0xfff3f3f3),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xff71b8fa)))),
                  keyboardType: TextInputType.streetAddress,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    helperText: 'Enter your Address line 2 (optional)',
                    hintText: 'Address (optional)',
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.home_work,
                        // color: Color(0xfff3f3f3),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff71b8fa))),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: [
                    CountryStateCityPicker(
                      country: country,
                      dialogColor: const Color(0xfff3f3f3),
                      textFieldDecoration: const InputDecoration(
                          filled: true,
                          helperText: 'Enter your Country/State/City',
                          hintText: 'Country/State/City',
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          prefixIcon: Icon(Icons.location_history),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      state: state,
                      city: city,
                    ),
                    const SizedBox(height: 20),
                    Text("${country.text}\t${state.text}\t${city.text}")
                  ],
                ),
              ],
            ),
          ),
          isActive: _activeCurrentStep >= 1,
        ),
        Step(
          title: const Text('Confirm'),
          content: Column(
            children: [
              Text(
                'Payment Methods',
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  color: Color(0xfff3f3f3),
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  MaterialButton(
                    child: Card(
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Image.asset(
                        'assets/images/gp.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    onPressed: () {
                      debugPrint('Here inside google pay block !');
                      _openGPay();
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  MaterialButton(
                    child: Card(
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0))),
                      child: Image.asset(
                        'assets/images/pp.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    onPressed: (){
                      debugPrint('here inside phonepe block !');
                      _openPhonePe();
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Image.asset(
                      'assets/images/ptm.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Image.asset(
                      'assets/images/ccrd.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        )
      ];

  _openGPay() async {
    // const url = 'https://www.google.com/maps/search/?api=1&query=52.32,4.917';
    const url = 'upi://pay?pa=vivekvj191@okaxis&pn=Rohit&tn=TestingGpay&am=100&cu=INR';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  _openPhonePe() async {
    bool isInstalled =
        await DeviceApps.isAppInstalled('com.jio.media.phonepe');
    debugPrint('openapp\t1');
    if (isInstalled != false) {
      debugPrint('openapp\t2');
      // DeviceApps.openApp('com.ganna.');
      DeviceApps.openApp('com.jio.media.phonepe');
      debugPrint('openapp\t3');
      AndroidIntent intent = const AndroidIntent(
        action: 'action_view',
        data: 'https://play.google.com/store/apps/details?'
            'id=com.google.android.apps.phonepe',
      );
      await intent.launch();
    } else {
      if(isWeb()){
        debugPrint('Cannot open app due to\t$isWeb${isWeb()}');
      } else if(isDesktop()){
        debugPrint('Cannot open app due to\t${isDesktop()}');
      }
      const Text("Cannot open app");
      debugPrint("can't open app");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffe0e1e1),
          elevation: 10,
        ),

        // Here we have initialized the stepper widget
        body: Stepper(
          currentStep: _activeCurrentStep,
          controlsBuilder: (context, details) {
            return Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    if (_activeCurrentStep < (stepList().length - 1)) {
                      setState(() {
                        _activeCurrentStep += 1;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hide == true ? '' : 'Continue',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    if (_activeCurrentStep == 0) {
                      return;
                    }
                    setState(() {
                      _activeCurrentStep -= 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hide == true ? '' : 'Cancel',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          steps: stepList(),
          /*onStepContinue: (){
            if (_activeCurrentStep < (stepList().length - 1)) {
              setState(() {
                _activeCurrentStep += 1;
              });
            }
          },*/
          onStepTapped: (int index) {
            setState(() {
              _activeCurrentStep = index;
            });
          },
          /*onStepCancel: (){
            if (_activeCurrentStep == 0) {
              return;
            }
            setState(() {
              _activeCurrentStep -= 1;
            });
          },*/
        ));
  }
}
