import 'package:flutter/material.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/UI/custom_widgets/search_song_items.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/ui_helper.dart';

class SearchBottomNavPage extends StatelessWidget {
  const SearchBottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        centerTitle: true,
        leading: Text(
          'Search',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            fontFamily: 'bold',
            color: AppColor.whiteColor,
          ),
        ),
        actions: [Icon(Icons.camera_alt_outlined, size: 28)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: UiHelper.CustomTextFieldSearch(),
          ),
          MHeight(mHeight: 20),
          SearchSongItems(),
        ],
      ),
    );
  }
}
