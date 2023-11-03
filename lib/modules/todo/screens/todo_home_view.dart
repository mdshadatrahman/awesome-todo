import 'package:awesome_todo/app/models/task_model.dart';
import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_fab.dart';
import 'package:awesome_todo/modules/todo/widgets/double_text.dart';
import 'package:awesome_todo/modules/todo/widgets/home_middle.dart';
import 'package:awesome_todo/modules/todo/widgets/home_top.dart';
import 'package:awesome_todo/modules/todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';

List<Task> tasks = const [
  Task(
    id: 1,
    title: 'Training at the Gym',
    isCompleted: true,
  ),
  Task(
    id: 2,
    title: 'Play Paddle with friends',
    isCompleted: false,
  ),
  Task(
    id: 3,
    title: 'Burger BBQ with family',
    isCompleted: false,
  ),
];

class TodoHomeView extends StatelessWidget {
  const TodoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFab(
        onTap: () {},
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              const HomeTop(),
              const HomeMiddle(), // TODO Make this widget identical to the design
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: tasks.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: TaskTile(
                        task: tasks[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
