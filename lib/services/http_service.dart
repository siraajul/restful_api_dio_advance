import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:restful_api/services/dio/index.dart';
import 'package:restful_api/models/index.dart';
import '../helpers/url_helper.dart';
import '../models/error_info.dart';


class HttpService {
  HttpService._privateConstructor();

  static Dio dio = Dio(baseOptions)..interceptors.add(CustomInterceptors());

  static Map<String, dynamic> commonHeader() => {
        'Accept-Language': 'En',
        'Authorization': '12345678',
      };

  static Map<String, dynamic> getHeaders(Map<String, dynamic>? headers) {
    var requestHeaders = <String, dynamic>{};

    requestHeaders = commonHeader();

    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    return requestHeaders;
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);

    try {
      final response = await dio.get<String>(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);
    try {
      final response = await dio.post<String>(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);
    try {
      final response = await dio.put<String>(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);

    try {
      final response = await dio.patch<String>(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);
    try {
      final response = await dio.delete<String>(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> uploadFile(
    String url, {
    FormData? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);
    try {
      final response = await dio.patch<String>(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> postFormData(
    String url, {
    FormData? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);
    try {
      final response = await dio.post<String>(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  // ignore: long-parameter-list
  static Future<HttpResponse> postDynamicData(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? pathKeys,
    String contentType = ContentType.json,
  }) async {
    // ignore: parameter_assignments
    url = UrlHelper.generatePathKeyUrl(url, pathKeys);
    try {
      final response = await dio.post<String>(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: getHeaders(headers),
          contentType: contentType,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      return generateResponse(response);
    } on DioError catch (ex) {
      return generateDioErrorResponse(ex.message!);
    }
  }

  static HttpResponse generateResponse(Response<String> response) {
    final httpResponse = HttpResponse();
    final payload = jsonDecode(response.data ?? '');

    httpResponse
      ..payload = response.data
      ..statusCode = response.statusCode;

    if (payload is Map<String, dynamic> && payload['Error'] != null) {
      final errorInfo = ErrorInfo.fromJson(payload['Error']);
      httpResponse.error = errorInfo;
    }

    return httpResponse;
  }

  static HttpResponse generateDioErrorResponse(String message) {
    final httpResponse = HttpResponse(
      error: ErrorInfo(messages: {'generic': message}),
      statusCode: 500,
    );

    return httpResponse;
  }
}
