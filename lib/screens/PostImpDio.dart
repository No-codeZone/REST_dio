import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Users {
  final int id;
  final String name;
  final String email;

  Users({required this.id, required this.name, required this.email});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(id: json['id'], name: json['name'], email: json['email']);
  }
}

class PostImpDio extends StatefulWidget {
  const PostImpDio({super.key});

  @override
  State<PostImpDio> createState() => _PostImpDioState();
}

class _PostImpDioState extends State<PostImpDio> {
  final TextEditingController editName = TextEditingController();
  final TextEditingController editEmail = TextEditingController();
  bool isLoading = false;

  void addUsers() async {
    String newName = editName.text;
    String newEmail = editEmail.text;

    if (newName.isEmpty || newEmail.isEmpty) {
      return debugPrint('Fields empty here !');
    }

    try {
      Response jsonResponse = await Dio().post(
          'https://jsonplaceholder.typicode.com/users',
          data: {'name': newName, 'email': newEmail});
      debugPrint(
          'Input field variables are\t${newName.toString()}\t\t${newEmail.toString()}');
      Users newUsers = Users.fromJson(jsonResponse.data);
      setState(() {
        isLoading = false;
      });
      debugPrint(
          'New array contains\nName\t${newUsers.name.toString()}\nEmail\t'
              '${newUsers.email.toString()}\nID\t${newUsers.id.toString()}');
      editName.clear();
      editEmail.clear();
    } catch (e) {
      setState(() {
        isLoading = true;
      });
      debugPrint(
          'Posting implementation interrupted by exception\t${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: editName,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: editEmail,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: addUsers,
                      child: const Text('Add User'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
