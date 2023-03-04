import 'package:example2/const/color.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: maxNumber.toInt()
                    .toString()
                    .split('')
                    .map((e) => Image.asset(
                          'asset/img/$e.png',
                          width: 50,
                          height: 70,
                        ))
                    .toList(),
              ),
            ),
            Slider(
              value: maxNumber,
              min: 1000,
              max: 10000,
              onChanged: (double value) {
                print(value);
                setState(() {
                  maxNumber = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(maxNumber.toInt());
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
