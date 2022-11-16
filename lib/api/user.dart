import 'package:common_utils/common_utils.dart';
import 'package:imusic_app/model/user_login_model.dart';

class UserRequest {
  /// 登录
  static Future<UserLoginModel> login(Map<String, String> data) async {
    UserLoginModel userLoginModel = UserLoginModel();
    final result = await HttpHelper.getInstance().post("/login", data: data);
    if (result["code"] == 200 && result["data"] != null) {
      userLoginModel = UserLoginModel.fromJson(result["data"]);
    }
    return Future.value(userLoginModel);
  }
}
