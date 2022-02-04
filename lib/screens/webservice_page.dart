import 'package:demo_app/constans.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  String myData="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: fetchData,child: Text("Press Me"),),
              RaisedButton(
                onPressed: fetchData,
                color: yellowColor,
                child: Text("Fetch Data"),
              ),
              RaisedButton(
                onPressed: restData,
                child: Text("Reset Data"),
              ),
              Text(myData)
            ],
          ),
        ),
      ),
    );
  }

fetchData() {
    setState(() {
      Fetch();
      // myData = d.toString() ;
    });
  }

  restData() {
    setState(() {
      myData = " ";
    });
  }

  Future<String> Fetch() async {
    var results;
    try {
      var url = Uri.parse( "https://jsonplaceholder.typicode.com/posts/1");
      var response= await get(url); 
         results =response.body.toString();
         setState(() {
           myData=results;
         });
    } catch (e) {
      return e.toString();
    }
    return results;
  }
}
