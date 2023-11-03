import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/modules/todo/bloc/todo_bloc.dart';
import 'package:awesome_todo/modules/todo/screens/todo_add_view.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_fab.dart';
import 'package:awesome_todo/modules/todo/widgets/home_middle.dart';
import 'package:awesome_todo/modules/todo/widgets/home_top.dart';
import 'package:awesome_todo/modules/todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomeView extends StatefulWidget {
  const TodoHomeView({super.key});

  @override
  State<TodoHomeView> createState() => _TodoHomeViewState();
}

class _TodoHomeViewState extends State<TodoHomeView> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFab(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const TodoAddView(),
            ),
          );
        },
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        bloc: context.read<TodoBloc>(),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TodoLoading || state is TodoInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoLoaded) {
            return SafeArea(
              child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  children: [
                    const HomeTop(),
                    const HomeMiddle(), // TODO Make this widget identical to the design
                    const SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          itemCount: state.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: TaskTile(
                                task: state.tasks[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
