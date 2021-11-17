import 'package:flutter/material.dart';
import 'package:toto_app/src/resources/data/models.dart';
import 'package:toto_app/src/ui/shared/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // TODO: Replace this demo
  Todo _todo = Todo(id: 1, name: "LOL", dueDate: DateTime.now());

  void onColorSelected(Color color) {
    setState(() {
      _todo.color = color;
    });
  }

  void onDateSelected(DateTime date) {
    setState(() {
      _todo.dueDate = date;
    });
  }

  void onTimeSelected(TimeOfDay time) {
    setState(() {
      _todo.dueTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.only(
          top: 14.h,
          bottom: 30.h,
          left: 20.w,
          right: 20.w,
        ),
        children: [
          TodoConfigItem(
            title: "Task name",
            contentBottomPadding: 8.h,
            contentTopPadding: 8.h,
            child: TextField(
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          TodoConfigItem(
            title: "Color",
            child: CustomColorPicker(
              onColorSelected: onColorSelected,
            ),
          ),
          TodoConfigItem(
            title: "Due date",
            child: CustomDatePicker(
              initialDate: _todo.dueDate,
              onDateSeleted1: onDateSelected,
            ),
          ),
          TodoConfigItem(
            title: "Due date",
            child: CustomTimePicker(
              initialTime: _todo.dueTime,
              onTimeSelected: onTimeSelected,
            ),
          ),
        ],
      ),
      floatingActionButton: _buildBottomButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SizedBox _buildBottomButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: TextButton(
          child: Text("Save Task"),
          onPressed: () {
            // TODO: Handle save or add task
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Text("Add Task"),
      leading: GestureDetector(
        onTap: () {
          // TODO: handle back
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
