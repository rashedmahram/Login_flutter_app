import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({Key? key}) : super(key: key);

  @override
  _ResgisterPageState createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  final TextEditingController _controller = TextEditingController();
  Future<UserTb>? _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureUser == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureUser = createUser(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<UserTb> buildFutureBuilder() {
    return FutureBuilder<UserTb>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data!.name}");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

// SEND DATA TO SEREVER.
  Future<UserTb> createUser(String name) async {
    String url = "http://192.168.1.102:3000/Users";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'name': name,
        },
      ),
    );
    if (response.statusCode == 201) {
      return UserTb.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Field to create album');
    }
  }

// Make Model

}

class UserTb {
  int? id;
  String? name;
  String? password;
  String? email;

  UserTb({this.id, this.name, this.password, this.email});

  factory UserTb.fromJson(Map<String, dynamic> json) {
    return UserTb(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
    );
  }
}
