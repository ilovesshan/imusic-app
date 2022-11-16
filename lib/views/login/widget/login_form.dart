import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:imusic_app/router/yf_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController _usernameController = TextEditingController(text: "ilovesshan");
  final TextEditingController _passwordController = TextEditingController(text: "ilovesshan123456!@#");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text("登录", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 5.h),
            Text("嗨，您好！欢迎登录imusic", style: TextStyle(fontSize: 16.sp, color: const Color(0xFF7b7e88))),

            SizedBox(height: 30.h),
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: "用户名/手机号", labelStyle: TextStyle(fontSize: 14.sp), hintText: "输入用户名/手机号")),

            SizedBox(height: 10.h),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "密码", labelStyle: TextStyle(fontSize: 14.sp), hintText: "输入登录密码"), obscureText: true),

            SizedBox(height: 50.h),
            Text("忘记密码?", style: TextStyle(fontSize: 14.sp, color: Get.theme.primaryColor)),

            const SizedBox(height: 80),
            FractionallySizedBox(widthFactor: 1, child: ElevatedButton(child: const Text("登录"),
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                     if(TextUtils.isValid(username) || TextUtils.isValid(password)){
                       EasyLoading.showToast("请输入正确的用户名或者密码");
                        return;
                     }else{
                       Get.offAndToNamed(YFRouter.menuContainer);
                     }
                  }
              )),

            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("没有账号?", style: TextStyle(color: const Color(0xFF7A869A),fontSize: 14.sp),),
                Text("立即注册", style: TextStyle(color: Get.theme.primaryColor, fontSize: 14.sp),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
