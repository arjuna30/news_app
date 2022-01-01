import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/src/component/page_route.dart';
import 'package:news_app/src/repository/network/news_service.dart';
import 'package:news_app/src/repository/news_repository.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //factory
        Bind.factory((i) => NewsService(Modular.get())),

        //singleton
        Bind.singleton((i) => Dio(_option)),
        Bind.singleton((i) => NewsRepository(Modular.get())),
      ];

  @override
  List<ModularRoute> get routes => pageRoutes;
}

var _option = BaseOptions(
  baseUrl: 'https://60a4954bfbd48100179dc49d.mockapi.io',
  connectTimeout: 10000,
  receiveTimeout: 10000,
);
