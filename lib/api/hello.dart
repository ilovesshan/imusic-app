import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> getData() async {
  final response = await http.get(
    Uri.parse("https://imusic-17670-5-1314961027.sh.run.tcloudbase.com1"),
    headers: {
      HttpHeaders.authorizationHeader: "TOKEN",
    },
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("请求时错误");
  }
}
