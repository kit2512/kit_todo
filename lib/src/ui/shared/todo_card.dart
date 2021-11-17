import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:toto_app/src/resources/data/models.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final Function onFinished;
  final Function onEditTapped;
  final Function onTapped;

  const TodoCard({
    required this.todo,
    required this.onFinished,
    required this.onEditTapped,
    required this.onTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat _formatTime = DateFormat("HH:mm");
    final DateFormat _formatDay = DateFormat("dd MMM yyyy");
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: todo.color,
        ),
        padding: EdgeInsets.only(
          top: 18.h,
          bottom: 18.h,
          left: 23.w,
          right: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.name,
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/edit.svg",
                  width: 24.w,
                ),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          _formatDay.format(todo.dueDate).toString(),
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.schedule_rounded, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          _formatTime.format(todo.dueDate).toString(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/check_undone.svg",
                  width: 24.w,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
