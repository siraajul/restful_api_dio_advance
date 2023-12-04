import 'package:restful_api/models/index.dart';

import '../models/user.dart';
import 'http_service.dart';

class UserService {

  var apiEndpoint = 'https://reqres.in/api';

  Future<HttpResponse> getItemList({
    int currentPage = 1,
  }) async {
    final url = '$apiEndpoint/users?delay=3';
    final params = {
      'page': currentPage,
    };
    final response = await HttpService.get(
      url,
      queryParameters: params,
    );

    return response;
  }

  Future<HttpResponse> getUserById(
      String userId,
      ) async {
    final url =
        '$apiEndpoint/users?delay=3/$userId';

    final response = await HttpService.get(url);

    return response;
  }

  Future<HttpResponse> createUser(
     String name,
      String job,
      ) async {
    final url =
        '$apiEndpoint/users';
    final payload = {
    "name": name,
    "job": job,
    };

    final response = await HttpService.post(url, body: payload);

    return response;
  }

  // Future<HttpResponse> deleteUser(String addressId) async {
  //   final url =
  //       '';
  //   final params = {
  //     'addressID': addressId,
  //   };
  //   final response = await HttpService.delete(url, queryParameters: params);
  //
  //   return response;
  // }
}