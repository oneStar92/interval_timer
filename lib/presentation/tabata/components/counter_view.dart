import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/tabata/components/counter_view_holder.dart';
import 'package:tabata_timer/presentation/tabata/components/total_timer_view_holder.dart';

final class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = 80.0.h;
    const width = double.infinity;
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height,
            width: 70.w,
            child: const CounterViewHolder(
              kind: CounterViewHolderKind.round,
            ),
          ),
          const Expanded(child: TotalTimerViewHolder()),
          SizedBox(
            height: height,
            width: 70.w,
            child: const CounterViewHolder(
              kind: CounterViewHolderKind.cycle,
            ),
          ),
        ],
      ),
    );
  }
}
