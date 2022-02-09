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
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  late Future<Data> userFutur;
  @override
  void initState() {
    super.initState();
    userFutur=fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Data>(builder: (context,snapShot){
          if (snapShot.hasData) {
            return UserInfo(snapShot: snapShot,);
          } else {
            return Text("${snapShot.error}");
          }
        },future:userFutur ,)
        // TextButton(onPressed: fetchData,child: Text("Press me"),),
      ),
    );
  }


  Future<Data> fetchData()async{
    String url="http://192.168.1.102:3000/Users";
    var response= await get(Uri.parse(url));
    
    if (response.statusCode==200) {
      var i= json.decode(response.body);
      var k= Data.fromJson(i[0]);
      return k;
    } 
    else{
      throw Exception("NO Internet Connection");
    }

  }
}

class UserInfo extends StatelessWidget {
  final snapShot;
  const UserInfo({
    Key? key,
    required this.snapShot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DataRow(title:"id",data:snapShot.data.id),
        DataRow(title:"name",data:snapShot.data.name),
        DataRow(title:"password",data:snapShot.data.password),

      ],
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({
    Key? key, this.title, this.data,

  }) : super(key: key);


  final title,data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${title}: "),
        Text("${data}"),
      ],
    );
  }
}
