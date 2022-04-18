import 'package:dio/dio.dart';
import 'package:piton_arge/screens/starter_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/product_screen.dart';

Dio dio = Dio();

dioRegister(name, mail, password) async {
 SharedPreferences pref = await SharedPreferences.getInstance();
  var headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json'
  };
  var body = {"name": name, "password": password, "email": mail};
  print("object");
  print(body);
  Response response = await dio.post(
      "https://assignment-api.piton.com.tr/api/v1/user/register",
      data: body, options: Options(
    validateStatus: (status) {
      return status! < 500;
    },
  ));
  if (response.statusCode == 200) {
   navigatorKey.currentState?.pushNamed('/product');
   
    pref.setString("token", response.data["token"]);
     
     
  }
  
}
