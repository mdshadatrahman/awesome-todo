import 'package:awesome_todo/app/models/task_model.dart';
import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_appbar.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_textbox.dart';
import 'package:awesome_todo/modules/todo/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoEditView extends StatelessWidget {
  const TodoEditView({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
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
                  controller: TextEditingController(),
                  hinttext: task.title,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PrimaryButton(
                  onTap: () {},
                  text: 'Done',
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
