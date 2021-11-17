import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toto_app/src/ui/screens/screens.dart';

import '../../resources/data/models.dart';
import '../../utils/constants.dart';

import '../shared/components.dart';

List<Todo> todos = <Todo>[
  Todo(name: "Task 1", dueDate: DateTime(2021, 10, 12, 7, 30), id: 0),
  Todo(name: "Task 2", dueDate: DateTime(2021, 10, 12, 7, 30), id: 1),
  Todo(name: "Task 3", dueDate: DateTime(2021, 10, 12, 7, 30), id: 2),
  Todo(name: "Task 3", dueDate: DateTime(2021, 10, 12, 7, 30), id: 2),
  Todo(name: "Task 3", dueDate: DateTime(2021, 10, 12, 7, 30), id: 2),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          right: 20.w,
          left: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            SizedBox(
              height: 28.h,
            ),
            Expanded(
              child: _buildTodoView(),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildBottomButton(context),
    );
  }

  Column _buildTodoView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: [
            ChoiceChip(
              selected: true,
              label: Text("Today"),
              onSelected: (selected) {},
            ),
            ChoiceChip(
              selected: false,
              label: Text("Upcoming"),
              onSelected: (selected) {},
            ),
            ChoiceChip(
              selected: false,
              label: Text("Finished"),
              onSelected: (selected) {},
            ),
          ],
        ),
        SizedBox(
          height: 23.h,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return TodoCard(
                todo: todos[index],
                onEditTapped: () {},
                onFinishTapped: () {},
                onTapped: () {},
              );
            },
            itemCount: todos.length,
            separatorBuilder: (context, _) {
              return SizedBox(
                height: 23.h,
              );
            },
          ),
        )
      ],
    );
  }

  TextButton _buildBottomButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // TODO: Navigate to Add Todo Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TaskScreen();
            },
          ),
        );
      },
      icon: const Icon(Icons.add_box_rounded),
      label: const Text(
        "Add Task",
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              "Here's Update Today",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            // TODO handle showing search
          },
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor),
            child: const Icon(Icons.search, color: Colors.white),
            width: 50.w,
            height: 50.h,
          ),
        )
      ],
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: const Text("Task Manager"),
      leading: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.widgets_rounded,
            color: Colors.white,
          ),
        ),
        onTap: () {
          // TODO: Navigate to Profile
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // TODO: Open Notification
          },
          child: const Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}
