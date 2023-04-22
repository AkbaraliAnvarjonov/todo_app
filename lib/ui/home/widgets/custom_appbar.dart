import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_event.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_icons.dart';
import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/constants/text_style.dart';

class CustomAppBar extends StatelessWidget {
  TaskModel taskModel;
  int tasks;
  CustomAppBar({
    Key? key,
    required this.taskModel,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNotify = false;
    bool notToday = true;
    if (DateFormat.yMMMd().format(taskModel.day) ==
            DateFormat.yMMMd().format(DateTime.now()) &&
        taskModel.notify) {
      isNotify = true;
    }
    if (DateFormat.yMMMd().format(taskModel.day) ==
        DateFormat.yMMMd().format(DateTime.now())) {
      notToday = false;
    }
    return Container(
      height: isNotify ? 238.h : 106.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.appBarGradient)),
      child: Stack(
        children: [
          SvgPicture.asset(
            AppImages.bigCircle,
            width: 130.h,
          ),
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              AppImages.smallCircle,
              width: 80.h,
              height: 80.h,
            ),
          ),
          Positioned(
            top: 54.h,
            left: 22.w,
            right: 22.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyles.medium(color: Colors.white, fontSize: 22),
                ),
                Text(
                  "Today you have ${notToday ? 0 : tasks} tasks",
                  style: TextStyles.medium(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Stack(
                  children: [
                    isNotify
                        ? Container(
                            height: 104.h,
                            width: 340.w,
                            padding: EdgeInsets.all(20.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.31)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today Reminder",
                                      style:
                                          TextStyles.large(color: Colors.white),
                                    ),
                                    Text(
                                      taskModel.title,
                                      style: TextStyles.mediumBold(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      DateFormat('HH:mm a')
                                          .format(taskModel.day),
                                      style:
                                          TextStyles.small(color: Colors.white),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppImages.bellImage),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Positioned(
                      top: 0.w,
                      right: 0.w,
                      child: IconButton(
                        onPressed: () {
                          taskModel.notify = false;
                          BlocProvider.of<TaskBloc>(context)
                              .add(UpdateTaskEvent(taskModel: taskModel));
                        },
                        icon: SvgPicture.asset(
                          AppIcons.closeIcon,
                          width: 12.w,
                          height: 12.w,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
