import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:imusic_app/views/login/widget/login_form.dart';
import 'package:imusic_app/views/login/widget/register_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width, height: Get.height, color: Get.theme.primaryColor, padding: EdgeInsets.only(top: 100.h),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r))),
          child: Column(
            children: <Widget> [
              TabBar(
                indicatorColor: Get.theme.primaryColor,
                labelColor: Get.theme.primaryColor,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                tabs: const <Tab>[Tab(text: "登录"), Tab(text: "注册"),]
              ),
              Expanded(
                child: TabBarView(
                  controller:_tabController,
                  children: const [LoginForm(), RegisterForm()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
