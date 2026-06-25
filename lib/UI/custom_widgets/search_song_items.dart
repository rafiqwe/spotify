import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spotify/UI/custom_widgets/m_height.dart';
import 'package:spotify/domain/app_color.dart';

class SearchSongItems extends StatelessWidget {
   String Title;
   List<String> itemTexts;
   List<String>? itemImage;

   SearchSongItems({super.key,this.itemImage , required this.itemTexts , required this.Title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor,
            ),
          ),
          MHeight(mHeight: 12),
          SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: itemTexts.length,
                  itemBuilder:(context, index){
                    final text = itemTexts[index] as String;
                return topGenre(tumbnailPath: 'assets/images/MGK.png', itemText: text, context: context);
              }
              )
          )
        ],
      ),
    );
  }
}

Widget topGenre({tumbnailPath, itemText, context}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(5),
        child: Container(
          margin: EdgeInsets.only(right: 10),
          width: MediaQuery.of(context).size.width * 0.5 - 8,
          height: 140,
          decoration: BoxDecoration(
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length - 1)],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 110,
                  child: Text(itemText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                ),
              ),
              Positioned(
                right: -20,
                  bottom: 5,
                  child: Transform.rotate(
                  angle: 22 * pi/180,
                  child: Container(
                    width: 80,
                    height: 80,
        
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(tumbnailPath)
                      )
                    ),
                  ),
              )
        
              ),
        
            ],
          )
        ),
      ),
    ],
  );
}


