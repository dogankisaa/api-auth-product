import 'package:dio/dio.dart';
import 'package:piton_arge/models/login_error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/product_screen.dart';

Dio dio = Dio();

dioLogin(email, password) async {
  LoginErrorModel model = LoginErrorModel();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var body = {"email": email, "password": password};
  Response response = await dio.post(
      "https://assignment-api.piton.com.tr/api/v1/user/login",
      data: body);
  if (response.statusCode == 200) {
    model.error = response.data["token"].toString();
    navigatorKey.currentState?.pushNamed('/product');
    pref.setString("token", response.data["token"]);
    

  }
  return model;
}
