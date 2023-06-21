import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class detailScreen extends StatelessWidget {
  detailScreen({required this.name, required this.detail, required this.data});
  late String detail;
  late String name;
  late String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดข้อมูล'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(data),
          Text(detail)
        ],
      ),
    );
  }
}
