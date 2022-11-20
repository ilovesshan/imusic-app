import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:imusic_app/api/user.dart';
import 'package:imusic_app/model/user_login_model.dart';
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
            Text("登录", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 5.h),
            Text("嗨，您好！欢迎登录imusic", style: TextStyle(fontSize: 14.sp, color: const Color(0xFF7A869A))),

            SizedBox(height: 30.h),
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: "用户名/手机号", labelStyle: TextStyle(fontSize: 14.sp), hintText: "输入用户名/手机号")),

            SizedBox(height: 25.h),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "密码", labelStyle: TextStyle(fontSize: 14.sp), hintText: "输入登录密码"), obscureText: true),

            SizedBox(height: 20.h),
            Text("忘记密码?", style: TextStyle(fontSize: 14.sp, color: Get.theme.primaryColor)),

            SizedBox(height: 25.h),
            SizedBox(width: Get.width, height: 44.h, child: ElevatedButton(child: const Text("登录"),
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                     if(TextUtils.isValid(username) || TextUtils.isValid(password)){
                       EasyLoading.showToast("请输入正确的用户名或者密码");
                        return;
                     }else{
                      final UserLoginModel loginModel = await UserRequest.login({"username":username,"password":password});
                      SharedPreferencesDao.saveId("${loginModel.id}");
                      SharedPreferencesDao.saveUsername("${loginModel.username}");
                      SharedPreferencesDao.saveToken("${loginModel.token}");
                      Get.offAndToNamed(YFRouter.menuContainer);
                     }
                  }
              )),

            SizedBox(height:103.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("没有账号?", style: TextStyle(color: const Color(0xFF7A869A),fontSize: 14.sp),),
                Text("立即注册", style: TextStyle(color: Get.theme.primaryColor, fontSize: 14.sp),)
              ],
            ),
            SizedBox(height: 84.h),
          ],
        ),
      ),
    );
  }
}
