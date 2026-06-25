import 'package:flutter/material.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';

class PlaylistListCompo extends StatelessWidget {
    String imagePath;
    String title;
    String subTitle;

   PlaylistListCompo({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            imagePath,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              fontSize: 13,
              color: AppColor.greyColor,

            ),
          ),
        ),
      ],
    );
  }
}
