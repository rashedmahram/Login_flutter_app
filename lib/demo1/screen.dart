import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Data {
  int? id;
  String? name;
  String? password;
  String? email;

  Data({this.id, this.name, this.password, this.email});
  
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
  }

}
class MyData{
  int? id;
  String? name;
  String? password;
  String? email;

  MyData({this.id, this.name, this.password, this.email});
  // MyData(Map<String,dynamic> json){
  //   id = json['id'];
  //   name = json['name'];
  //   password = json['password'];
  //   email = json['email'];
  // }
  MyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
  }
}

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: fetchData,child: Text("Press me"),),
      ),
    );
  }


  fetchData()async{
    String url="http://192.168.1.102:3000/Users";
    var response= await get(Uri.parse(url));
    
    print(response.runtimeType);
    var jsonString='[{ "id": 0,"name": "Rasheed","password": "123","email": "Hazelrasheed@gmail.com"}]';
    var decodeJson=json.decode(jsonString);
    var user=MyData.fromJson(decodeJson[0]);
    print("${user.name}");


    var jsonContent=response.body;
    var decodedJson=json.decode(jsonContent);
    var user1=MyData.fromJson(decodedJson[0]);
    print(user1.email);
  }
}
