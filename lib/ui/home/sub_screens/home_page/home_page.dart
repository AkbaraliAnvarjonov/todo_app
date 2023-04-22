import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_event.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_state.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_state.dart';
import 'package:todo_app/ui/home/sub_screens/home_page/widgets/task_item.dart';
import 'package:todo_app/ui/home/widgets/custom_appbar.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
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
        child: Column(children: [
          const CustomAppBar(),
          BlocBuilder<GetTaskBloc, GetTaskState>(
            builder: (context, state) {
              if (state is GetTaskLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetTaskSucces) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      GlobalKey key1 = GlobalKey();
                      return TaskItemWidget(
                        task: state.tasks[index],
                        key1: key1,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12.h),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ]),
      ),
    );
  }
}
