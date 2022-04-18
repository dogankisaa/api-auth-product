import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio dio = Dio();

dioUnLike(id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  final token = pref.getString("token");
  var headers = { 'access-token': token};

  var body = {'productId': id};
  print(id);
  Response response = await dio.post(
      "https://assignment-api.piton.com.tr/api/v1/product/like",
      data: body,
      options: Options(headers: headers));

  print(response.data);
}
