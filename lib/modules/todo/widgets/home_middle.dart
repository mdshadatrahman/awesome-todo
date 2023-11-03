import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/gen/assets.gen.dart';
import 'package:awesome_todo/modules/todo/widgets/double_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeMiddle extends StatelessWidget {
  const HomeMiddle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 33,
            vertical: 33,
          ),
          decoration: BoxDecoration(
            color: AppColors.seconday.withOpacity(0.9),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(Assets.images.svgs.trophy),
              SizedBox(width: 28.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoubleText(
                    text: 'Go Pro (No Ads)',
                    fontSize: 18.sp,
                    backgroundColor: Colors.white,
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: DoubleText(
                      text: r'No fuss, no ads, for only $1 a month',
                      fontSize: 12.sp,
                      backgroundColor: Colors.white,
                      color: AppColors.textFieldTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 2,
          child: Container(
            height: 2,
            width: width,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        Positioned(
          right: 24,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
              vertical: 25.sp,
            ),
            color: AppColors.darkBlue,
            child: Text(
              r'$1',
              style: TextStyle(
                color: AppColors.yelloText,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
