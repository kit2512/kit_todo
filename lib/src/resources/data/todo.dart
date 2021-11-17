import 'package:flutter/material.dart';

class Todo {
  String name;
  DateTime dueDate;
  String? place;
  bool isFinished;
  Color color;
  final int id;

  Todo({
    required this.id,
    required this.name,
    required this.dueDate,
    this.isFinished = false,
    this.color = const Color(0xFF11FAD5),
  });

  void setFinished() {
    isFinished = !isFinished;
  }
}
