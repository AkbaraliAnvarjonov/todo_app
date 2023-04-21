import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_bloc.dart';
import 'package:todo_app/bloc/get_task_bloc/get_task_event.dart';
import 'package:todo_app/bloc/tab_box_bloc/tab_box_bloc.dart';
import 'package:todo_app/bloc/task_bloc/task_bloc.dart';
import 'package:todo_app/utils/constants/page_names.dart';
import 'package:todo_app/utils/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => TabBoxBloc(),
      ),
      BlocProvider(
        create: (context) => TaskBloc(),
      ),
      BlocProvider(
        create: (context) => GetTaskBloc()..add(GetTask()),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.generateRoute,
        initialRoute: PageName.splash,
      ),
    );
  }
}
