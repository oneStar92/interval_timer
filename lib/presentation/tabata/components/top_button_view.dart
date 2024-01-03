import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/tabata/components/icon_button_holder.dart';

final class TopButtonView extends StatelessWidget {
  final Function() actionReset;
  final Function() actionCancel;

  const TopButtonView({
    super.key,
    required this.actionReset,
    required this.actionCancel,
  });

  @override
  Widget build(BuildContext context) {
    final height = 50.0.h;
    final width = ScreenUtil().screenWidth;
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height,
            width: height,
            child: IconButtonHolder(
              onClick: actionCancel,
              icon: Icons.cancel,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: height,
            width: height,
            child: IconButtonHolder(
              onClick: actionReset,
              icon: CupertinoIcons.arrow_clockwise_circle_fill,
            ),
          ),
        ],
      ),
    );
  }
}
