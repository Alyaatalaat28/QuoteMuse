import 'package:dio/dio.dart';

class DioHelper{
 static  Dio dio = Dio();
  static Future<void> init() async{
    dio =  Dio(
      BaseOptions(
        baseUrl: 'https://api.quotable.io/',
        receiveDataWhenStatusError: true ,
      ),
    );
  }

  static Future<Response> getData({
   required String url ,
  Map<String, dynamic>? query ,}
  )async {
    return await dio.get(
      url,
      queryParameters: query
    );
  }

  }