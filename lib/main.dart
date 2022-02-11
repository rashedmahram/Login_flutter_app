import 'package:demo_app/login.dart';
import 'package:demo_app/sqlite_example/acounts/login_page.dart';
import 'package:flutter/material.dart';

import 'websocket_app/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
final routs={
  '/':(BuildContext context)=> new LoginPageSqflite(),
};
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      // home:  const HomeScreen(title: 'Chat',),
      routes: routs,
    );
  }
}
