import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';

final class CustomAlertDialog extends StatelessWidget {
  final String _title;
  final String _content;
  final Function() _okAction;

  const CustomAlertDialog({
    super.key,
    required String title,
    required String content,
    required Function() okAction,
  })  : _title = title,
        _content = content,
        _okAction = okAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        _title,
        style: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Text(
        _content,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: _okAction,
                child: Text(
                  okTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  noTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
