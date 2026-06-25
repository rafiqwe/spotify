
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';

class ProfilePage extends StatelessWidget {
  String profileImagePath;
  ProfilePage({super.key, required this.profileImagePath});
  PaletteGenerator? paletteGenerator;

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.15,1.0],
                      colors:[
                        HSLColor.fromColor(Colors.pink).withLightness(0.30).toColor(),
                        Colors.black
                      ]
                  )
                ),
                child: Column(
                  children: [
                    MHeight(mHeight: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/ChevronLeft.svg'),
                          Icon(Icons.more_horiz_sharp, size: 25, color: Colors.white,)
                        ],
                      ),
                    ),
                    MHeight(
                      mHeight: 30,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:AssetImage('assets/images/rabbi.jpeg'),
                    ),
                    MHeight(
                      mHeight: 35,
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3E3F3F),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white, // Fixed with standard hex syntax
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ),
                    ),
                    MHeight(
                      mHeight: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '24',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Playlists',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '59',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'FOLLOWERS',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '6',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'FOLLOWING',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Column(
                  children: [
                    Text('Playlists', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                    Row(
                      children: [
                        Image.asset(
                            'assets/images/MGK.png',
                          width: 80,
                          height: 70,
                        ),
                        // ListTile(
                        //   title: Text(
                        //       'Shazam',
                        //   ),
                        //   subtitle: Text(
                        //       '7 likes',
                        //   ),
                        //   titleTextStyle: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 14
                        //   ),
                        //   subtitleTextStyle: TextStyle(
                        //     color: Colors.grey,
                        //     fontSize: 12
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
