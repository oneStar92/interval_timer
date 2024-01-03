import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/view/timer_view_holder.dart';

final class CurrentTimerView<T extends ChangeNotifier> extends StatelessWidget {
  final String Function(BuildContext, T) _currentTitleSelector;
  final Time Function(BuildContext, T) _currentTimeSelector;

  const CurrentTimerView({
    super.key,
    required String Function(BuildContext, T) currentTitleSelector,
    required Time Function(BuildContext, T) currentTimeSelector,
  })  : _currentTitleSelector = currentTitleSelector,
        _currentTimeSelector = currentTimeSelector;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Selector<T, String>(
            selector: _currentTitleSelector,
            builder: (_, title, child) {
              return Text(
                title,
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              );
            }),
        TimerViewHolder(
          textStyle: TextStyle(
            fontSize: 96.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          selector: _currentTimeSelector,
        ),
      ],
    );
  }
}
