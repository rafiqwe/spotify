import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify/UI/custom_widgets/compact_music_player.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/UI/dashboard/navigations/home_bottom_nav_page.dart';
import 'package:spotify/UI/dashboard/navigations/libary/library_bottom_nav_page.dart';
import 'package:spotify/UI/dashboard/navigations/libary/profile_page.dart';
import 'package:spotify/UI/dashboard/navigations/search_bottom_nav_page.dart';
import 'package:spotify/domain/app_color.dart';
import 'package:spotify/domain/ui_helper.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PaletteGenerator? paletteGenerator;
  int currentIndex = 0;
  double currentValue= 40;
  bool isPlay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePaletterGenerator();
  }

  initializePaletterGenerator() async {
    paletteGenerator = await getColorPalette('assets/images/Screen Shot 2021-12-08 at 13.39 2.png');
    setState(() {
    });
  }

  List<Widget> navigationItems = [
    HomeBottomNavPage(),
    SearchBottomNavPage(),
    ProfilePage(profileImagePath: '',),
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
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_){
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.16,1.0],
                            colors: [
                              HSLColor.fromColor(paletteGenerator!.dominantColor!.color).withLightness(0.38).toColor(),
                              Colors.black
                            ]
                        )
                    ),
                    child: Column(
                      children: [
                        MHeight(
                          mHeight: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  child: SvgPicture.asset('assets/icons/Down.svg', width: 28, color: AppColor.whiteColor,),
                                onTap: (){
                                    Navigator.pop(context);
                                },
                              ),
                              Text('1(Remastered)', style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor
                              ),),
                              Icon(Icons.more_horiz, color: AppColor.whiteColor,)
                            ],
                          ),
                        ),
                        MHeight(
                          mHeight: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/Screen Shot 2021-12-08 at 13.39 2.png',
                              height: 320,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        MHeight(
                          mHeight: 5,
                        ),
                        Column(
                          children: [
                            ListTile(
                              title: Text('From Me to You - Mono / Remastered', maxLines: 1, softWrap: false,),
                              subtitle: Text('The Beatles'),
                              trailing: Icon(Icons.favorite_border, size: 25, color: AppColor.whiteColor,),
                              titleTextStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.whiteColor,
                                overflow: TextOverflow.fade,
                              ),
                              subtitleTextStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greyColor
                              ),
                            ),
                            StatefulBuilder(
                              builder: (_, ss) {
                                return Slider(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  max: 100,
                                  min: 0,
                                  activeColor: AppColor.whiteColor,
                                  thumbColor: AppColor.whiteColor,
                                  inactiveColor: AppColor.greyColor,
                                  value: currentValue,
                                  onChanged: (value) {
                                    ss(() {
                                      currentValue = value;
                                    });
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('1.10', style: TextStyle(
                                    color: AppColor.greyColor,
                                    fontSize: 14,

                                  ),),
                                  Text('3.10',style: TextStyle(
                                      color: AppColor.greyColor,
                                      fontSize: 14
                                  ),),
                                ],
                              ),
                            ),
                            MHeight(
                              mHeight: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset('assets/icons/Shuffle-1.svg', color: Colors.green,),
                                  Icon(Icons.skip_previous_sharp, color: AppColor.whiteColor, size: 43,),
                                  StatefulBuilder(
                                      builder: (context, ss) {
                                        return InkWell(
                                            onTap: (){
                                              isPlay = !isPlay;
                                              ss(() {
                                              });
                                            },
                                            child: Icon(
                                              isPlay ? Icons.pause_circle_filled_sharp : Icons.play_circle_fill_sharp,
                                              color: AppColor.whiteColor,
                                              size: 70,
                                            )
                                        );
                                      }
                                  ),
                                  Icon(Icons.skip_next_sharp, color: AppColor.whiteColor, size: 43,),
                                  SvgPicture.asset('assets/icons/Repeat-1.svg', color: Colors.green,)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.bluetooth, color: Colors.green, size: 15,),
                                      Text(
                                        'BEATSPALL+',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                        ),
                                      ),

                                    ],
                                  ),

                                  Row(
                                    spacing: 20,
                                    children: [
                                      SvgPicture.asset('assets/icons/Share.svg', color: Colors.white, width: 15,),
                                      SvgPicture.asset('assets/icons/Component 27.svg', color: Colors.white, width: 15,),
                                      // SvgPicture.asset('assets/icons/Component 27.png', color: Colors.white,),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
                );

              },
              child: CompactMusicPlayer(
                songTile: 'From Me to You - Mono ',
                albumTitle: 'Remastered',
                songImg: 'assets/images/Screen Shot 2021-12-08 at 13.39 2.png',
                bluetoothName: 'BEATSPILL+',
                isBluetooth: true,
                bgColor: Color(0XFF550A1C).withOpacity(0.70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
