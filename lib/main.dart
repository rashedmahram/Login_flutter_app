import 'package:flutter/material.dart';

import 'screens/update_usert.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:  const UpdateScreen(),
    );
  }
}
