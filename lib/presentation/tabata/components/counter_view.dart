import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/tabata/components/counter_view_holder.dart';
import 'package:tabata_timer/presentation/tabata/components/total_timer_view_holder.dart';

final class CounterView<T extends ChangeNotifier> extends StatelessWidget {
  final Count Function(BuildContext, T) _roundCountSelector;
  final Count Function(BuildContext, T) _cycleCountSelector;
  final Time Function(BuildContext, T) _totalTimeSelector;

  const CounterView({
    super.key,
    required Count Function(BuildContext, T) roundCountSelector,
    required Count Function(BuildContext, T) cycleCountSelector,
    required Time Function(BuildContext, T) totalTimeSelector,
  })  : _roundCountSelector = roundCountSelector,
        _cycleCountSelector = cycleCountSelector,
        _totalTimeSelector = totalTimeSelector;

  @override
  Widget build(BuildContext context) {
    final height = 80.0.h;
    const width = double.infinity;
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height,
            width: 70.w,
            child: CounterViewHolder<T>(
              title: roundCountTitle,
              selector: _roundCountSelector,
            ),
          ),
          Expanded(child: TotalTimerViewHolder<T>(selector: _totalTimeSelector)),
          SizedBox(
            height: height,
            width: 70.w,
            child: CounterViewHolder<T>(
              title: cycleCountTitle,
              selector: _cycleCountSelector,
            ),
          ),
        ],
      ),
    );
  }
}
