import 'package:awesome_todo/app/models/task_model.dart';
import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/gen/assets.gen.dart';
import 'package:awesome_todo/modules/todo/widgets/custom_textbox.dart';
import 'package:awesome_todo/modules/todo/widgets/double_text.dart';
import 'package:awesome_todo/modules/todo/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                height: 62.sp,
                width: width,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(Assets.images.svgs.back),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 19, bottom: 15),
                        child: DoubleText(
                          text: 'Edit Task',
                          fontSize: 24.sp,
                          color: Colors.white,
                          backgroundColor: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
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
