import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/common/custom_colors.dart';
import 'package:tabata_timer/presentation/tabata/components/bottom_buttons_view.dart';
import 'package:tabata_timer/presentation/tabata/components/top_view.dart';
import 'package:tabata_timer/presentation/tabata/components/current_timer_view.dart';
import 'package:tabata_timer/presentation/tabata/components/top_button_view.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view_model.dart';

final class TabataView extends StatelessWidget {
  const TabataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.getColorOf(context.watch<TabataViewModel>().currentState),
      body: SafeArea(
        child: Container(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopView<TabataViewModel>(
                roundCountSelector: (_, viewModel) => viewModel.round,
                cycleCountSelector: (_, viewModel) => viewModel.cycle,
                totalTimeSelector: (_, viewModel) => viewModel.remainingTime,
              ),
              TopButtonView(
                actionReset: () {
                  context.read<TabataViewModel>().reset();
                },
                actionCancel: () {},
              ),
              Expanded(
                child: CurrentTimerView<TabataViewModel>(
                  currentTimeSelector: (context, viewModel) => viewModel.currentTime,
                  currentTitleSelector: (context, viewModel) => viewModel.currentState.toString(),
                ),
              ),
              BottomButtonsView<TabataViewModel>(
                actionPlay: () {
                  context.read<TabataViewModel>().start();
                },
                actionPause: () {
                  context.read<TabataViewModel>().pause();
                },
                startButtonSelector: (_, viewModel) => viewModel.isPlaying,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
