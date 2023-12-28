import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntervalListItem extends StatelessWidget {
  const IntervalListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '준비',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFFFFE812),
                  fontSize: 26.sp,
                  fontFamily: 'Suite',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: const FittedBox(
                  child: Icon(Icons.remove),
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '00:00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.sp,
                  fontFamily: 'Suite',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: const FittedBox(
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
