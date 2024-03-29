import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/src/component/app_router.dart';
import 'package:news_app/src/repository/network/controller/network_controller.dart';
import 'package:news_app/src/repository/network/news_service.dart';
import 'package:news_app/src/repository/news_repository.dart';

class AppModule {
  static injectModule(GetIt injector) {
    injector.registerFactory<NetworkController>(() => NetworkController());
    injector.registerFactory<NewsService>(() => NewsService(injector.get()));

    injector.registerSingleton<CancelToken>(CancelToken());
    injector.registerSingleton<AppRouter>(AppRouter());

    injector.registerLazySingleton<NewsRepository>(
        () => NewsRepository(injector.get()));
  }
}
