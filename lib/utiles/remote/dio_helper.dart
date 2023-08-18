import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://trsrv.xtra-go.com:8010/Products/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'MyToken': '7QP4688NC9BG00YN3GI5GLQITLJQFD'
    };
    return await dio!.post(url, data: body);
  }
}