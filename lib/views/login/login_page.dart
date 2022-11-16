import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:imusic_app/router/yf_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(child: Text("登录界面"), onTap: ()=>{
          Get.offAndToNamed(YFRouter.menuContainer)
        },),
      ),
    );
  }
}
