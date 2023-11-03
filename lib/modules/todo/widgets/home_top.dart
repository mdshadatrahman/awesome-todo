import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/gen/assets.gen.dart';
import 'package:awesome_todo/modules/todo/widgets/double_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 20,
        left: 32,
        right: 32,
      ),
      width: width,
      color: AppColors.primary,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.sp,
            child: Image.asset(Assets.images.pngs.profile.path),
          ),
          SizedBox(width: 20.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoubleText(
                text: 'Hello, John',
                fontSize: 16.sp,
                color: Colors.white,
                backgroundColor: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              DoubleText(
                text: 'What are your plans \nfor today?',
                fontSize: 25.sp,
                color: Colors.white,
                backgroundColor: Colors.black,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
