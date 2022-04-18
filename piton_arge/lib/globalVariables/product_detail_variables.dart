
import 'package:flutter/material.dart';

class ProductDetail extends ChangeNotifier{
  String _name = "";
  String _detail = "";
  String _price = "";

  String get getName{
    return _name;
  }

  String get getDetail{
    return _detail;
  }

  String get getPrice{
    return _price;
  }

  void setDetailName(String name){
    _name = name;
    notifyListeners();
  }

   void setDetail(String detail){
    _detail = detail;
    notifyListeners();
  }

   void setPrice(String price){
    _price = price;
    notifyListeners();
  }
}