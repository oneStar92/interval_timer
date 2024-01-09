import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

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
          height: 40.h,
          width: 40.h,
          child: const FittedBox(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
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
        Expanded(
          child: Selector<T, Time>(
            selector: _timeSelector,
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
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontFamily: 'Suite',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    ':',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontFamily: 'Suite',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      remainingTime.second,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontFamily: 'Suite',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
