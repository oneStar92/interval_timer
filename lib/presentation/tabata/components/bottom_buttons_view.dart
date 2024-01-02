import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/tabata/components/icon_button_holder.dart';

class BottomButtonsView extends StatelessWidget {
  final Function()? actionPrevious;
  final Function()? actionPlay;
  final Function()? actionNext;

  const BottomButtonsView({
    super.key,
    this.actionPrevious,
    this.actionPlay,
    this.actionNext,
  });

  @override
  Widget build(BuildContext context) {
    final height = 50.0.h;
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
            width: height,
            child: IconButtonHolder(
              onClick: actionPrevious,
              icon: Icons.keyboard_double_arrow_left,
            ),
          ),
          SizedBox(
            height: height,
            width: height,
            child: IconButtonHolder(
              onClick: actionPlay,
              icon: Icons.play_arrow,
            ),
          ),
          SizedBox(
            height: height,
            width: height,
            child: IconButtonHolder(
              onClick: actionNext,
              icon: Icons.keyboard_double_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
