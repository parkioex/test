import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_swiftdynamic/data.dart';

class inputScreen extends StatefulWidget {
  @override
  State<inputScreen> createState() => _inputScreenState();
}

class _inputScreenState extends State<inputScreen> {
  int _index = 0;
  late String newname;
  late String newprovince;
  late String newdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('กรอกข้อมูล'),
      ),
      body: Center(
        child: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            } else if (_index == 0) {
              Navigator.pop(context);
            }
          },
          onStepContinue: () {
            if (_index <= 1) {
              setState(() {
                _index += 1;
              });
            } else if (_index == 2) {
              setState(() {
                Provider.of<Datas>(context, listen: false)
                    .addName(newname, newprovince, newdata);
                Navigator.pop(context);
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('ชื่อ นามสกุล'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    onChanged: (value) {
                      newname = value;
                    },
                  )),
            ),
            Step(
              title: Text('จังหวัด'),
              content: TextField(
                onChanged: (value2) {
                  newprovince = value2;
                },
              ),
            ),
            Step(
              title: Text('ที่อยู่ตามบัตรประชาชน'),
              content: TextField(
                onChanged: (value3) {
                  newdata = value3;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
