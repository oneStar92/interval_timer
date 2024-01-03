import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/tabata/components/icon_button_holder.dart';

class BottomButtonsView extends StatelessWidget {
  final Function()? actionPlay;

  const BottomButtonsView({
    super.key,
    this.actionPlay,
  });

  @override
  Widget build(BuildContext context) {
    final height = 100.0.h;
    const width = double.infinity;
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: 80.h,
          width: 80.h,
          child: IconButtonHolder(
            onClick: actionPlay,
            icon: Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
