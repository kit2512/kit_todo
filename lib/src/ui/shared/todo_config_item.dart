import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toto_app/src/utils/constants.dart';

class TodoConfigItem extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showDivider;
  final double? contentTopPadding;
  final double? contentBottomPadding;

  const TodoConfigItem({
    required this.title,
    required this.child,
    this.showDivider = true,
    this.contentTopPadding,
    this.contentBottomPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryLightColor,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(
          height: contentTopPadding ?? 8.h,
        ),
        child,
        SizedBox(
          height: contentBottomPadding ?? 8.h,
        ),
        if (showDivider)
          const Divider(
            color: kPrimaryLightColor,
          ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
