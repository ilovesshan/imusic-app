import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:imusic_app/router/yf_router.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    // 使用 GetMaterialApp
    return GetMaterialApp(
      // APP主题配色方案
      theme: AppInitialize.appTheme(),
      // 路由解决方案(也可自行配置)
      initialRoute: YFRouter.login,
      getPages: YFRouter.routes(),
      builder: (_, c) {
        // android状态栏为透明沉浸式
        AppInitialize.setSystemUiOverlayStyle();
        // 屏幕适配
        AppInitialize.initScreenUtil(_);
        return FlutterEasyLoading(
          child: GestureDetector(
              child: c!,
              // 处理键盘
              onTap: () => AppInitialize.closeKeyBord(context)),
        );
      },
    );
  }
}
