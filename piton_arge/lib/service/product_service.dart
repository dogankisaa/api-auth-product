import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio dio = Dio();

dioProduct() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  final token = pref.getString("token");
  var headers = {
  
     'Content-Type': 'application/json',
    'access-token': token
  };
  
  Response response = await dio.get(
      "https://assignment-api.piton.com.tr/api/v1/product/all",
      options: Options(headers: headers));
      print(response.data);

      
      return response.data["products"];
      
}
