import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_state.dart';
import 'package:todo_app/ui/home/widgets/custom_appbar.dart';
import 'package:todo_app/utils/constants/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(children: [
        const CustomAppBar(),
        BlocBuilder<GetTaskBloc, GetTaskState>(
          builder: (context, state) {
            if (state is GetTaskLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetTaskSucces) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.tasks.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.tasks[index].title),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ]),
    );
  }
}
