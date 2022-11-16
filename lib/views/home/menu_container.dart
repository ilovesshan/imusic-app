import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:imusic_app/router/yf_router.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({Key? key}) : super(key: key);

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text("欢迎您： ${SharedPreferencesDao.getUsername()}"),
          onDoubleTap: () {
            SharedPreferencesDao.removeId();
            SharedPreferencesDao.removePassword();
            SharedPreferencesDao.removeToken();
            Get.offAndToNamed(YFRouter.login);
          },
        ),
      ),
    );
  }
}
