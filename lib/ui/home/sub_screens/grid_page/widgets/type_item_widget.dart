import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/ui/widgets/zoom_tap_animation.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/task_types.dart';
import 'package:todo_app/utils/constants/text_style.dart';

class TypeItemWidget extends StatelessWidget {
  int index;
  List<TaskModel> tasks;
  TypeItemWidget({
    super.key,
    required this.index,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(5.r)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: taskTypes[index].color.withOpacity(0.3),
                child: SvgPicture.asset(
                  taskTypes[index].icon,
                  width: 28.w,
                  height: 32.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.h),
                child: Text(
                  taskTypes[index].name,
                  style: TextStyles.large(
                    color: AppColors.textColorGrey3,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                "${tasks.length} Task",
                style: TextStyles.mediumBold(color: AppColors.textColorGrey2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
