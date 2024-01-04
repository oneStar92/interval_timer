import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/custom_colors.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';
import 'package:tabata_timer/presentation/view/count_view_holder.dart';
import 'package:tabata_timer/presentation/view/icon_button_holder.dart';

class CountSettingView<T extends ChangeNotifier> extends StatelessWidget {
  final TabataElement _element;
  final Function() _actionIncrease;
  final Function() _actionDecrease;
  final String Function(BuildContext, T) _countSelector;
  final Function() _showCountPicker;

  const CountSettingView({
    super.key,
    required TabataElement element,
    required Function() actionIncrease,
    required Function() actionDecrease,
    required String Function(BuildContext, T) countSelector,
    required Function(int) actionChangeCount,
    required Function() showCountPicker,
  })  : _element = element,
        _actionIncrease = actionIncrease,
        _actionDecrease = actionDecrease,
        _countSelector = countSelector,
        _showCountPicker = showCountPicker;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: double.infinity,
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).w,
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              _element.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: CustomColors.getColorOf(_element),
                fontSize: 18.sp,
                fontFamily: 'Suite',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
            width: 20.w,
            child: IconButtonHolder(
              icon: Icons.remove,
              onClick: _actionDecrease,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 100.w,
            child: CountViewHolder(
              onClick: _showCountPicker,
              textStyle: TextStyle(
                fontSize: 40.sp,
                fontFamily: 'Suite',
                fontWeight: FontWeight.w800,
              ),
              selector: _countSelector,
            ),
          ),
          SizedBox(
            height: 20.w,
            width: 20.w,
            child: IconButtonHolder(
              icon: Icons.add,
              onClick: _actionIncrease,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
