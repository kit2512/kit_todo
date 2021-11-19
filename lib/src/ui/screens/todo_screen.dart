import 'package:flutter/material.dart';
import '../../utils/screen_utils/custom_screenutil.dart';
import 'dart:math';

import '../../resources/validators/validators.dart';
import '../../utils/constants.dart';
import '../../resources/data/models.dart';

import '../shared/components.dart';

class TodoScreen extends StatefulWidget {
  final Todo? originalTodo;
  final bool isUpdating;
  const TodoScreen({
    Key? key,
    this.originalTodo,
    required this.isUpdating,
  }) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _nameController = TextEditingController();
  String? _errorMessage;
  late Color _color = kPrimaryLightColor;
  late DateTime _dueDate = DateTime.now();
  late TimeOfDay _dueTime = TimeOfDay.now();
  late Level _level = Level.basic;

  bool isValidTodoConfig() {
    if (!TaskValidator.isValidName(_nameController.text)) {
      setState(() {
        _errorMessage = "Invalid name";
      });
      return false;
    }
    return true;
  }

  void _onColorSelected(Color color) {
    setState(() {
      _color = color;
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _dueDate = date;
    });
  }

  void _onTimeSelected(TimeOfDay time) {
    setState(() {
      _dueTime = time;
    });
  }

  void _onLevelSelected(level) {
    setState(() {
      _level = level;
    });
  }

  void _onBottomButtonPressed(BuildContext context, Todo? originalToDo) {
    if (isValidTodoConfig()) {
      final newTodo = Todo(
        id: (Random().nextDouble() * 1000).round(),
        name: _nameController.text,
        dueDate: _dueDate,
        color: _color,
        level: _level,
        dueTime: _dueTime,
      );
      Navigator.pop(context, newTodo);
    }
  }

  @override
  void initState() {
    super.initState();
    final originalTodo = widget.originalTodo;
    if (originalTodo != null) {
      _nameController.text = originalTodo.name;
      _color = originalTodo.color;
      _dueDate = originalTodo.dueDate;
      _dueTime = originalTodo.dueTime;
      _level = originalTodo.level;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: _buildBottomButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Text(widget.isUpdating ? "Edit Task" : "Add Task"),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  ListView _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 14.h,
        bottom: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      children: [
        _buildTaskNameField(context),
        CustomColorPicker(
          initalColor: _color,
          onColorSelected: _onColorSelected,
        ),
        CustomDatePicker(
          initialDate: _dueDate,
          onDateSeleted1: _onDateSelected,
        ),
        CustomTimePicker(
          initialTime: _dueTime,
          onTimeSelected: _onTimeSelected,
        ),
        CustomLevelSelect(
          initialLevel: _level,
          onLevelSelected: _onLevelSelected,
        ),
      ],
    );
  }

  TodoConfigItem _buildTaskNameField(BuildContext context) {
    return TodoConfigItem(
      title: "Task name",
      contentBottomPadding: 8.h,
      contentTopPadding: 8.h,
      child: TextField(
        controller: _nameController,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w500,
            ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: "Enter todo name",
          hintStyle: const TextStyle(
            color: Color(0xffeeeeee),
          ),
          errorText: _errorMessage,
        ),
      ),
    );
  }

  SizedBox _buildBottomButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: TextButton(
          child: Text(widget.isUpdating ? "Save Task" : "Add Task"),
          onPressed: () {
            _onBottomButtonPressed(context, widget.originalTodo);
          },
        ),
      ),
    );
  }
}
