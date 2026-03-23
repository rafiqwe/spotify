import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/app_rounded_btn.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/app_route.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        children: [
          Image.asset('assets/images/IMG_2756 1.png'),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.blackColor.withOpacity(0.3),
                  AppColor.blackColor,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.center,
              child: BottomLoginUI(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget BottomLoginUI(BuildContext context) => Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SvgPicture.asset('assets/logo/Logo.svg', width: 50, height: 50),
        MHeight(),
        Text(
          'Millions of Songs.\nFree on Spotify.',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'bold',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        AppRoundedBtn(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.create_Account_page);
          },
          bgColor: AppColor.primaryColor,
          text: 'Sign up',
        ),
        AppRoundedBtn(
          mIcon: 'assets/logo/Component 37.svg',
          onTap: () {},
          text: 'Login with Google',
          isOutLine: true,
          textColor: Colors.white,
        ),
        AppRoundedBtn(
          mIcon: 'assets/logo/facebook.svg',
          onTap: () {},
          text: 'Login with Facebook',
          isOutLine: true,
          textColor: Colors.white,
        ),
        AppRoundedBtn(
          mIcon: 'assets/logo/Vector.svg',
          onTap: () {},
          text: 'Login with Apple',
          isOutLine: true,
          textColor: Colors.white,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Log in ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'bold',
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
