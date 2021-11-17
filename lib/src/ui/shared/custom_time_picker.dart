import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toto_app/src/utils/theme.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeSelected;
  const CustomTimePicker({
    required this.initialTime,
    required this.onTimeSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late TimeOfDay _seletedTime;

  @override
  void initState() {
    super.initState();
    _seletedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _seletedTime.format(context),
          style: TextStyle(fontSize: 16.sp),
        ),
        IconButton(
          onPressed: () async {
            final selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (context, child) {
                return AppTheme.dialogTheme(child as Widget);
              },
            );
            setState(() {
              _seletedTime = selectedTime ?? TimeOfDay.now();
              widget.onTimeSelected(_seletedTime);
            });
          },
          icon: const Icon(Icons.schedule_rounded),
        ),
      ],
    );
  }
}