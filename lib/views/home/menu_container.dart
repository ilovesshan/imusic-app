import 'package:flutter/material.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({Key? key}) : super(key: key);

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("首页界面")));
  }
}
