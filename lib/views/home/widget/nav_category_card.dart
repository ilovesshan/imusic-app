import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';

class NavCategoryCard extends StatelessWidget {
  final String imgSrc;
  final String title;
  final int payCount;
  final OnPressed onPressed;

  const NavCategoryCard({Key? key, required this.imgSrc,  required this.title,  required this.payCount,  required this.onPressed, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          ClipRRect(child: Image.asset(imgSrc,fit: BoxFit.fill, width: 120.w, height: 220.h), borderRadius: BorderRadius.circular(10.r)),
          Positioned(
            top: 20.h, left: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w500)),
                Text("$payCount 播放量", style: TextStyle(fontSize: 14.sp, color: Colors.white.withOpacity(0.8))),
              ],
            ),
          )
        ],
      ),
      onTap: onPressed,
    );
  }
}
