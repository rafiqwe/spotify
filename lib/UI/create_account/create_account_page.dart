import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/app_rounded_btn.dart';
import 'package:spotify/UI/custom_widgets/create_account_Text_field.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/app_route.dart';
import 'package:spotify/domain/ui_helper.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int selectedIndex = 0;

  List<Widget> allPages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allPages = [
      CreateAccountTextField(
        fieldText: 'What’s your email?',
        bottomText: 'You’ll need to confirm this email later.',
      ),
      CreateAccountTextField(
        fieldText: 'Create a password',
        bottomText: 'Use atleast 8 characters.',
      ),
      CreateAccountTextField(
        fieldText: 'What’s your gender?',
        bottomText: '',
        isBtn: true,
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              CreateAccountTextField(
                fieldText: 'What\'s Your Gender',
                bottomText: 'You\'ll need to confirm this email later',
              ),
              MHeight(mHeight: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: AppColor.greyColor, height: 1),
                    MHeight(mHeight: 20),
                    Text(
                      'By tapping on “Create account”, you agree to the spotify Terms of Use. ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                        fontFamily: 'demi',
                      ),
                    ),
                    MHeight(mHeight: 20),
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        fontFamily: 'demi',
                        fontSize: 11,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MHeight(mHeight: 20),
                    Text(
                      'To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                        fontFamily: 'demi',
                      ),
                    ),
                    MHeight(mHeight: 20),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'demi',
                        fontSize: 11,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RadioListTile.adaptive(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        'Please send me news and offers from Spotify.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                          fontFamily: 'demi',
                        ),
                      ),
                      value: false,
                      groupValue: false,
                      onChanged: (value) {},
                    ),
                    RadioListTile.adaptive(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        'Share my registration data with Spotify’s content providers for marketing purposes.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                          fontFamily: 'demi',
                        ),
                      ),
                      value: false,
                      groupValue: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              AppRoundedBtn(
                onTap: () {},
                text: 'Create an account',
                mWidth: 190,
                mHight: 40,
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/icons/Left.svg',
              color: AppColor.whiteColor,
              width: 10,
              height: 10,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Create Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'bold',
            fontSize: 14,
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: _buildActivePage(),
            ), // Wrap the page content in Expanded
            if (selectedIndex < 3) // Only show "Next" if not on the last page
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AppRoundedBtn(
                  onTap: () {
                    setState(() {
                      selectedIndex++;
                    });
                  },
                  text: 'Next',
                  mWidth: 90,
                  mHight: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivePage() {
    switch (selectedIndex) {
      case 0:
        return CreateAccountTextField(
          fieldText: 'What’s your email?',
          bottomText: 'You’ll need to confirm this email later.',
        );
      case 1:
        return CreateAccountTextField(
          fieldText: 'Create a password',
          bottomText: 'Use atleast 8 characters.',
        );
      case 2:
        return CreateAccountTextField(
          fieldText: 'What’s your gender?',
          bottomText: '',
          isBtn: true,
        );
      case 3:
        return _buildFinalStep(); // We break this out because it's complex
      default:
        return Container();
    }
  }

  Widget _buildFinalStep() {
    // Use a ConstrainedBox or just remove Expanded if it's inside a scrollable
    return SingleChildScrollView(
      // Added scroll view to prevent overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateAccountTextField(
            fieldText: 'What\'s Your Name',
            bottomText: "This appears on your spotify profile",
          ),
          MHeight(mHeight: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColor.greyColor, height: 1),
              MHeight(mHeight: 20),
              Text(
                'By tapping on “Create account”, you agree to the spotify Terms of Use. ',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                  fontFamily: 'demi',
                ),
              ),
              MHeight(mHeight: 20),
              Text(
                'Terms of Use',
                style: TextStyle(
                  fontFamily: 'demi',
                  fontSize: 11,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MHeight(mHeight: 20),
              Text(
                'To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                  fontFamily: 'demi',
                ),
              ),
              MHeight(mHeight: 20),
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: 'demi',
                  fontSize: 11,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RadioListTile.adaptive(
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  'Please send me news and offers from Spotify.',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                    fontFamily: 'demi',
                  ),
                ),
                value: false,
                groupValue: false,
                onChanged: (value) {},
              ),
              RadioListTile.adaptive(
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  'Share my registration data with Spotify’s content providers for marketing purposes.',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                    fontFamily: 'demi',
                  ),
                ),
                value: false,
                groupValue: false,
                onChanged: (value) {},
              ),
            ],
          ),
          MHeight(mHeight: 90),
          Center(
            child: AppRoundedBtn(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.choose_artist_page);
              },
              text: 'Create an account',
              mWidth: 190,
              mHight: 40,
            ),
          ),
        ],
      ),
    );
  }
}
