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

class TodoAddView extends StatefulWidget {
  const TodoAddView({super.key});

  @override
  State<TodoAddView> createState() => _TodoAddViewState();
}

class _TodoAddViewState extends State<TodoAddView> {
  final TextEditingController _controller = TextEditingController();
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
        child: BlocConsumer<TodoBloc, TodoState>(
          bloc: context.read<TodoBloc>(),
          listener: (context, state) {
            if (state is TodoLoaded) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            if (state is TodoLoading || state is TodoInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TodoLoaded) {
              return SizedBox(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(title: 'Add New Task'),
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
                        hinttext: '',
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: PrimaryButton(
                        onTap: () {
                          if (_controller.text.isNotEmpty) {
                            context.read<TodoBloc>().add(
                                  TodoAddEvent(
                                    Task(
                                      id: state.tasks.length + 1,
                                      title: _controller.text,
                                      isCompleted: false,
                                    ),
                                  ),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter task name'),
                              ),
                            );
                          }
                        },
                        text: 'Done',
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
