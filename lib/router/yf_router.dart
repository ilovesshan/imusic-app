import 'package:common_utils/common_utils.dart';
import 'package:imusic_app/views/home/menu_container.dart';
import 'package:imusic_app/views/login/login_page.dart';
import 'package:imusic_app/views/splish_page.dart';

class YFRouter {
  static const String splash = "/splash";
  static const String menuContainer = "/menuContainer";
  static const String login = "/login";

  static List<GetPage> routes() {
    return [
      GetPage(name: splash, page: () => const SplashPage()),
      GetPage(name: login, page: () => const LoginPage()),
      GetPage(name: menuContainer, page: () => const MenuContainer()),
    ];
  }

  static onUnknownRoute() {}
}