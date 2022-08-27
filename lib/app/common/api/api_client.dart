import 'dart:io';
import 'package:dio/dio.dart';

import '../constants/config.dart';

class ApiClient {
  // dio instance
  final Dio _api;

  // injecting dio instance
  ApiClient(this._api);

  // checking whether response is success or failure
  dynamic validateResponse(Response response) {
    if (response.data["errors"] == null) {
      return response.data;
    } else {
      return {};
    }
  }

  // Get API
  Future<dynamic> get({
    String? uri,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _api.get(
        uri ?? Config.baseUrl,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> uploadImage(File file, String signedUrl, String fileName) async {
    var fileLength = await file.length();
    var response = await _api.put(
      signedUrl,
      data: file.openRead(),
      options: Options(
        headers: {
          Headers.contentLengthHeader: fileLength,
          "Content-Type": "",
        },
      ),
    );
    return true;
  }

  // Post API
  Future<dynamic> post({
    String? uri,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final String finalUri = uri ?? Config.baseUrl;
      final Response response = await _api.post(
        finalUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return validateResponse(response);
    } catch (e) {
      //api_provider Dio onError function shows a toast
      return {};
    }
  }

  // Put API
  Future<dynamic> put({
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _api.put(
        Config.baseUrl,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
