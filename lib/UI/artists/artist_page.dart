import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/app_rounded_btn.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/app_route.dart';
import 'package:spotify/domain/ui_helper.dart';

class ArtistPage extends StatefulWidget {
  ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  List<int> selectedList = [];

  List<Map<String, String>> artistLists = [
    {'img': 'assets/images/The Office.png', 'name': 'The Weeknd'},
    {'img': 'assets/images/Time Bomb.png', 'name': 'Taylor Swift'},
    {'img': 'assets/images/Tycho.png', 'name': 'Drake'},
    {'img': 'assets/images/Afterburner.png', 'name': 'Billie Eilish'},
    {'img': 'assets/images/Bryce Vine.png', 'name': 'Travis Scott'},
    {'img': 'assets/images/Chon.png', 'name': 'Dua Lipa'},
    {'img': 'assets/images/Coastin.png', 'name': 'Bad Bunny'},
    {'img': 'assets/images/Dance Gavin Dance.png', 'name': 'Kendrick Lamar'},
    {'img': 'assets/images/Default.png', 'name': 'Ariana Grande'},
    {'img': 'assets/images/Members.png', 'name': 'Justin Bieber'},
    {'img': 'assets/images/MGK.png', 'name': 'Justin Bieber'},
    {'img': 'assets/images/Self Titled.png', 'name': 'Justin Bieber'},
  ];

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
          'Choose 3 or more artists you like.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColor.whiteColor,
            fontFamily: 'demi',
          ),
        ),
      ),
      body: Column(
        children: [
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
                  child: GridView.builder(
                    itemCount: artistLists.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 11,
                      crossAxisSpacing: 11,
                      childAspectRatio: 10 / 12,
                    ),
                    itemBuilder: (_, index) {
                      final artist = artistLists[index];
                      final artistName = artist['name'] as String;
                      final artistImg = artist['img'] as String;
                      return InkWell(
                        onTap: () {
                          if (!selectedList.contains(index)) {
                            setState(() {
                              selectedList.add(index);
                            });
                          } else {
                            setState(() {
                              selectedList.remove(index);
                            });
                          }
                        },
                        child: Column(
                          children: [
                            UiHelper.CustomRoundedImg(
                              imgPath: artistImg,
                              isSelected: selectedList.contains(index),
                            ),
                            MHeight(),
                            Text(
                              artistName,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'bold',
                                fontWeight: FontWeight.bold,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
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
                      child: selectedList.length >= 3
                          ? AppRoundedBtn(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoute.choose_podcast_page,
                                );
                              },
                              text: 'Next',
                              mHight: 40,
                              mWidth: 130,
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
