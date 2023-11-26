import 'package:dio/dio.dart';
import 'package:news_app/main.dart';
import 'package:news_app/src/component/app_router.dart';
import 'package:news_app/src/repository/network/news_service.dart';
import 'package:news_app/src/repository/news_repository.dart';

class AppModule {
  static injectModule() {
    injector.registerFactory<Dio>(() => Dio(_option));
    injector.registerFactory<NewsService>(() => NewsService(injector.get()));

    injector.registerSingleton<AppRouter>(AppRouter());

    injector.registerLazySingleton<NewsRepository>(
        () => NewsRepository(injector.get()));
  }
}

var _option = BaseOptions(
  baseUrl: 'https://60a4954bfbd48100179dc49d.mockapi.io',
  connectTimeout: 10000,
  receiveTimeout: 10000,
);
