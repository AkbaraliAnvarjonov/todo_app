import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/bloc/tab_box_bloc/tab_box_bloc.dart';
import 'package:todo_app/bloc/tab_box_bloc/tab_box_event.dart';
import 'package:todo_app/bloc/tab_box_bloc/tab_box_state.dart';
import 'package:todo_app/ui/home/sub_screens/grid_page/grid_page.dart';
import 'package:todo_app/ui/home/sub_screens/home_page/home_page.dart';
import 'package:todo_app/ui/home/widgets/bottom_sheet.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_icons.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePage(),
      const GridPage(),
    ];
    return BlocBuilder<TabBoxBloc, TabBoxState>(
      builder: (context, state) {
        int index = context.watch<TabBoxBloc>().activePageindex;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isDismissible: true,
                enableDrag: true,
                isScrollControlled: true,
                constraints: BoxConstraints(minHeight: 400.h),
                context: context,
                builder: (context) => const SizedBox(
                  child: AppBottomSheet(),
                ),
              );
            },
            child: Container(
              width: 54.w,
              height: 54.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      LinearGradient(colors: AppColors.floatingButtonGradient)),
              child: Center(
                  child: SvgPicture.asset(
                AppIcons.addIcon,
                width: 24.w,
                height: 24.w,
              )),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: IndexedStack(
            index: index,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: AppColors.tabSelectedColor,
            unselectedItemColor: AppColors.tabUnSelectedColor,
            currentIndex: index,
            backgroundColor: Colors.white,
            onTap: (value) {
              context.read<TabBoxBloc>().add(TabChanged(tabIndex: value));
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_outlined), label: "Task"),
            ],
          ),
        );
      },
    );
  }
}
