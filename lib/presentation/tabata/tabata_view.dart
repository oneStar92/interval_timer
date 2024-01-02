import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/tabata/components/bottom_buttons_view.dart';
import 'package:tabata_timer/presentation/tabata/components/counter_view.dart';
import 'package:tabata_timer/presentation/tabata/components/current_timer_view_holder.dart';
import 'package:tabata_timer/presentation/tabata/components/top_button_view.dart';

final class TabataView extends StatelessWidget {
  const TabataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Container(
          padding: REdgeInsets.all(16.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CounterView(),
              TopButtonView(),
              Expanded(child: CurrentTimerViewHolder()),
              BottomButtonsView(),
            ],
          ),
        ),
      ),
    );
  }
}
