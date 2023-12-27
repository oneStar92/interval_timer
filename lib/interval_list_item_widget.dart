import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntervalListItem extends StatelessWidget {
  const IntervalListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: ScreenUtil().screenWidth,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '준비',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFFE812),
              fontSize: 22.sp,
              fontFamily: 'Suite',
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.remove,
                  size: 30.h,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Text(
                  '00:00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFFE812),
                    fontSize: 32.sp,
                    fontFamily: 'Suite',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.add,
                  size: 30.h,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
