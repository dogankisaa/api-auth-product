



import 'package:flutter/material.dart';

class LoginRemember extends ChangeNotifier{
  bool _rememberMe = false;
  

  bool get getRemember{
    return _rememberMe;
  }

  void changeRememberMeStatus(bool rememberMe){
    _rememberMe = rememberMe;
    notifyListeners();
  }

}