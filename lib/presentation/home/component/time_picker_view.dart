import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/home/component/complete_button_holder.dart';

class TimePickerView extends StatelessWidget {
  final String _title;
  final Function(int, int) _actionComplete;
  final FixedExtentScrollController _minuteController;
  final FixedExtentScrollController _secondController;

  TimePickerView({
    super.key,
    required String title,
    int initMinute = 0,
    int initSecond = 0,
    required Function(int, int) actionComplete,
  })  : _title = title,
        _minuteController = FixedExtentScrollController(initialItem: initMinute),
        _secondController = FixedExtentScrollController(initialItem: initSecond),
        _actionComplete = actionComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            _title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Suite',
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _minuteController,
                    childCount: maximumMinute,
                    itemExtent: 50,
                    onSelectedItemChanged: null,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          '$index',
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  '분',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Suite',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _secondController,
                    childCount: maximumSeconds,
                    itemExtent: 50,
                    onSelectedItemChanged: null,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          '$index',
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  '초',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Suite',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
            child: CompleteButtonHolder(
              onClick: () {
                _actionComplete(_minuteController.selectedItem, _secondController.selectedItem);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
