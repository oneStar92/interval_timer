import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interval_timer/interval_list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('인터벌'),
        titleSpacing: 16.0.h,
        titleTextStyle: TextStyle(
          fontSize: 40.sp,
          fontFamily: 'Suite',
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
                child: index != 3
                    ? Container(
                        height: (85.h * dummyData[index]) + (1.0 * (dummyData[index] - 1)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10).w,
                        ),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dummyData[index],
                          itemBuilder: (context, index) {
                            return const IntervalListItem();
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 1.0,
                            );
                          },
                        ),
                      )
                    : Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0085FF),
                          borderRadius: BorderRadius.circular(10).w,
                        ),
                        child: Padding(
                          padding: REdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30.w,
                                width: 30.w,
                                child: const FittedBox(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: REdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '운동 시작',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28.sp,
                                      fontFamily: 'Suite',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '12:40',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontFamily: 'Suite',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

final List<int> dummyData = [1, 3, 2];