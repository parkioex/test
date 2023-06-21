import 'package:flutter/material.dart';
import 'package:test_swiftdynamic/data.dart';
import 'package:test_swiftdynamic/screen/contact.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Datas>(
      create: (context) => Datas(),
      child: MaterialApp(
        home: contactScreen(),
      ),
    );
  }
}
