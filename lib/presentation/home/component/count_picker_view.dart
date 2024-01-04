import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/home/component/complete_button_holder.dart';

class CountPickerView extends StatelessWidget {
  final String _title;
  final int _maximumCount;
  final Function(int) _actionComplete;
  final FixedExtentScrollController _controller;

  CountPickerView({
    super.key,
    required String title,
    required int initValue,
    required int maximumCount,
    required Function(int) actionComplete,
  })  : _title = title,
        _controller = FixedExtentScrollController(initialItem: initValue - 1),
        _maximumCount = maximumCount,
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
            child: CupertinoPicker.builder(
              scrollController: _controller,
              childCount: _maximumCount,
              itemExtent: 50,
              onSelectedItemChanged: null,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    '${index + 1}',
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 40.h,
            child: CompleteButtonHolder(
              onClick: () {
                _actionComplete(_controller.selectedItem + 1);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
