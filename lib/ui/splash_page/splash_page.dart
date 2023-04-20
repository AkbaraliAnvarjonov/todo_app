import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/repositories/splash_repo.dart';
import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/constants/page_names.dart';
import 'package:todo_app/utils/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splashNext();
  }

  void splashNext() async {
    Future.delayed(const Duration(seconds: 3), () async {
      locator<SplashRepository>().hasLoggedIn().then((value) =>
          Navigator.pushReplacementNamed(
              context, value == true ? PageName.tabBox : PageName.onBoarding));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.splashImage,
          width: 180.w,
          height: 196.h,
        ),
      ),
    );
  }
}
