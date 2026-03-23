import 'package:flutter/material.dart';
import 'package:spotify/UI/custom_widgets/app_rounded_btn.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/ui_helper.dart';

class CreateAccountTextField extends StatelessWidget {
  final String fieldText;
  final String bottomText;
  final bool isBtn;

  const CreateAccountTextField({
    super.key,
    required this.fieldText,
    required this.bottomText,
    this.isBtn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'bold',
            color: AppColor.whiteColor,
          ),
        ),
        MHeight(mHeight: 5),
        isBtn
            ? Wrap(
                runSpacing: 10,
                spacing: 8,
                children: [
                  AppRoundedBtn(
                    onTap: () {},
                    text: 'Male',
                    mWidth: 80,
                    mHight: 30,
                    isOutLine: true,
                    textColor: AppColor.whiteColor,
                  ),
                  AppRoundedBtn(
                    onTap: () {},
                    text: 'Female',
                    mWidth: 80,
                    mHight: 30,
                    isOutLine: true,
                    textColor: AppColor.whiteColor,
                  ),

                  AppRoundedBtn(
                    onTap: () {},
                    text: 'Not prefer to say ',
                    mWidth: 180,
                    mHight: 30,
                    isOutLine: true,
                    textColor: AppColor.whiteColor,
                  ),
                  AppRoundedBtn(
                    onTap: () {},
                    text: 'Other',
                    mWidth: 80,
                    mHight: 30,
                    isOutLine: true,
                    textColor: AppColor.whiteColor,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: getCreateAccTextFieldDecoration(),
                    style: TextStyle(color: AppColor.whiteColor),
                    cursorColor: AppColor.whiteColor,
                  ),
                  SizedBox(height: 5),
                  Text(
                    bottomText,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColor.whiteColor,
                      fontFamily: 'demi',
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
