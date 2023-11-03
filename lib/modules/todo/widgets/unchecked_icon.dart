import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UncheckedIcon extends StatelessWidget {
  const UncheckedIcon({
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
          border: Border.all(
            color: AppColors.darkBlue,
          ),
        ),
      ),
    );
  }
}
