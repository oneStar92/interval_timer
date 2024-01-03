import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class CountViewHolder<T extends ChangeNotifier> extends BaseViewHolder {
  final TextStyle _textStyle;
  final String Function(BuildContext, T) _selector;

  const CountViewHolder({
    super.key,
    super.onClick,
    required TextStyle textStyle,
    required String Function(BuildContext, T) selector,
  })  : _textStyle = textStyle,
        _selector = selector;

  @override
  Widget createContent(BuildContext context) {
    return Selector<T, String>(
      selector: _selector,
      builder: (_, count, child) {
        return Text(
          count,
          textAlign: TextAlign.center,
          style: _textStyle,
        );
      },
    );
  }
}
