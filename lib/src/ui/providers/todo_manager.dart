import 'package:flutter/material.dart';
import 'package:toto_app/src/resources/data/models.dart';

class TodoManager extends ChangeNotifier {
  final List<Todo> _todos = <Todo>[
    Todo(
        name: "Task 1",
        dueDate: DateTime(2021, 10, 12, 7, 30),
        color: const Color(0xffdcedc8),
        id: 0,
        level: Level.important),
    Todo(
        name: "Task 2",
        dueDate: DateTime(2021, 10, 12, 7, 30),
        id: 1,
        dueTime: const TimeOfDay(hour: 10, minute: 20),
        color: const Color(0xfff0f4c3),
        level: Level.urgent),
    Todo(
        color: const Color(0xfffff9c4),
        name: "Task 3",
        dueDate: DateTime(2021, 10, 12, 7, 30),
        id: 2,
        level: Level.basic,
        dueTime: const TimeOfDay(hour: 10, minute: 30)),
    Todo(
        color: const Color(0xffffecb3),
        name: "Task 4",
        dueDate: DateTime(2021, 10, 12, 7, 30),
        id: 3,
        dueTime: const TimeOfDay(hour: 9, minute: 20)),
    Todo(
        name: "Task 5",
        dueDate: DateTime(2021, 10, 12, 7, 30),
        id: 4,
        color: const Color(0xffffe0b2))
  ];

  int _selectedTodo = 0;

  List<Todo> get todos => _todos;
  Todo get currentTodo => _todos[_selectedTodo];

  void goToTodo(int index) {
    _selectedTodo = index;
    notifyListeners();
  }

  void upDateTodo(int id, Todo newTodo) {
    int index = _todos.indexWhere((element) => element.id == id);
    _todos[index] = newTodo;
    notifyListeners();
  }

  void addTodo(Todo newTodo) {
    _todos.add(newTodo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    final index = _todos.indexWhere((element) => element.id == todo.id);
    _todos.removeAt(index);
    notifyListeners();
  }

  void completeTodo(Todo todo, bool? isCompleted) {
    final index = _todos.indexWhere((element) => element.id == todo.id);
    _todos[index].setFinished(isCompleted);
    notifyListeners();
  }
}
