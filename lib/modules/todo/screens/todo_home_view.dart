import 'package:awesome_todo/app/utils/app_colors.dart';
import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/gen/assets.gen.dart';
import 'package:awesome_todo/modules/todo/widgets/double_text.dart';
import 'package:awesome_todo/modules/todo/widgets/home_middle.dart';
import 'package:awesome_todo/modules/todo/widgets/home_top.dart';
import 'package:awesome_todo/modules/todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TodoHomeView extends StatelessWidget {
  const TodoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              const HomeTop(),
              HomeMiddle(), // TODO Make this widget identical to the design
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskTile();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
