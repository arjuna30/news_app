import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/main.dart';
import 'package:news_app/src/repository/model/base_response.dart';
import 'package:news_app/src/repository/network/controller/network_controller.dart';
import 'package:news_app/src/repository/network/exception/repository_exception.dart';

abstract class NetworkService {
  NetworkService(this.network);
  final NetworkController network;

  BaseResponse<T> defaultHttpResponseConverter<T>(Response response) {
    final Map<Type, JsonFactory> factories = injector.get();
    final jsonFactory = factories[T];
    try {
      if (jsonFactory == null && jsonFactory is! JsonFactory<T>) {
        throw RepositoryException<T>(
            message: 'Error converting response',
            stackTrace: StackTrace.current);
      } else {
        final datas = <T>[];
        BaseResponse<T> baseResponse =
            BaseResponse(statusCode: response.statusCode ?? 500);
        if (baseResponse.statusCode == HttpStatus.ok) {
          final data = response.data['articles'];
          if (data is! List) {
            final article = jsonFactory!(data);
            datas.add(article);
          } else {
            for (final dataArticle in data) {
              final article = jsonFactory!(dataArticle);
              datas.add(article);
            }
          }
        } else {
          Err? err;
          if (baseResponse.statusCode >= HttpStatus.badRequest &&
              baseResponse.statusCode < HttpStatus.internalServerError) {
            final data = response.data;
            err = Err.fromJson(data);
          } else {
            err = Err(
                status: 'error', code: 'serverError', message: 'Server Error.');
          }
          baseResponse = baseResponse.copyWith(error: err);
        }
        baseResponse = baseResponse.copyWith(datas: datas);
        return baseResponse;
      }
    } on TypeError catch (e) {
      throw RepositoryException<T>(
          message: e.toString(),
          stackTrace: e.stackTrace ?? StackTrace.current);
    }
  }
}
