import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';

class SearchSongItems extends StatelessWidget {
  const SearchSongItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your top genres',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor,
            ),
          ),
          MHeight(mHeight: 12),
          Row(
            children: [
              Container(
                width: 192,
                height: 109,
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length - 1)],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
