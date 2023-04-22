import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_state.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/ui/home/sub_screens/grid_page/widgets/type_item_widget.dart';
import 'package:todo_app/ui/home/widgets/custom_appbar.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/task_types.dart';
import 'package:todo_app/utils/constants/text_style.dart';
import 'package:todo_app/utils/my_utils.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: BlocBuilder<GetTaskBloc, GetTaskState>(
          builder: (context, state) {
            if (state is GetTaskSucces) {
              Map<DateTime, List<TaskModel>> daysMap = {};
              //sort list
              daysMap = MyUtils.sortDate(tasks: state.tasks, daysMap: daysMap);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    tasks: daysMap.isEmpty
                        ? 0
                        : daysMap[daysMap.keys.toList()[0]]!.length,
                    taskModel: state.tasks.isNotEmpty
                        ? state.tasks[0]
                        : TaskModel(
                            title: '',
                            id: -1,
                            isFinished: false,
                            notify: false,
                            day: DateTime.now(),
                            type: taskTypes[0],
                          ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 18.w, top: 12.h, bottom: 4.h),
                    child: Text(
                      "Projects",
                      style: TextStyles.large(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor2),
                    ),
                  ),
                  GridView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(18).w,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.88,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                    ),
                    children: List.generate(taskTypes.length, (index) {
                      List<TaskModel> tasks = state.tasks
                          .where((element) =>
                              element.type.name == taskTypes[index].name)
                          .toList();
                      return TypeItemWidget(
                        index: index,
                        tasks: tasks,
                      );
                    }),
                  ),
                ],
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
