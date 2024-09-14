import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/src/const.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

part 'interceptor.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> toJson);

class NetworkController {
  late Dio _dio;
  final dioOption = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );

  NetworkController() {
    _dio = Dio(dioOption);
    _dio.interceptors.add(_dioInterceptor);

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
        _dio.options.headers.addAll(headers);
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
        _dio.options.headers.addAll(headers);
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
      if (headers != null) {
        _dio.options.headers.addAll(headers);
      }
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
      if (headers != null) {
        _dio.options.headers.addAll(headers);
      }
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
