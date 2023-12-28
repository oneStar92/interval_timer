import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interval_timer/view_model/home_view_model.dart';
import 'package:interval_timer/view_model/list_item_view_model.dart';
import 'package:provider/provider.dart';

class TabataElementsListItemView extends StatelessWidget {
  final ListItemViewModel viewModel;

  const TabataElementsListItemView({
    super.key,
    required this.viewModel,
  });

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
                viewModel.element.theme.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(viewModel.element.theme.color),
                  fontSize: 18.sp,
                  fontFamily: 'Suite',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<HomeViewModel>().decrease(element: viewModel.element);
              },
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
              child: Consumer<HomeViewModel>(
                builder: (context, viewModel, child) {
                  return Text(
                    viewModel.getValue(element: this.viewModel.element),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontFamily: 'Suite',
                      fontWeight: FontWeight.w800,
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<HomeViewModel>().increase(element: viewModel.element);
              },
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
