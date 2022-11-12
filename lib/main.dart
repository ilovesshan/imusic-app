import 'package:flutter/material.dart';
import 'package:imusic_app/api/hello.dart';
import 'package:imusic_app/utils/log_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'imusic 音乐盒'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _getData() {
    getData().then((value) => {printLog(StackTrace.current, value)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.title), centerTitle: true, elevation: 0),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getData,
        child: const Icon(Icons.add),
      ),
    );
  }
}
