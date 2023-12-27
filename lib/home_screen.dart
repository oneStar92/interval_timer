import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interval_timer/interval_list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text('인터벌'),
        titleSpacing: 16.0,
        titleTextStyle: TextStyle(
          fontSize: 40,
          fontFamily: 'Suite',
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
          child: Stack(
            children: [
              Positioned.fill(
                child: ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    // return IntervalListItem();
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
                      child: Container(
                        height: (85.h * dummyData[index]) + (1.0 * (dummyData[index] - 1)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10).w
                        ),
                        child: ListView.separated(
                          itemCount: dummyData[index],
                          itemBuilder: (context, index) {
                            return IntervalListItem();
                          },
                          separatorBuilder: (context, index) {
                            return Divider(height: 1.0,);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<int> dummyData = [1, 3, 2];