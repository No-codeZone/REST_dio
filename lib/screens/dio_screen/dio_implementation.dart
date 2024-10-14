import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/userModel.dart';

class UserGeo {
  final String geoLat;
  final String geoLong;

  UserGeo({required this.geoLat, required this.geoLong});

  factory UserGeo.fromJson(Map<String, dynamic> json) {
    return UserGeo(geoLat: json['lat'], geoLong: json['lng']);
  }
}

class UserAddress {
  final String addStreet;
  final String addCity;
  final String addZipcode;
  // UserGeo userGeo;

  UserAddress(
      {required this.addStreet,
      required this.addCity,
      required this.addZipcode,
      // required this.userGeo
      });

  factory UserAddress.fromJson(Map<String, dynamic> parsedJson) {
    return UserAddress(
        addStreet: parsedJson['street'],
        addCity: parsedJson['city'],
        addZipcode: parsedJson['zipcode'],
        // userGeo: UserGeo.fromJson(parsedJson['userGeo'])
    );
  }
}

class Users {
  final int userID;
  final String name;
  final String userName;
  final String userMail;
  // UserAddress userAddress;

  Users(
      {required this.userID,
      required this.name,
      required this.userName,
      required this.userMail,
      // required this.userAddress
      });

  factory Users.fromJson(Map<String, dynamic> parsedJson) {
    return Users(
        userID: parsedJson['id'],
        name: parsedJson['name'],
        userName: parsedJson['username'],
        userMail: parsedJson['email'],
        // userAddress: UserAddress.fromJson(parsedJson['userAddress'])
    );
  }
}

class dioImplementationClass extends StatefulWidget {
  const dioImplementationClass({super.key});

  @override
  State<dioImplementationClass> createState() => _dioImplementationClassState();
}

class _dioImplementationClassState extends State<dioImplementationClass> {
  final dio = Dio();

  void fetchCompleteData() async {
    final responseDio =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    debugPrint('JSON response is here\t${responseDio.data.toString()}');
  }

  void fetchEmailData() async {
    final emailResponse =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    debugPrint('JSON email response is here\t${emailResponse.data['email']}');
  }

  List<Users> userList = [];
  bool isLoading = true;
  final String URL = "https://jsonplaceholder.typicode.com/users";

  Future<void> fetchUsersList() async {
    try {
      Response userResponseList =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      debugPrint('User List Response\t${userResponseList.data.toString()}');
      List<dynamic> storeJsonResult = userResponseList.data;

      setState(() {
        userList =
            storeJsonResult.map((users) => Users.fromJson(users)).toList();
        debugPrint('User List Response\t${userList.toString()}');
        isLoading = false;
      });
      debugPrint('User List Response\t${userList.toString()}');
    } catch (exception) {
      setState(() {
        isLoading = true;
        debugPrint('Encountered exception(${exception.toString()}) while'
            ' fetch response from\t${URL.toString()}');
      });
    }
  }

  late List<UserModel> myUserModel = [];

  Future<void> getModelData() async {
    try {
      Response apiResult =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      myUserModel = (json.decode(apiResult.data) as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      debugPrint('User miodel data is here !\t${myUserModel.toString()}');
    } catch (exception) {
      debugPrint(
          'Encountered exception(${exception.toString()} while accessing the URL\t${URL.toString()} in jsonDecode(');
      isLoading = true;
    }
  }

  @override
  void initState() {
    super.initState();
    try {
      fetchUsersList();
      isLoading = false;
    } catch (e) {
      debugPrint('Encountered exception in initState\t(${e.toString()})');
    }
  }

  @override
  void dispose() {
    super.dispose();
    fetchUsersList();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 10,
                    color: Color(0xffecebeb),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(
                        color: Color(0xff2c7086),
                        strokeWidth: 5.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          :
      ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    gradient: LinearGradient(
                        colors: [Colors.white, Color(0xfff3f3f3)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(userList[index].userID.toString()),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ListTile(
                      title: Text(userList[index].name.toString()),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ListTile(
                      title: Text(userList[index].userName.toString()),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ListTile(
                      title: Text(userList[index].userMail.toString()),
                    ),
                    /*const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(
                                  myUserModel[index].address!.street.toString()),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(
                                  userList[index].userAddress.addStreet.toString()),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(userList[index]
                                  .userAddress
                                  .userGeo
                                  .geoLat
                                  .toString()),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(userList[index]
                                  .userAddress
                                  .userGeo
                                  .geoLong
                                  .toString()),
                            ),*/
                  ],
                ),
              ),
            );
          }),
      /*Center(
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            MaterialButton(onPressed: ()
              =>
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:
                  ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(
                                  colors: [Colors.white, Color(0xfff3f3f3)])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(userList[index].userID.toString()),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              ListTile(
                                title: Text(userList[index].name.toString()),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              ListTile(
                                title: Text(userList[index].userName.toString()),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              ListTile(
                                title: Text(userList[index].userMail.toString()),
                              ),
                              */
      /*const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(
                                  myUserModel[index].address!.street.toString()),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(
                                  userList[index].userAddress.addStreet.toString()),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(userList[index]
                                  .userAddress
                                  .userGeo
                                  .geoLat
                                  .toString()),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ListTile(
                              title: Text(userList[index]
                                  .userAddress
                                  .userGeo
                                  .geoLong
                                  .toString()),
                            ),*/
      /*
                            ],
                          ),
                        ),
                      );
                    }),
                )
            ,
            child: Text('Fetch first object'),),

                    ],
                  ),
          )*/
      /*Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () => fetchCompleteData(),
              child: Text('All Data'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              onPressed: () => fetchUsersList(),
              child: Text('Get email'),
            ),
          ],
        ),
      ),*/
    );
  }
}
