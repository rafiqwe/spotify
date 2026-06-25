import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/app_rounded_btn.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/UI/custom_widgets/playlist_list_compo.dart';
import 'package:spotify/domain/app_color.dart';

class LibraryBottomNavPage extends StatelessWidget {
  LibraryBottomNavPage({super.key});

  final List<String> libraryList = [
    'Playlists', 'Artists',' Albums', "Podcast"
  ];

  final List<Map<String, String>> libraryItems = [
    {
      "imagPath": "assets/images/Chon.png",
      "title": 'Liked Songs',
      "subTitle": 'Playlists',
    },
    {
      "imagPath": "assets/images/Bryce Vine.png",
      "title": 'Bryce Vine',
      "subTitle": 'Artist',
    },
    {
      "imagPath": "assets/images/Dance Gavin Dance.png",
      "title": 'Gavin Dance',
      "subTitle": 'Artist',
    },
    {
      "imagPath": "assets/images/Chon.png",
      "title": 'Liked Songs',
      "subTitle": 'Playlists',
    },
    {
      "imagPath": "assets/images/Chon.png",
      "title": 'Liked Songs',
      "subTitle": 'Playlists',
    },
    {
      "imagPath": "assets/images/Chon.png",
      "title": 'Liked Songs',
      "subTitle": 'Playlists',
    },
    {
      "imagPath": "assets/images/Chon.png",
      "title": 'Nothings',
      "subTitle": 'Artist',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                MHeight(mHeight: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage('assets/images/rabbi.jpeg'),
                        ),
                        SizedBox(width: 7,),
                        Text(
                          'Your Library',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.whiteColor
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.add,
                      size: 25,
                      color: AppColor.whiteColor,
                    )
                  ],
                ),
                MHeight(mHeight: 17),
                SizedBox(height: 30,
                  child: ListView.builder(
                      itemCount: libraryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index){
                        final text = libraryList[index];
                        return Container(
                          margin: EdgeInsets.only(right: 5),
                          child: AppRoundedBtn(
                            onTap: () {},
                            text: text,
                            mWidth: 90,
                            mHight: 30,
                            isOutLine: true,
                            textColor: AppColor.whiteColor,
                          ),
                        );
                      }
                  ),
                ),
                MHeight(mHeight: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/arrow-narrow-down 2.svg'),
                        Text(
                          'Recently played',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.whiteColor
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/Component 17.svg',
                      color: AppColor.whiteColor,
                    )
                  ],
                ),
                MHeight(mHeight: 10,),
                // --- FIXED LISTVIEW BELOW ---
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: libraryItems.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final itemImg = libraryItems[index]['imagPath'] as String;
                      final itemTitle = libraryItems[index]['title'] as String;
                      final itemSubTile = libraryItems[index]['subTitle'] as String;
                      return PlaylistListCompo(
                        imagePath: itemImg,
                        title: itemTitle,
                        subTitle: itemSubTile,
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
