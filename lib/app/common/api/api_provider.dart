import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/config.dart';
import '../service/storage_service.dart';

StorageService box = StorageService.box;

Dio apiProvider() {
  final _dio = Dio();
  _dio
    //..options.baseUrl = Config.baseUrl
    ..options.connectTimeout = Config.timeout
    ..options.receiveTimeout = Config.receiveTimeout
    ..options.followRedirects = false
    ..options.receiveDataWhenStatusError = true
    //..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(
      QueuedInterceptorsWrapper(
          /**
        * onRequest interceptor - Called before firing the request
        */
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
        //add authtoken to request if needed
        return handler.next(options);
      },
          /**
         * onResponse interceptor - called on response- check access token and refresh
         */
          onResponse:
              (Response response, ResponseInterceptorHandler handler) async {
        return handler.next(response);
      },
          /**
         * onError interceptor - called on error
         */
          onError: (DioError dioError, ErrorInterceptorHandler handler) async {
        if (dioError.error is SocketException) {
          //handle network connection error here

        }
        return handler.next(dioError);
      }),
    );
  if (kDebugMode) {
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));
  }
  return _dio;
}
