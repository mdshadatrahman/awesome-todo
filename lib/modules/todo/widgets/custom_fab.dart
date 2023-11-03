import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/modules/todo/widgets/double_text.dart';
import 'package:flutter/material.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    required this.onTap,
    super.key,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 61,
        width: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignOutside,
            color: AppColors.darkBlue.withOpacity(0.8),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const Center(
          child: DoubleText(
            text: '+',
            fontSize: 36,
            backgroundColor: Colors.black,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
