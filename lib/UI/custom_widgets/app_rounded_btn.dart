import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/domain/app_color.dart';

class AppRoundedBtn extends StatelessWidget {
  final Color bgColor;
  final double mWidth;
  final double mHight;
  final VoidCallback onTap;
  final String text;
  final String? mIcon;
  final Color textColor;
  final bool isOutLine;

  const AppRoundedBtn({
    super.key,
    this.isOutLine = false,
    this.bgColor = Colors.white,
    this.mWidth = 300,
    this.mHight = 50,
    this.textColor = Colors.black,
    required this.onTap,
    required this.text,
    this.mIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHight,
        decoration: BoxDecoration(
          color: isOutLine ? Colors.transparent : bgColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: isOutLine ? Colors.white : Colors.transparent,
          ),
        ),
        child: mIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(mIcon!, width: 20, height: 20),
                    Expanded(
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'bold',
                            color: isOutLine
                                ? AppColor.whiteColor
                                : AppColor.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'bold',
                    color: isOutLine
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                  ),
                ),
              ),
      ),
    );
  }
}
