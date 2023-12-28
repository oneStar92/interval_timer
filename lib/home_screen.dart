import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interval_timer/view_model/home_view_model.dart';
import 'package:interval_timer/Widget/exercise_start_button.dart';
import 'package:interval_timer/Tabata_list_item_view.dart';
import 'package:provider/provider.dart';

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
            itemCount: context.read<HomeViewModel>().sectionCount + 1,
            itemBuilder: (context, section) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
                child: section == 0
                    ? const ExerciseStartButton()
                    : LayoutBuilder(
                        builder: (context, constraint) {
                          final rowCount = context.read<HomeViewModel>().countOfRow(section: section - 1);
                          final height = (85.h * rowCount) + (1.0 * (rowCount - 1));
                          return Container(
                            height: height,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10).w,
                            ),
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: rowCount,
                              itemBuilder: (context, row) {
                                return TabataElementsListItemView(
                                  viewModel: context.read<HomeViewModel>().listItemViewModels[section - 1][row],
                                );
                              },
                              separatorBuilder: (_, index) {
                                return const Divider(height: 1.0);
                              },
                            ),
                          );
                        },
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}