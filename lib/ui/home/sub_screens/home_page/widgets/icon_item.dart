import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/widgets/zoom_tap_animation.dart';

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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        width: 35.w,
        height: 35.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
