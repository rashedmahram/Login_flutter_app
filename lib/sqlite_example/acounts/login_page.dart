import 'package:flutter/material.dart';

class LoginPageSqflite extends StatefulWidget {
  const LoginPageSqflite({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageSqflite> {

  late BuildContext _ctx;
  late String name,password;

  final formKey=new GlobalKey<FormState>();
  final scaffoldKey=new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Login"),
      ),
    );
  }
}
