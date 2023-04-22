import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_event.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/ui/home/sub_screens/home_page/widgets/icon_item.dart';
import 'package:todo_app/ui/home/widgets/update_bottom_sheet.dart';
import 'package:todo_app/ui/widgets/zoom_tap_animation.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_icons.dart';
import 'package:todo_app/utils/constants/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItemWidget extends StatelessWidget {
  TaskModel task;
  GlobalKey key1;
  TaskItemWidget({
    super.key,
    required this.task,
    required this.key1,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key1,
      enabled: true,
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.28,
        motion: const BehindMotion(),
        children: [
          IconItemWidget(
            icon: AppIcons.penIcon,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isDismissible: true,
                enableDrag: true,
                isScrollControlled: true,
                constraints: BoxConstraints(minHeight: 400.h),
                context: context,
                builder: (context) => SizedBox(
                  child: UpdateBottomSheet(task: task),
                ),
              );
            },
          ),
          IconItemWidget(
              icon: AppIcons.deleteIcon,
              onTap: () {
                BlocProvider.of<TaskBloc>(context)
                    .add(DeleteTaskEvent(id: task.id));
              }),
        ],
      ),
      child: Container(
        width: 340.w,
        height: 56.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(5.r)),
        child: Row(
          children: [
            Container(
              height: 56.h,
              width: 4.w,
              decoration: BoxDecoration(
                  color: task.type.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                  )),
            ),
            SizedBox(width: 12.w),
            //is finished
            ZoomTapAnimation(
              onTap: () {
                task.isFinished = !task.isFinished;
                BlocProvider.of<TaskBloc>(context)
                    .add(UpdateTaskEvent(taskModel: task));
              },
              child: task.isFinished
                  ? SvgPicture.asset(
                      AppIcons.checkIcon,
                      width: 18.w,
                      height: 18.w,
                    )
                  : Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: AppColors.tabUnSelectedColor)),
                    ),
            ),
            SizedBox(width: 12.w),
            //time
            Text(
              DateFormat('HH:mm a').format(task.day),
              style: TextStyles.medium(
                fontSize: 11.sp,
                color: AppColors.textColorGrey2,
              ),
            ),
            SizedBox(width: 12.w),
            SizedBox(
              width: 180.w,
              child: Text(
                task.title,
                style: TextStyles.large(
                  fontSize: 16.sp,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ZoomTapAnimation(
                onTap: () {
                  task.notify = !task.notify;
                  BlocProvider.of<TaskBloc>(context)
                      .add(UpdateTaskEvent(taskModel: task));
                },
                child: SvgPicture.asset(
                  task.notify ? AppIcons.bellIconTrue : AppIcons.bellIcon,
                  width: 11.w,
                  height: 14.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
