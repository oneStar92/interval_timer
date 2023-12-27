import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text('인터벌'),
        titleSpacing: 16.0,
        titleTextStyle: TextStyle(
          fontSize: 40,
          fontFamily: 'Suite',
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
