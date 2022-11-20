import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:imusic_app/router/yf_router.dart';
import 'package:imusic_app/views/home/widget/nav_category_card.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({Key? key}) : super(key: key);

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {

  final List<String> _bannerList  = ["assets/images/home/banner01.png","assets/images/home/banner02.png","assets/images/home/banner03.png",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 头部
            _buildHeaderWidget(),

          ],
        ),
      )
    );
  }


  /// 头部Widget
  Widget _buildHeaderWidget() {
    return Container(
      height: 375.h,
      child: Stack(
        children: [
          Container(
            width: 375.w, height: 235.w, decoration: BoxDecoration(color: Get.theme.primaryColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(130.r))),
            alignment: Alignment.topCenter,
            child: Container(
              width: 375.w, height: 78.h, padding: EdgeInsets.symmetric(horizontal: 25.w), margin: EdgeInsets.only(top: 44.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(TimeUtil.getTextByDate(), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5))),
                      SizedBox(height: 4.h),
                      Text(SharedPreferencesDao.getUsername(),style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/home/bell.png", width: 24.w, height: 24.w,),
                      SizedBox(width: 16.w),
                      ClipRRect(borderRadius: BorderRadius.circular(19.r), child: Image.asset("assets/images/common/login-user-avatar.jpg", width: 38.w, height: 38.w),),
                    ],
                  )
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 137.h), padding: EdgeInsets.only(left: 20.w),
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child: Row(
                children: [
                  NavCategoryCard(imgSrc:_bannerList[0], title: "Hip Hop", payCount:1479, onPressed: ()=>{}),
                  SizedBox(width: 20.w),
                  NavCategoryCard(imgSrc:_bannerList[0], title: "Soul Pop", payCount:4129, onPressed: ()=>{}),
                  SizedBox(width: 20.w),
                  NavCategoryCard(imgSrc:_bannerList[0], title: "Lo-Fi Beats", payCount:3479, onPressed: ()=>{}),
                ]
              ),
            ),
          )
        ],
      ),
    );
  }


  
  /// 退出登录
  void _logout() {
    SharedPreferencesDao.removeId();
    SharedPreferencesDao.removePassword();
    SharedPreferencesDao.removeToken();
    Get.offAndToNamed(YFRouter.login);
  }
}
