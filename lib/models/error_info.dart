class ErrorInfo {
  ErrorInfo({
    this.statusCode,
    this.type,
    this.logId,
    this.messages,
  });

  ErrorInfo.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    type = json['Type'];
    logId = json['LogId'];
    messages = json['Messages'] != null
        ? Map<String, String>.from(json['Messages'] as Map)
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    data['Type'] = type;
    data['LogId'] = logId;
    if (messages != null) {
      data['Messages'] = messages;
    }

    return data;
  }

  int? statusCode;
  String? type;
  String? logId;
  Map<String, String>? messages;
}

class Messages {
  Messages({this.oTP, this.phoneNumber});

  Messages.fromJson(Map<String, dynamic> json) {
    oTP = json['OTP'];
    phoneNumber = json['PhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['OTP'] = oTP;
    data['PhoneNumber'] = phoneNumber;

    return data;
  }

  String? oTP;
  String? phoneNumber;
}
