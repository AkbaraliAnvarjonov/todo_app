import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_icons.dart';
import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/constants/text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 238.h,
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
                  "Today you have 9 tasks",
                  style: TextStyles.medium(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 12.h,
                      right: 12.w,
                      child: SvgPicture.asset(AppIcons.closeIcon),
                    ),
                    Container(
                      height: 106.h,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today Reminder",
                                style: TextStyles.large(color: Colors.white),
                              ),
                              Text(
                                "Meeting with client",
                                style:
                                    TextStyles.mediumBold(color: Colors.white),
                              ),
                              Text(
                                "13.00 PM",
                                style: TextStyles.small(color: Colors.white),
                              ),
                            ],
                          ),
                          SvgPicture.asset(AppImages.bellImage),
                        ],
                      ),
                    ),
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
