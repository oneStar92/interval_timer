import 'package:flutter/material.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class IconButtonHolder extends BaseViewHolder {
  final IconData _icon;
  final Color _color;

  const IconButtonHolder({
    super.key,
    super.onClick,
    required IconData icon,
    required Color color,
  })  : _icon = icon,
        _color = color;

  @override
  Widget createContent(BuildContext context) {
    return FittedBox(
      child: Icon(
        _icon,
        color: _color,
      ),
    );
  }
}
