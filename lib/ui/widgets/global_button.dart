import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/text_style.dart';

class GlobalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final List<Color>? colors;

  const GlobalButton(
      {Key? key, required this.onPressed, required this.label, this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors ?? AppColors.buttonGradient),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          fixedSize: Size(MediaQuery.of(context).size.width, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyles.medium(fontSize: 15.sp, color: Colors.white),
        ),
      ),
    );
  }
}
