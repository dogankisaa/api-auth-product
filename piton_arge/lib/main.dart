import 'package:flutter/material.dart';
import 'package:piton_arge/globalVariables/login_variables.dart';
import 'package:piton_arge/globalVariables/product_detail_variables.dart';
import 'package:piton_arge/screens/product_screen.dart';
import 'package:piton_arge/screens/starter_screen.dart';
import 'package:piton_arge/widgets/login_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  bool _isLogin = false;

  getLocalData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final isLogin = pref.getBool("isLogin");

    setState(() {
      _isLogin = isLogin!;
    });
  }

  @override
  void initState() {
    getLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginRemember()),
        ChangeNotifierProvider.value(value: ProductDetail()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  _isLogin ? ProductScreen(): RegisterScreen(),
          navigatorKey: navigatorKey,
          routes: <String, WidgetBuilder>{
            '/product': (BuildContext context) => new ProductScreen(),
          }),
    );
  }
}
