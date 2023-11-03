// ignore_for_file: avoid_bool_literals_in_conditional_expressions, lines_longer_than_80_chars

import 'package:awesome_todo/app/models/task_model.dart';
import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/modules/todo/bloc/todo_bloc.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_appbar.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_textbox.dart';
import 'package:awesome_todo/modules/todo/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoEditView extends StatefulWidget {
  const TodoEditView({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  State<TodoEditView> createState() => _TodoEditViewState();
}

class _TodoEditViewState extends State<TodoEditView> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.text = widget.task.title;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: BlocConsumer<TodoBloc, TodoState>(
            bloc: context.read<TodoBloc>(),
            listener: (context, state) {
              if (state is TodoLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Loading...'),
                    duration: Duration(milliseconds: 100),
                  ),
                );
              }
              if (state is TodoLoaded) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(title: 'Edit Task'),
                  SizedBox(height: 39.sp),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Task Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.84,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.sp),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomtextField(
                      controller: _controller,
                      hinttext: widget.task.title,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: PrimaryButton(
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                          context.read<TodoBloc>().add(
                                TodoEditEvent(
                                  Task(
                                    id: widget.task.id,
                                    title: _controller.text,
                                    isCompleted: _controller.text != widget.task.title ? false : widget.task.isCompleted,
                                  ),
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a task name'),
                            ),
                          );
                        }
                      },
                      text: 'Done',
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
