import 'package:flutter/material.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class IconButtonHolder extends BaseViewHolder {
  final IconData _icon;

  const IconButtonHolder({
    super.key,
    super.onClick,
    required IconData icon,
  }) : _icon = icon;

  @override
  Widget createContent(BuildContext context) {
    return FittedBox(
      child: Icon(
        _icon,
        color: Colors.white,
      ),
    );
  }
}
