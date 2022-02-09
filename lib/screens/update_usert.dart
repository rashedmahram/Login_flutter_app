import 'dart:convert';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
    _futureUser = fetchUsers();
  }

  final TextEditingController _controller = TextEditingController();
  late Future<UserTb> _futureUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<UserTb>(
          future: _futureUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${snapshot.data!.name}"),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureUser = updateUser(_controller.text,"1");
                        });
                      },
                      child: const Text('Update Data'),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<UserTb> updateUser(String name, String id, {String? password}) async {
    String url = "http://192.168.1.102:3000/Users/${id}";
    final res = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id':id,
        'name': name,
        'email':"Ho@h.com",
      }),
    );
    if (res.statusCode == 200) {
      return UserTb.fromJson(jsonDecode(res.body)[0]);
    } else {
      throw Exception('No valid request');
    }
  }

  Future<UserTb> fetchUsers() async {
    String url = "http://192.168.1.102:3000/Users";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return UserTb.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Fail to load users');
    }
  }
}
