import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class CurrentTimerViewHolder extends BaseViewHolder {
  const CurrentTimerViewHolder({
    super.key,
    super.onClick,
  });

  @override
  Widget createContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '준비',
          style: TextStyle(
            fontSize: 64.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '00',
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
                '05',
                style: TextStyle(
                  fontSize: 96.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
