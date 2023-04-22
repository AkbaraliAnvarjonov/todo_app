import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/data/repositories/splash_repo.dart';
import 'package:todo_app/ui/widgets/global_button.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/constants/page_names.dart';
import 'package:todo_app/utils/get_it.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 180.h),
            SvgPicture.asset(
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
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 60.w),
              child: GlobalButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, PageName.tabBox);
                    locator<SplashRepository>().setLoggedIn();
                  },
                  label: "Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
