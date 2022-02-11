import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class UserModel{

  final int id,age;
  final String name;


  UserModel({
    required this.id,
    required this.name,
    required this.age,
  });



  Map<String,dynamic>toMap(){
    return{
      'id':id,
      'name':name,
      'age':age,
    };
  }



  @override
  String toString(){
    return 'User{id: $id, name: $name, age: $age}';
  }

}





class UserRegister extends StatefulWidget {
  const UserRegister({ Key? key }) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    
    return Container(

    );
  }
}