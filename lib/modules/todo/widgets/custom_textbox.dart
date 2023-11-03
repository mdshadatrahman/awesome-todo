import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    required this.hinttext,
    required this.controller,
    super.key,
  });

  final String hinttext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: AppColors.textFieldTextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 15,
            left: 17,
            right: 17,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: AppColors.textFieldTextColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
