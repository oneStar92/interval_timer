import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/di/view_model_provider.dart';
import 'package:tabata_timer/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //상태바 투명 처리
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Tabata Timer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Suite',
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => ViewModelContainer.createHomeViewModel(),
        child: const HomeScreen(),
      ),
    );
  }
}
