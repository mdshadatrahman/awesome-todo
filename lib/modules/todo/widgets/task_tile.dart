import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/modules/todo/screens/todo_home_view.dart';
import 'package:awesome_todo/modules/todo/widgets/checked_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 23,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteBg,
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
          const CheckedIcon(),
          const SizedBox(width: 17),
          Text(
            'Training at the Gym',
            style: TextStyle(
              color: AppColors.disabledColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const Spacer(),
          Container(
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
        ],
      ),
    );
  }
}
