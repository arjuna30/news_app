import 'package:auto_route/auto_route.dart';
import 'package:news_app/src/page/home_page.dart';
import 'package:news_app/src/page/webview_page.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = <AutoRoute>[
    HomePage.route,
    CustomWebViewPage.route,
  ];
}
