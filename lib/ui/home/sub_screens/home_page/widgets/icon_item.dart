import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/widgets/zoom_tap_animation.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_icons.dart';

class IconItemWidget extends StatelessWidget {
  String icon;
  VoidCallback onTap;
  IconItemWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor: icon == AppIcons.penIcon
              ? AppColors.penIconColor
              : AppColors.deleteIconColor,
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: 20.h,
              width: 20.h,
            ),
          ),
        ),
      ),
    );
  }
}
