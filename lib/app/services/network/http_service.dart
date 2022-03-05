import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_sample/app/constants/api_path.dart';

class HttpService {
  static final HttpService _singleton = HttpService._privateConstructor();
  factory HttpService() => _singleton;

  late Dio _dio;

  final _baseUrl = ApiPath.baseUrl;

  HttpService._privateConstructor() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );

    initializeInterceptors();
  }

  Future<Response> getRequest(Uri uri) async {
    try {
      final response = await _dio.getUri(uri);

      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        if (kDebugMode) {
          print(error.message);
        }
        handler.next(error);
      },
      onRequest: (requestOptions, handler) {
        if (kDebugMode) {
          print('${requestOptions.method} ${requestOptions.path}');
        }
        handler.next(requestOptions);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print('$response.data');
        }
        handler.next(response);
      },
    ));
  }
}
