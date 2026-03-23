import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/domain/app_color.dart';

InputDecoration getCreateAccTextFieldDecoration() => InputDecoration(
  filled: true,
  fillColor: AppColor.greyColor,
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 2, color: AppColor.primaryColor),
  ),
);

class UiHelper {
  static CustomTextFieldSearch({String? text}) {
    return Container(
      width: double.infinity,
      height: 44,
      // padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: AppColor.blackColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text ?? 'Search',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SvgPicture.asset(
              'assets/icons/Search_Solid.svg',
              width: 13,
              height: 13,
              color: AppColor.greyColor,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'medium',
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  static CustomRoundedImg({
    required String imgPath,
    double? mWidth = 100,
    double mHight = 100,
  }) {
    return Container(
      width: mWidth,
      height: mHight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }
}
