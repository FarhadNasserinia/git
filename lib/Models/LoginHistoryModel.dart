// To parse this JSON data, do
//
//     final loginHistory = loginHistoryFromJson(jsonString);

import 'dart:convert';

LoginHistory loginHistoryFromJson(String str) => LoginHistory.fromJson(json.decode(str));

String loginHistoryToJson(LoginHistory data) => json.encode(data.toJson());

class LoginHistory {
  LoginHistory({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  Data data;

  factory LoginHistory.fromJson(Map<String, dynamic> json) => LoginHistory(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.loginHistory,
    this.currentPage,
    this.pages,
  });

  List<LoginHistoryElement> loginHistory;
  int currentPage;
  int pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    loginHistory: List<LoginHistoryElement>.from(json["login_history"].map((x) => LoginHistoryElement.fromJson(x))),
    currentPage: json["current_page"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "login_history": List<dynamic>.from(loginHistory.map((x) => x.toJson())),
    "current_page": currentPage,
    "pages": pages,
  };
}

class LoginHistoryElement {
  LoginHistoryElement({
    this.id,
    this.phoneNumber,
    this.username,
    this.email,
    this.loginIp,
    this.loginStatus,
    this.lastLogin,
    this.userAgent,
    this.user,
  });

  int id;
  String phoneNumber;
  dynamic username;
  dynamic email;
  String loginIp;
  bool loginStatus;
  DateTime lastLogin;
  String userAgent;
  int user;

  factory LoginHistoryElement.fromJson(Map<String, dynamic> json) => LoginHistoryElement(
    id: json["id"],
    phoneNumber: json["phone_number"],
    username: json["username"],
    email: json["email"],
    loginIp: json["login_ip"],
    loginStatus: json["login_status"],
    lastLogin: DateTime.parse(json["last_login"]),
    userAgent: json["user_agent"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone_number": phoneNumber,
    "username": username,
    "email": email,
    "login_ip": loginIp,
    "login_status": loginStatus,
    "last_login": lastLogin.toIso8601String(),
    "user_agent": userAgent,
    "user": user,
  };
}
