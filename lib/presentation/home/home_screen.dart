import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/di/view_model_provider.dart';
import 'package:tabata_timer/presentation/home/component/exercise_start_button.dart';
import 'package:tabata_timer/presentation/home/component/tabata_elements_list_item_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(appTitle),
        titleSpacing: 16.0.h,
        titleTextStyle: TextStyle(
          fontSize: 40.sp,
          fontFamily: 'Suite',
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: sectionCount + 1,
            itemBuilder: (context, section) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
                child: section == 0
                    ? const ExerciseStartButton()
                    : LayoutBuilder(
                        builder: (context, constraint) {
                          final rowCount = homeScreenRowsGroupedBySection[section - 1].length;
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
                                  viewModel: listItemViewModels[section - 1][row],
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