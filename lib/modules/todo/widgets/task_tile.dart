// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:awesome_todo/app/models/task_model.dart';
import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/modules/todo/screens/todo_edit_view.dart';
import 'package:awesome_todo/modules/todo/widgets/checked_icon.dart';
import 'package:awesome_todo/modules/todo/widgets/unchecked_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.task,
    required this.onCheckTap,
    super.key,
  });
  final Task task;
  final VoidCallback onCheckTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 23,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColors.tileBg,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          task.isCompleted
              ? CheckedIcon(
                  onTap: onCheckTap,
                )
              : UncheckedIcon(
                  onTap: onCheckTap,
                ),
          const SizedBox(width: 17),
          Text(
            task.title,
            style: TextStyle(
              color: task.isCompleted ? AppColors.disabledColor : AppColors.darkBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => TodoEditView(task: task),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.darkBlue),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Center(
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
