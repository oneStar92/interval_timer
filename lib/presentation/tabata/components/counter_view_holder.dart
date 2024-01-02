import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

enum CounterViewHolderKind {
  round,
  cycle;

  String get title => this == CounterViewHolderKind.round ? '라운드' : '사이클';
}

final class CounterViewHolder extends BaseViewHolder {
  final CounterViewHolderKind _kind;

  const CounterViewHolder({
    super.key,
    super.onClick,
    required CounterViewHolderKind kind,
  }) : _kind = kind;

  @override
  Widget createContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            _kind.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(fontFamily: 'Suite'),
              children: [
                TextSpan(
                  text: '1',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: '/12',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}