import 'package:flutter/material.dart';
import 'package:piton_arge/globalVariables/login_variables.dart';
import 'package:piton_arge/widgets/button_widget.dart';
import 'package:piton_arge/widgets/login_tab.dart';
import 'package:piton_arge/widgets/register_tab.dart';
import 'package:piton_arge/widgets/text_field_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../widgets/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final validPasswordCharacters = RegExp(r'^[a-zA-Z0-9]+$');
bool rememberMe = false;
final _key = GlobalKey<FormState>();
class _RegisterScreenState extends State<RegisterScreen> {
  void _changeRememberStatus(BuildContext context) {
    Provider.of<LoginRemember>(context, listen: false)
        .changeRememberMeStatus(rememberMe);
  }

  @override
  Widget build(BuildContext context) {
    var token = Provider.of<LoginRemember>(context).getRemember;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Giriş Yap",
              ),
              Tab(
                text: "Kayıt Ol",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoginTab(),
            RegisterTab(),
          ],
        ),
      ),
    );
  }
}
