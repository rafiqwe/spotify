import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/UI/custom_widgets/compact_music_player.dart';
import 'package:spotify/UI/dashboard/navigations/home_bottom_nav_page.dart';
import 'package:spotify/UI/dashboard/navigations/library_bottom_nav_page.dart';
import 'package:spotify/UI/dashboard/navigations/search_bottom_nav_page.dart';
import 'package:spotify/domain/app_color.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<Widget> navigationItems = [
    HomeBottomNavPage(),
    SearchBottomNavPage(),
    LibraryBottomNavPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 11,
        currentIndex: currentIndex,
        backgroundColor: AppColor.blackColor,
        selectedLabelStyle: TextStyle(color: AppColor.whiteColor),
        unselectedLabelStyle: TextStyle(color: AppColor.greyColor),
        selectedItemColor: AppColor.whiteColor,
        unselectedItemColor: AppColor.greyColor,

        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home_outline.svg',
              color: AppColor.greyColor,
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              'assets/icons/Home_Solid.svg',
              color: AppColor.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Search_outline.svg',
              color: AppColor.greyColor,
            ),
            label: 'Search',
            activeIcon: SvgPicture.asset(
              'assets/icons/Search_Solid.svg',
              color: AppColor.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Library_outline.svg',
              color: AppColor.greyColor,
            ),
            label: 'Library',
            activeIcon: SvgPicture.asset(
              'assets/icons/Library_Solid.svg',
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          navigationItems[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: CompactMusicPlayer(
              songTile: 'From Me to You - Mono ',
              albumTitle: 'Remastered',
              songImg: 'Screen Shot 2021-12-08 at 13.39 2.png',
              bluetoothName: 'BEATSPILL+',
              isBluetooth: true,
            ),
          ),
        ],
      ),
    );
  }
}
