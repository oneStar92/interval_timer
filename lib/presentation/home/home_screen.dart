import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/custom_colors.dart';
import 'package:tabata_timer/presentation/home/component/count_picker_view.dart';
import 'package:tabata_timer/presentation/home/component/count_setting_view.dart';
import 'package:tabata_timer/presentation/home/component/tabata_start_button_holder.dart';
import 'package:tabata_timer/presentation/home/component/time_picker_view.dart';
import 'package:tabata_timer/presentation/home/component/time_setting_view.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';

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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: REdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: TabataElement.values.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.blueColor,
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                  child: TabataStartButtonHolder<HomeViewModel>(
                    timeSelector: (_, viewModel) => viewModel.totalTime,
                  ),
                );
              } else {
                final element = TabataElement.values[index - 1];
                if (element == TabataElement.cycle || element == TabataElement.round) {
                  return CountSettingView<HomeViewModel>(
                    element: element,
                    actionIncrease: () => context.read<HomeViewModel>().increase(element: element),
                    actionDecrease: () => context.read<HomeViewModel>().decrease(element: element),
                    actionChangeCount: (count) => context.read<HomeViewModel>().updateCount(element, value: count),
                    showCountPicker: () => _showCountPickerView(context, element),
                    countSelector: (_, viewModel) => viewModel.getCountOf(element),
                  );
                } else {
                  return TimeSettingView<HomeViewModel>(
                    element: element,
                    actionIncrease: () => context.read<HomeViewModel>().increase(element: element),
                    actionDecrease: () => context.read<HomeViewModel>().decrease(element: element),
                    timeSelector: (_, viewModel) => viewModel.getTimeOf(element),
                    showTimerPicker: () => _showTimePickerView(context, element),
                  );
                }
              }
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 8.0.h,
                color: Colors.transparent,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showCountPickerView(BuildContext context, TabataElement element) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: ScreenUtil().screenHeight * 0.33,
          child: CountPickerView(
            title: element.toString(),
            initValue: context.read<HomeViewModel>().getIntegerCountOf(element),
            actionComplete: (value) => context.read<HomeViewModel>().updateCount(element, value: value),
            maximumCount: context.read<HomeViewModel>().getMaximumCountOf(element),
          ),
        );
      },
    );
  }

  Future<void> _showTimePickerView(BuildContext context, TabataElement element) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: ScreenUtil().screenHeight * 0.33,
          child: TimePickerView(
            title: element.toString(),
            initMinute: context.read<HomeViewModel>().getIntegerMinuteOf(element),
            initSecond: context.read<HomeViewModel>().getIntegerSecondOf(element),
            actionComplete: (minute, second) => context.read<HomeViewModel>().updateTime(
                  element,
                  minute: minute,
                  second: second,
                ),
          ),
        );
      },
    );
  }
}
