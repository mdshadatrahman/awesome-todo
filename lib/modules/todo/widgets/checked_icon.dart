import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckedIcon extends StatelessWidget {
  const CheckedIcon({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.green,
          border: Border.all(
            color: AppColors.greenBorder,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: AppColors.greenBorder,
          ),
        ),
      ),
    );
  }
}
