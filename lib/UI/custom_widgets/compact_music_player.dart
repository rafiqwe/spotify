import 'package:flutter/material.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';

class CompactMusicPlayer extends StatelessWidget {
  final String songTile;
  final String albumTitle;
  final bool isBluetooth;
  final String bluetoothName;
  final String songImg;
  final double height;

  const CompactMusicPlayer({
    super.key,
    required this.songTile,
    required this.albumTitle,
    this.bluetoothName = '',
    required this.songImg,
    this.isBluetooth = false,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: height,
      width: double.infinity - 40,
      padding: EdgeInsets.only(left: 10, right: 10, top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0XFF550A1C).withOpacity(0.70),
      ),
      child: Column(
        children: [
          Row(
            spacing: 6,
            children: [
              Container(
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: AssetImage('assets/images/$songImg'),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$songTile/$albumTitle',
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 12.5,
                            fontFamily: 'demi',
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '.The B',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffB3B3B3),
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    isBluetooth
                        ? Row(
                            spacing: 5,
                            children: [
                              Icon(
                                Icons.bluetooth,
                                color: AppColor.primaryColor,
                                size: 15,
                              ),
                              Text(
                                bluetoothName,
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.bluetooth, color: AppColor.primaryColor, size: 23),
                  Icon(Icons.pause, color: AppColor.whiteColor, size: 23),
                ],
              ),
            ],
          ),
          MHeight(mHeight: 7),
          LinearProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
            color: AppColor.greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          // Stack(
          //   children: [
          //     Container(
          //       height: 6,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: AppColor.greyColor.withOpacity(0.6),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.bottomLeft,
          //       child: Container(
          //         height: 6,
          //         width: 180,
          //         decoration: BoxDecoration(
          //           color: AppColor.whiteColor,
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
