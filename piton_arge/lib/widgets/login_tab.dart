import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:piton_arge/models/login_error_model.dart';
import 'package:piton_arge/service/login_service.dart';
import 'package:piton_arge/widgets/button_widget.dart';
import 'package:piton_arge/widgets/text_field_widget.dart';
import 'package:piton_arge/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globalVariables/login_variables.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final validPasswordCharacters = RegExp(r'^[a-zA-Z0-9]+$');
bool rememberMe = false;
String errorMessage = "Hatalı email yada şifre";
final _key = GlobalKey<FormState>();

class _LoginTabState extends State<LoginTab> {
  void _changeRememberStatus(BuildContext context) {
    Provider.of<LoginRemember>(context, listen: false)
        .changeRememberMeStatus(rememberMe);
  }

  var snackBar = SnackBar(
    content: Text( "Hatalı email yada şifre"),
  );
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Center(
              child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  controller: emailController,
                  maxLength: false,
                  text: "Email",
                  validation: (input) {
                    if (input.isEmpty) {
                      return "Lütfen mail adresinizi giriniz";
                    } else if (EmailValidator.validate(input) == false) {
                      return "Lütfen geçerli bir mail adresi giriniz.";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  controller: passwordController,
                  isHidden: true,
                  maxLength: true,
                  validation: (input) {
                    if (input.isEmpty) {
                      return "Lütfen Şifrenizi giriniz";
                    } else if (input.length < 6) {
                      return "En az 6 karakter girebilirsiniz.";
                    } else if (validPasswordCharacters.hasMatch(input)) {
                      return "Şifreniz en az 1 harf, rakam veya karakter içermelidir";
                    }
                  },
                  text: "Password",
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  text: "Giriş Yap",
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      LoginErrorModel model = await dioLogin(
                          emailController.text, passwordController.text);
                      errorMessage = model.error;

                      if (model.error == "") {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: rememberMe,
                      onChanged: (bool? value) async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        setState(() {
                         
                          rememberMe = value!;
                      pref.setBool("isLogin", rememberMe);
                        });
                      },
                    ),
                    const TextWidget(
                      size: 17.0,
                      text: "Beni Hatırla",
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
