import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class TotalTimerViewHolder<T extends ChangeNotifier> extends BaseViewHolder {
  final Time Function(BuildContext, T) _selector;

  const TotalTimerViewHolder({
    super.key,
    super.onClick,
    required Time Function(BuildContext, T) selector,
  }) : _selector = selector;

  @override
  Widget createContent(BuildContext context) {
    return Selector<T, Time>(
        selector: _selector,
        builder: (_, remainingTime, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  remainingTime.minute,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                ':',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  remainingTime.second,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
