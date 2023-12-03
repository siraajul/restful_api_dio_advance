

import 'error_info.dart';

class HttpResponse {
  HttpResponse({
    this.payload,
    this.statusCode,
    this.error,
  });

  dynamic payload;
  int? statusCode;
  ErrorInfo? error;
}

class GenericResponse {
  GenericResponse({this.message, this.entityID});

  GenericResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    entityID = json['EntityID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Message'] = message;
    data['EntityID'] = entityID;

    return data;
  }

  String? message;
  String? entityID;
}
