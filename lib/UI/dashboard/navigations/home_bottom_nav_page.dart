import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/ui_helper.dart';

class HomeBottomNavPage extends StatelessWidget {
  HomeBottomNavPage({super.key});

  List<Map<String, dynamic>> rowFirst = [
    {
      'img': 'assets/images/Screen Shot 2021-12-08 at 13.39 2.png',
      'text': '1(Remastered)',
    },
    {
      'img': 'assets/images/Screen Shot 2021-12-08 at 14.16 1.png',
      'text': 'Lana Del Rey',
    },
    {
      'img': 'assets/images/Screen Shot 2021-12-08 at 14.18 1.png',
      'text': 'Marvin Gaye',
    },
    {
      'img': 'assets/images/Screen Shot 2021-12-08 at 14.33 1.png',
      'text': 'Indie Pop',
    },
  ];

  List<Map<String, dynamic>> rowTwo = [
    {
      'img': 'assets/images/Screen Shot 2021-12-07 at 14.11 1.png',
      'text': 'Your Top Songs 2026',
    },
    {
      'img': 'assets/images/Screen Shot 2021-12-07 at 14.17 1.png',
      'text': 'Your Artists Revealed',
    },
  ];

  List<Map<String, dynamic>> rowThree = [
    {
      'img': 'assets/images/Screen Shot 2021-12-07 at 14.22 1.png',
      'text': 'Ed Sheeran, Big Sean,\nJuice WRLD, Post Malone',
    },
    {
      'img': 'assets/images/Screen Shot 2021-12-07 at 14.27 1.png',
      'text': 'Mitski, Tame Impala,\nGlass Animals, Charli XCX',
    },
    {
      'img': 'assets/images/Screen Shot 2021-12-13 at 17.56 1.png',
      'text': 'Marvin Gaye',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently played',
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 19,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notification.svg',
                          color: AppColor.whiteColor,
                          height: 20,
                          width: 20,
                        ),
                        SvgPicture.asset(
                          'assets/icons/orientation lock.svg',
                          color: AppColor.whiteColor,
                          height: 20,
                          width: 20,
                        ),
                        SvgPicture.asset(
                          'assets/icons/Settings.svg',
                          color: AppColor.whiteColor,
                          height: 25,
                          width: 25,
                        ),
                      ],
                    ),
                  ],
                ),
                MHeight(mHeight: 20),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rowFirst.length,
                    itemBuilder: (context, index) {
                      final text = rowFirst[index]['text'] as String;
                      final img = rowFirst[index]['img'] as String;
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            UiHelper.CustomRoundedPodcastImg(
                              mHight: 105,
                              mWidth: 105,
                              imgPath: img,
                            ),
                            MHeight(),
                            Text(
                              text,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                MHeight(),
                ListTile(
                  leading: UiHelper.CustomRoundedPodcastImg(
                    mWidth: 100,
                    mHight: 100,
                    imgPath:
                        'assets/images/Screen Shot 2021-12-07 at 12.39 1.png',
                  ),
                  title: Text(
                    '#SPOTIFYWRAPPED',
                    style: TextStyle(fontSize: 10, color: AppColor.greyColor),
                  ),
                  subtitle: Text(
                    'Your 2025 in review',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'bold',
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
                MHeight(mHeight: 10),
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rowTwo.length,
                    itemBuilder: (context, index) {
                      final text = rowTwo[index]['text'] as String;
                      final img = rowTwo[index]['img'] as String;
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            UiHelper.CustomRoundedPodcastImg(
                              mHight: 160,
                              mWidth: 160,
                              imgPath: img,
                            ),
                            MHeight(),
                            Text(
                              text,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                MHeight(),
                Text(
                  'Editor’s picks',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'bold',
                    color: AppColor.whiteColor,
                  ),
                ),
                MHeight(),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rowThree.length,
                    itemBuilder: (context, index) {
                      final text = rowThree[index]['text'] as String;
                      final img = rowThree[index]['img'] as String;
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            UiHelper.CustomRoundedPodcastImg(
                              mHight: 160,
                              mWidth: 160,
                              imgPath: img,
                              isRounded: false,
                            ),
                            MHeight(),
                            Text(
                              text,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
