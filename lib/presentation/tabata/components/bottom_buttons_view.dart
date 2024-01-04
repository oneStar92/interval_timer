import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/presentation/view/icon_button_holder.dart';

class BottomButtonsView<T extends ChangeNotifier> extends StatelessWidget {
  final bool Function(BuildContext, T) _startButtonSelector;
  final Function()? actionPlay;
  final Function()? actionPause;

  const BottomButtonsView({
    super.key,
    this.actionPlay,
    this.actionPause,
    required bool Function(BuildContext, T) startButtonSelector,
  }) : _startButtonSelector = startButtonSelector;

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
          child: Selector<T, bool>(
              selector: _startButtonSelector,
              builder: (_, isPlay, child) {
                return IconButtonHolder(
                  onClick: isPlay ? actionPause : actionPlay,
                  icon: isPlay ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                );
              }),
        ),
      ),
    );
  }
}
