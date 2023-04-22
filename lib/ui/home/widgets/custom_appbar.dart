import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_event.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/ui/widgets/zoom_tap_animation.dart';
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
    if (DateFormat.yMMMd().format(taskModel.day) ==
            DateFormat.yMMMd().format(DateTime.now()) &&
        taskModel.notify) {
      isNotify = true;
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
            child: SvgPicture.asset(AppImages.smallCircle, width: 80.h),
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
                  "Today you have ${isNotify ? tasks : 0} tasks",
                  style: TextStyles.medium(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 12.w,
                      right: 12.w,
                      child: ZoomTapAnimation(
                        onTap: () {
                          taskModel.notify = false;
                          BlocProvider.of<TaskBloc>(context)
                              .add(UpdateTaskEvent(taskModel: taskModel));
                        },
                        child: SvgPicture.asset(AppIcons.closeIcon, width: 10.w, height: 10.w,),
                      ),
                    ),
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
