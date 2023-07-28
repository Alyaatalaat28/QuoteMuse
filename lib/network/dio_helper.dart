import 'package:dio/dio.dart';

class DioHelper{
 static  Dio dio = Dio();
  static Future<void> init() async{
    dio =  Dio(
      BaseOptions(
        receiveDataWhenStatusError: true ,
      ),
    );
  }
  }