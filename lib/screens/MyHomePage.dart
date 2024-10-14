import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }
}

class DioImplementation extends StatefulWidget {
  const DioImplementation({super.key});

  @override
  State<DioImplementation> createState() => _DioImplementationState();
}

class _DioImplementationState extends State<DioImplementation> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      List<dynamic> jsonResponse = response.data;

      setState(() {
        users = jsonResponse.map((users) => User.fromJson(users)).toList();
        isLoading = false;
        debugPrint('Response\t${jsonResponse.toString()}');
      });
    } catch (exception) {
      setState(() {
        isLoading = true;
      });
      debugPrint(
          'Fetching data is interrupted, terminated by throwing exception\t${exception.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const
      Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gradient: LinearGradient(
                              colors: [Colors.white, Color(0xfff3f3f3)])),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(users[index].name),
                          ),
                          ListTile(
                            title: Text(users[index].email),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
