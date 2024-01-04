import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class CompleteButtonHolder extends BaseViewHolder {
  const CompleteButtonHolder({
    super.key,
    super.onClick,
  });

  @override
  Widget createContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).w,
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          '완료',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
