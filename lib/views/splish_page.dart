import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:imusic_app/router/yf_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // 初始化 SharedPreferences
    SharedPreferencesUtil.initSharedPreferences();

    Future.delayed(const Duration(milliseconds: 2000), () {
      if (TextUtils.isNotValid(SharedPreferencesDao.getToken())) {
        Get.offAndToNamed(YFRouter.menuContainer);
      } else {
        Get.offAndToNamed(YFRouter.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Image.asset("assets/images/common/splash.png", fit: BoxFit.fill),
    );
  }
}
