import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_event.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_state.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_state.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/ui/home/sub_screens/home_page/widgets/task_item.dart';
import 'package:todo_app/ui/home/widgets/custom_appbar.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/constants/text_style.dart';
import 'package:todo_app/utils/my_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskAddSucces) {
            MyUtils.getMyToast(message: "Task added successful");
            BlocProvider.of<GetTaskBloc>(context).add(GetTask());
          }
          if (state is TaskDeleteSucces || state is TaskUpdateSucces) {
            BlocProvider.of<GetTaskBloc>(context).add(GetTask());
          }
        },
        child: BlocBuilder<GetTaskBloc, GetTaskState>(
          builder: (context, state) {
            if (state is GetTaskLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetTaskSucces) {
              if (state.tasks.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.emptyImage,
                        width: 120.w,
                        height: 164.h,
                      ),
                      SizedBox(height: 70.h),
                      Text("No tasks", style: TextStyles.large(),)
                    ],
                  ),
                );
              }
              Map<DateTime, List<TaskModel>> daysMap = {};
              //sort list
              daysMap = MyUtils.sortDate(tasks: state.tasks, daysMap: daysMap);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      taskModel: daysMap[daysMap.keys.toList()[0]]![0],
                      tasks: daysMap[daysMap.keys.toList()[0]]!.length,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),

                      //days list
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: daysMap.length,
                        itemBuilder: (context, index1) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Text(
                              DateFormat.yMMMd()
                                  .format(daysMap.keys.toList()[index1]),
                              style: TextStyles.large(
                                fontSize: 12.sp,
                                color: AppColors.textColor2,
                              ),
                            ),
                            SizedBox(height: 20.h),

                            //tasks in days list
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: daysMap[daysMap.keys.toList()[index1]]!
                                  .length,
                              itemBuilder: (context, index) {
                                GlobalKey key1 = GlobalKey();
                                return TaskItemWidget(
                                  task: daysMap[daysMap.keys.toList()[index1]]![
                                      index],
                                  key1: key1,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 12.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
