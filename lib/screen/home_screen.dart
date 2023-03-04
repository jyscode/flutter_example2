import 'dart:math';

import 'package:example2/const/color.dart';
import 'package:example2/screen/settings_screen.dart';
import 'package:flutter/material.dart';

// riverpod으로 상태관리 해보기, settings_screen  코드 정리
// GetX

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumber = [123, 456, 789];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _TopPart(onPressed: onSettingsPressed),
              _MiddlePart(randomNumber: randomNumber),
              _BottomPart(onPressed: onButtonPressed),

            ],
          ),
        ),
      ),
    );
  }

  void onSettingsPressed() async {
    final int? result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (_) => SettingsScreen(),
      ),
    );
    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }

  void onButtonPressed() {
    randomNumber = [];
    for (int i = 0; i < 3; i++) {
      final num = Random().nextInt(maxNumber);
      randomNumber.add(num);
    }
    print(randomNumber);
    setState(() {});
  }
}

class _TopPart extends StatelessWidget {
  final VoidCallback onPressed;

  const _TopPart({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.settings,
          ),
          color: RED_COLOR,
        ),
      ],
    );
  }
}

class _MiddlePart extends StatelessWidget {
  final List<int> randomNumber;

  const _MiddlePart({
    required this.randomNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: randomNumber
              .map(
                (e) =>
                Row(
                  children: e
                      .toString()
                      .split('')
                      .map(
                        (y) =>
                        Image.asset(
                          'asset/img/$y.png',
                          width: 50,
                          height: 70,
                        ),
                  )
                      .toList(),
// [Image.asset, Image.asset, Image.asset]
                ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  final VoidCallback onPressed;

  const _BottomPart({required this.onPressed, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
        '생성하기',
      ),
      style: ElevatedButton.styleFrom(
        primary: RED_COLOR,
      ),
    ),);
  }
}
