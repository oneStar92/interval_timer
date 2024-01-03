import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class TimerViewHolder<T extends ChangeNotifier> extends BaseViewHolder {
  final TextStyle _textStyle;
  final Time Function(BuildContext, T) _selector;

  const TimerViewHolder({
    super.key,
    super.onClick,
    required TextStyle textStyle,
    required Time Function(BuildContext, T) selector,
  })  : _textStyle = textStyle,
        _selector = selector;

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
                  style: _textStyle,
                ),
              ),
              Text(
                ':',
                textAlign: TextAlign.center,
                style: _textStyle,
              ),
              Expanded(
                child: Text(
                  remainingTime.second,
                  textAlign: TextAlign.left,
                  style: _textStyle,
                ),
              ),
            ],
          );
        });
  }
}
