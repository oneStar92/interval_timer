import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class RemainingCounterViewHolder<T extends ChangeNotifier> extends BaseViewHolder {
  final String _title;
  final RemainingCount Function(BuildContext, T) _selector;

  const RemainingCounterViewHolder({
    super.key,
    super.onClick,
    required String title,
    required RemainingCount Function(BuildContext, T) selector,
  })  : _title = title,
        _selector = selector;

  @override
  Widget createContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            _title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Selector<T, RemainingCount>(
              selector: _selector,
              builder: (context, count, child) {
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontFamily: 'Suite'),
                    children: [
                      TextSpan(
                        text: count.current,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '/${count.max}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
