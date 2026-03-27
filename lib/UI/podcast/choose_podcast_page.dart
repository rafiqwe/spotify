import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/app_rounded_btn.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/UI/dashboard/dashboard_screen.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/app_route.dart';
import 'package:spotify/domain/ui_helper.dart';

class ChoosePodcastPage extends StatefulWidget {
  ChoosePodcastPage({super.key});

  @override
  State<ChoosePodcastPage> createState() => _ChoosePodcastPage();
}

class _ChoosePodcastPage extends State<ChoosePodcastPage> {
  List<Map<String, dynamic>> artistLists = [
    {
      'listName': 'More in Comedy',
      'data': [
        {'img': 'assets/images/The Office.png', 'name': 'The Weeknd'},
        {'img': 'assets/images/Time Bomb.png', 'name': 'Taylor Swift'},
        {'img': 'assets/images/Tycho.png', 'name': 'Drake'},
        {'img': 'assets/images/Afterburner.png', 'name': 'Billie Eilish'},
      ],
    },
    {
      'listName': 'More in Hip Hop',
      'data': [
        {'img': 'assets/images/Bryce Vine.png', 'name': 'Travis Scott'},
        {'img': 'assets/images/Chon.png', 'name': 'Dua Lipa'},
        {'img': 'assets/images/Coastin.png', 'name': 'Bad Bunny'},
        {
          'img': 'assets/images/Dance Gavin Dance.png',
          'name': 'Kendrick Lamar',
        },
      ],
    },
    {
      'listName': 'More in Pop',
      'data': [
        {'img': 'assets/images/Default.png', 'name': 'Ariana Grande'},
        {'img': 'assets/images/Members.png', 'name': 'Justin Bieber'},
        {'img': 'assets/images/MGK.png', 'name': 'Machine Gun Kelly'},
        {'img': 'assets/images/Self Titled.png', 'name': '21 Savage'},
      ],
    },
    {
      'listName': 'More in Rock',
      'data': [
        {'img': 'assets/images/Bryce Vine.png', 'name': 'Travis Scott'},
        {'img': 'assets/images/Chon.png', 'name': 'Dua Lipa'},
        {'img': 'assets/images/Coastin.png', 'name': 'Bad Bunny'},
        {
          'img': 'assets/images/Dance Gavin Dance.png',
          'name': 'Kendrick Lamar',
        },
      ],
    },
    {
      'listName': 'More in Indie',
      'data': [
        {'img': 'assets/images/Default.png', 'name': 'Ariana Grande'},
        {'img': 'assets/images/Members.png', 'name': 'Justin Bieber'},
        {'img': 'assets/images/MGK.png', 'name': 'Justin Bieber'},
        {'img': 'assets/images/Self Titled.png', 'name': 'Justin Bieber'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Now choose some \npodcasts.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'bold',
                  fontSize: 20,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
            MHeight(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: UiHelper.CustomTextFieldSearch(),
            ),
            MHeight(mHeight: 10),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      itemCount: artistLists.length,
                      // Outer ListView (The vertical one)
                      itemBuilder: (context, index) {
                        // Renamed to outerIndex for clarity
                        final row = artistLists[index];
                        final String categoryTitle = row['listName'];
                        final List<Map<String, String>> artists =
                            List<Map<String, String>>.from(row['data']);

                        return Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  // This is the horizontal list

                                  // THE THIRD ITEM (Dynamic Text)
                                  if (index == 2) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.primaries[Random()
                                                      .nextInt(
                                                        Colors
                                                                .primaries
                                                                .length -
                                                            1,
                                                      )],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Text(
                                                  categoryTitle, // <--- DYNAMIC TEXT HERE
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: AppColor.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    fontFamily: 'bold',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          MHeight(),
                                          Text(
                                            "",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  final artistName = artists[index]['name']!;
                                  final artistImg = artists[index]['img']!;

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      children: [
                                        UiHelper.CustomRoundedPodcastImg(
                                          imgPath: artistImg,
                                        ),
                                        MHeight(),
                                        Text(
                                          artistName,
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
                        );
                      },
                    ),
                  ),
                  MHeight(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.05, 0.8],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColor.blackColor.withOpacity(0.9),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Center(
                        child: AppRoundedBtn(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                            );
                          },
                          text: 'Next',
                          mHight: 40,
                          mWidth: 130,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
