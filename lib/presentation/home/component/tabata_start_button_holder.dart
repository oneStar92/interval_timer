import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';
import 'package:tabata_timer/presentation/view/timer_view_holder.dart';

class TabataStartButtonHolder<T extends ChangeNotifier> extends BaseViewHolder {
  final Time Function(BuildContext, T) _timeSelector;

  const TabataStartButtonHolder({
    super.key,
    super.onClick,
    required Time Function(BuildContext, T) timeSelector,
  }) : _timeSelector = timeSelector;

  @override
  Widget createContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30.w,
          width: 30.w,
          child: const FittedBox(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              exerciseButtonTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontFamily: 'Suite',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 120.w,
          child: TimerViewHolder(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontFamily: 'Suite',
              fontWeight: FontWeight.w500,
            ),
            selector: _timeSelector,
          ),
        ),
      ],
    );
  }
}