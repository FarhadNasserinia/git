import 'package:dio/dio.dart';

// import 'package:emtiyaz/rest_full_api/dio_singleton.dart';
// import 'package:emtiyaz/utils/shared_preferences_util.dart';
import 'package:flutter/cupertino.dart';

class ApiGeneral {
  String method;
  String url;
  Map<String, dynamic> data;
  Map<String, dynamic> queryParam;
  Map<String, dynamic> header;

  // static SharedPreferencesUtil _pref = SharedPreferencesUtil();
  Dio _dio;

  ApiGeneral({@required this.method, @required this.url, this.data, this.queryParam, this.header}) {
    // _dio = DioSingleton.getInstance();
  }

  Future anyApi() async {
    try {
      _dio.options.method = method.toLowerCase();
      _dio.options.headers['Authorization'] = 'await' '_pref.getToken()';

      Response response = await _dio.request(url, data: this.data, queryParameters: queryParam);
      if (response.statusCode == 200 && response.data != null) {
        Map json = response.data;
        if (json['status']) {
          return json['data'];
        } else {
          return json['message'];
        }
      } else {
        return throw DioError();
      }
    } on DioError catch (e) {
      return throw Exception('something was problem ' + e.error.toString());
    }
  }
}
