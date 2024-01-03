import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class CurrentTimerViewHolder<T extends ChangeNotifier> extends BaseViewHolder {
  final String Function(BuildContext, T) _currentTitleSelector;
  final Time Function(BuildContext, T) _currentTimeSelector;

  const CurrentTimerViewHolder({
    super.key,
    required String Function(BuildContext, T) currentTitleSelector,
    required Time Function(BuildContext, T) currentTimeSelector,
  })  : _currentTitleSelector = currentTitleSelector,
        _currentTimeSelector = currentTimeSelector;

  @override
  Widget createContent(BuildContext context) {
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
        Selector<T, Time>(
            selector: _currentTimeSelector,
            builder: (_, time, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      time.minute,
                      style: TextStyle(
                        fontSize: 96.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontSize: 96.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Text(
                      time.second,
                      style: TextStyle(
                        fontSize: 96.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
