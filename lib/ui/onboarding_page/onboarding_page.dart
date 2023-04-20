import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/ui/widgets/global_button.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/constants/page_names.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppImages.splashImage,
            width: 180.w,
            height: 196.h,
          ),
          SizedBox(height: 112.h),
          Text(
            "Reminders made simple",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor),
          ),
          SizedBox(height: 170.h),
          GlobalButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, PageName.tabBox);
              },
              label: "Get Started")
        ],
      ),
    );
  }
}
