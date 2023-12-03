import 'package:dio/dio.dart';

BaseOptions baseOptions = BaseOptions(
  //baseUrl: APIEndpoints.baseUrl,
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
);
