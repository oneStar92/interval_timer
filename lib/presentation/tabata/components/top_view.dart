import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/tabata/components/remaining_counter_view_holder.dart';
import 'package:tabata_timer/presentation/view/timer_view_holder.dart';

final class TopView<T extends ChangeNotifier> extends StatelessWidget {
  final RemainingCount Function(BuildContext, T) _roundCountSelector;
  final RemainingCount Function(BuildContext, T) _cycleCountSelector;
  final Time Function(BuildContext, T) _totalTimeSelector;

  const TopView({
    super.key,
    required RemainingCount Function(BuildContext, T) roundCountSelector,
    required RemainingCount Function(BuildContext, T) cycleCountSelector,
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
            child: RemainingCounterViewHolder<T>(
              title: roundCountTitle,
              selector: _roundCountSelector,
            ),
          ),
          Expanded(
            child: TimerViewHolder<T>(
              textStyle: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              selector: _totalTimeSelector,
            ),
          ),
          SizedBox(
            height: height,
            width: 70.w,
            child: RemainingCounterViewHolder<T>(
              title: cycleCountTitle,
              selector: _cycleCountSelector,
            ),
          ),
        ],
      ),
    );
  }
}
