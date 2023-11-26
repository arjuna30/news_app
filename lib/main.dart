import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/src/app_module.dart';
import 'package:news_app/src/component/app_router.dart';

final injector = GetIt.I;

void main() {
  AppModule.injectModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: injector.get<AppRouter>().defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        injector.get<AppRouter>(),
        navigatorObservers: () => [AutoRouteObserver()],
      ),
    );
  }
}
