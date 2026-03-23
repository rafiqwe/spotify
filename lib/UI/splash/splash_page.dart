import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/domain/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Center(
        child: SvgPicture.asset(
          'assets/logo/Logo.svg',
          width: 70,
          height: 70,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
