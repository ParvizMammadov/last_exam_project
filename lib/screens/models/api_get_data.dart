import 'package:dio/dio.dart';
import 'package:last_exam_project/screens/models/model.dart';

class DataApi {
  Future<WeatherModel?> getAllUser() async {
    String url = 'https://api.openweathermap.org';
    Dio dio = Dio(BaseOptions(baseUrl: url));
    try {
      var response = await dio.get(
          '/data/2.5/forecast?lat=55&lon=-3&appid=6f113c0b8ac8d863206b6cf6cb7c3e8b');
      if (response.statusCode == 200) {
        var responseData = response.data;

        return responseData;
      } else {
        print('error : ${response.statusCode}');
      }
    } catch (e) {
      print('error catch : $e');
    }
    return null;
  }
}
