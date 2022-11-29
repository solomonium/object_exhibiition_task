import 'package:exhibition_task/export.dart';
import 'package:exhibition_task/iu/home_with_futurebuilder.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomeWithModel());
    }
  }
}
