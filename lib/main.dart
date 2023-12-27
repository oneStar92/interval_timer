import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interval_timer/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //상태바 투명 처리
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Interval Timer',
          theme: ThemeData(
            fontFamily: 'Suite',
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
