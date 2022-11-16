import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInitialize {

  /// 设置android状态栏为透明的沉浸
  static void setSystemUiOverlayStyle(){
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }


  /// 初始化屏幕适配工具
  static void initScreenUtil(BuildContext context){
    ScreenUtil.init(context, designSize: const Size(375, 812));
  }


  /// 点击空白区域关闭键盘
  static void closeKeyBord(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }


  /// APP 主题定制
  static ThemeData appTheme() {
    return ThemeData(
        canvasColor: Colors.white,
        primarySwatch: ColorsUtil.createMaterialColor(Color(int.parse("FF0439b0", radix: 16) | 0xFF000000)),
        primaryColor: Color(int.parse("FF0439b0", radix: 16) | 0xFF000000),
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   selectedItemColor: Color(0xFF0439b0),
        //   unselectedItemColor: Color(0xFF0439b0),
        //   selectedLabelStyle:TextStyle(color: Color(0xFF0439b0), fontSize: 10),
        //   unselectedLabelStyle:TextStyle(color: Color(0xFF0439b0), fontSize: 10),
        // )
    );
  }


  /// 国际化
  static Iterable<LocalizationsDelegate<dynamic>> internationalization(){
    Iterable<LocalizationsDelegate<dynamic>> iterable = [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ];
    return iterable;
  }
}