import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/custom_colors.dart';
import 'package:tabata_timer/common/di/view_model_container.dart';
import 'package:tabata_timer/presentation/home/component/count_picker_view.dart';
import 'package:tabata_timer/presentation/home/component/count_setting_view.dart';
import 'package:tabata_timer/presentation/home/component/tabata_start_button_holder.dart';
import 'package:tabata_timer/presentation/home/component/time_picker_view.dart';
import 'package:tabata_timer/presentation/home/component/time_setting_view.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:tabata_timer/domain/model/tabata_element.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view_model.dart';

class HomeScreen extends StatelessWidget {
  final FToast _fToast = FToast();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _fToast.init(context);
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
                    onClick: () => _pushTabataView(context),
                  ),
                );
              } else {
                final element = TabataElement.values[index - 1];
                if (element == TabataElement.cycle || element == TabataElement.round) {
                  return CountSettingView<HomeViewModel>(
                    element: element,
                    actionIncrease: () => context.read<HomeViewModel>().increase(
                          element: element,
                          onError: (message) => _showErrorToast(message: message),
                        ),
                    actionDecrease: () => context.read<HomeViewModel>().decrease(
                          element: element,
                          onError: (message) => _showErrorToast(message: message),
                        ),
                    showCountPicker: () => _showCountPickerView(context, element),
                    countSelector: (_, viewModel) => viewModel.getCountOf(element),
                  );
                } else {
                  return TimeSettingView<HomeViewModel>(
                    element: element,
                    actionIncrease: () => context.read<HomeViewModel>().increase(
                          element: element,
                          onError: (message) => _showErrorToast(message: message),
                        ),
                    actionDecrease: () => context.read<HomeViewModel>().decrease(
                          element: element,
                          onError: (message) => _showErrorToast(message: message),
                        ),
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
      builder: (_) {
        return SizedBox(
          height: ScreenUtil().screenHeight * 0.33,
          child: CountPickerView(
            title: element.toString(),
            initValue: context.read<HomeViewModel>().getIntegerCountOf(element),
            actionComplete: (value) => context.read<HomeViewModel>().updateCount(
              element,
              value: value,
              onError: (message) {
                _showErrorToast(message: message);
              },
            ),
            maximumCount: context.read<HomeViewModel>().getMaximumCountOf(element),
          ),
        );
      },
    );
  }

  Future<void> _showTimePickerView(BuildContext context, TabataElement element) {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
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
              onError: (message) {
                _showErrorToast(message: message);
              },
            ),
          ),
        );
      },
    );
  }

  void _showErrorToast({required String message}) {
    _fToast.removeCustomToast();
    _fToast.showToast(
      child: _createToast(message: message),
      toastDuration: const Duration(seconds: 1),
      positionedToastBuilder: (context, child) {
        return Positioned(
          left: 16.0.w,
          bottom: 70.0.h,
          right: 16.0.w,
          child: child,
        );
      },
    );
  }

  Widget _createToast({required String message}) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0).r,
        color: Colors.black,
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: 18.0.sp, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }

  void _pushTabataView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<TabataViewModel>(
          create: (_) => ViewModelContainer.createTabataViewModel(tabata: context.read<HomeViewModel>().tabata),
          child: const TabataView(),
        ),
      ),
    );
  }
}
