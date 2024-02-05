import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'logger.dart';

class NetworkController {
  late Dio _dio;
  NetworkController() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://60a4954bfbd48100179dc49d.mockapi.io',
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ));
    if (kDebugMode) {
      _dio.interceptors.add(_dioLoggerInterceptor);
    }
  }

  Future<Response> get(
    String url, {
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required CancelToken cancelToken,
  }) async {
    try {
      if (headers != null) {
        _dio.options.headers = headers;
      }
      return await _dio.get(
        url,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return e.response!;
      }
      rethrow;
    }
  }

  Future<Response> post(String url,
      {dynamic body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      required CancelToken cancelToken}) async {
    try {
      if (headers != null) {
        _dio.options.headers = headers;
      }
      return await _dio.post(
        url,
        data: body,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return e.response!;
      }
      rethrow;
    }
  }

  Future<Response> put(String url,
      {dynamic body,
      Options? options,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      required CancelToken cancelToken}) async {
    try {
      return await _dio.put(url,
          data: body,
          options: options,
          queryParameters: queryParameters,
          cancelToken: cancelToken);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return e.response!;
      }
      rethrow;
    }
  }

  Future<Response> delete(String url,
      {dynamic body,
      Options? options,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      required CancelToken cancelToken}) async {
    try {
      return await _dio.delete(url,
          options: options,
          queryParameters: queryParameters,
          cancelToken: cancelToken);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return e.response!;
      }
      rethrow;
    }
  }
}
