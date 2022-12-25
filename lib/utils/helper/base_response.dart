import '../../data/model/auth/login.dart';

class BaseResponse {
  BaseResponse({
    this.message,
    this.result,
  });

  BaseResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  String? message;
  Result? result;

  BaseResponse copyWith({
    String? message,
    Result? result,
  }) =>
      BaseResponse(
        message: message ?? this.message,
        result: result ?? this.result,
      );
}

class Result {
  Result({this.login});

  Result.fromJson(dynamic json) {
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
  }

  Login? login;

  Result copyWith({
    Login? login,
  }) =>
      Result(
        login: login ?? this.login,
      );

  Map toJson() => {
    'login': login,
  };
}