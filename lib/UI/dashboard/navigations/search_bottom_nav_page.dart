import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/UI/custom_widgets/search_song_items.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/ui_helper.dart';

class SearchBottomNavPage extends StatelessWidget {
  const SearchBottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 22,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/notification.svg',
                      color: AppColor.whiteColor,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              MHeight(mHeight: 15),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child:UiHelper.CustomTextFieldSearch(),),
              MHeight(mHeight: 20),
              SearchSongItems(Title: 'Your Top Genres', itemTexts: ['Pop', 'Indie'],),
              SearchSongItems(Title: "Popular podcast categories", itemTexts: ['News & Politics','Comedy'],),
              SearchSongItems(Title: 'Browse all', itemTexts: ['2026 Wrapped', 'Podcasts', 'Hello'],),
            ],
          ),
        ),
      ),
    );
  }
}
