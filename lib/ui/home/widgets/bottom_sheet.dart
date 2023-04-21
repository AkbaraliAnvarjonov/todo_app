import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_event.dart';
import 'package:todo_app/bloc/task_bloc/task_state.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/data/models/type_model.dart';
import 'package:todo_app/ui/widgets/global_button.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/task_types.dart';
import 'package:todo_app/utils/constants/text_style.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/my_utils.dart';

TextEditingController taskController = TextEditingController();
TypeModel typeModel = taskTypes[0];
DateTime? taskday;
TimeOfDay? taskTime;

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({super.key});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Center(
            child: Text(
              "Add New Task",
              style: TextStyles.large(
                  color: AppColors.textColorDarkGrey, fontSize: 13.sp),
            ),
          ),
          SizedBox(height: 12.h),
          //add text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFormField(
              controller: taskController,
              style: TextStyles.medium(
                  fontSize: 20.sp, color: AppColors.textColorDarkGrey),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Task",
                labelStyle:
                    TextStyles.medium(color: AppColors.textColorDarkGrey),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 20.w,
            ),
            child: const Divider(),
          ),
          //choose type
          SizedBox(
            height: 32.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: taskTypes.length,
              itemBuilder: (context, index) => SizedBox(width: 20.w),
              separatorBuilder: (context, index) => InkWell(
                onTap: () {
                  typeModel = taskTypes[index];
                  setState(() {});
                },
                child: taskTypes[index] == typeModel
                    ? Container(
                        height: 27.h,
                        decoration: BoxDecoration(
                          color: taskTypes[index].color,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: Text(
                              taskTypes[index].name,
                              style: TextStyles.medium(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            radius: 5.r,
                            backgroundColor: taskTypes[index].color,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            taskTypes[index].name,
                            style: TextStyles.medium(
                                color: AppColors.textColorGrey),
                          )
                        ],
                      ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 20.w,
            ),
            child: const Divider(),
          ),

          //choose time
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                SizedBox(
                  width: 100.w,
                  child: GlobalButton(
                    onPressed: () async {
                      taskday = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2051),
                      );

                      taskTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      taskday = DateTime(
                        taskday!.year,
                        taskday!.month,
                        taskday!.day,
                        taskTime!.hour,
                        taskTime!.minute,
                      );
                      setState(() {});
                    },
                    label: "Add Time",
                    colors: AppColors.appBarGradient,
                  ),
                ),
                SizedBox(width: 20.w),
                taskday == null
                    ? const SizedBox()
                    : Text(
                        "${DateFormat.yMMMd().format(taskday!)} ${DateFormat('HH:mm').format(taskday!)}",
                        style: TextStyles.medium(
                            color: AppColors.textColorDarkGrey),
                      ),
              ],
            ),
          ),
          BlocListener<TaskBloc, TaskState>(
            listener: (context, state) {
              if (state is TaskAddSucces) {
                MyUtils.getMyToast(message: "Task added successful");
              }
            },
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: GlobalButton(
                onPressed: () {
                  if (taskday == null || taskController.text.isEmpty) {
                    MyUtils.getMyToast(
                        message: "Complete the other sections below as well");
                  } else {
                    BlocProvider.of<TaskBloc>(context).add(
                      AddTaskEvent(
                        taskModel: TaskModel(
                          title: taskController.text,
                          id: 0,
                          isFinished: false,
                          notify: true,
                          day: taskday!,
                          type: typeModel,
                        ),
                      ),
                    );
                  }
                },
                label: "Add Task",
                colors: AppColors.appBarGradient,
              ),
            ),
          )
        ],
      ),
    );
  }
}
