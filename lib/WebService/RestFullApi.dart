import 'package:dio/dio.dart';
import 'package:flutter_app/Models/LoginHistoryModel.dart';

class RestFullApi {
  static String loginUrl = 'user/login-history';

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://cf-stage.emtiyaz.app/',
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ),
  );

  static Future<LoginHistory> loginHistoryMethod(String page, String token) async {
    try {
      FormData formData = FormData.fromMap({"page": page, "record_number": "5"});
      dio.options.headers["Authorization"] = token;
      Response response = await dio.post(loginUrl, data: formData);
      if (response.statusCode == 200 && response.data != null) {
        return LoginHistory.fromJson(response.data);
      } else {
        return throw DioError;
      }
    } on DioError catch (e) {
      return throw Exception(e.toString());
    }
  }
}
