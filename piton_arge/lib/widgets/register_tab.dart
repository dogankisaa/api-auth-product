import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:piton_arge/service/register_service.dart';
import 'package:piton_arge/widgets/text_field_widget.dart';

import 'button_widget.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({Key? key}) : super(key: key);

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

final validPasswordCharacters = RegExp(r'^[a-zA-Z0-9]+$');
bool rememberMe = false;
TextEditingController _nameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _passwordController2 = TextEditingController();
TextEditingController _emailController = TextEditingController();
final _key = GlobalKey<FormState>();
var phoneFormatter = new MaskTextInputFormatter(
    mask: '+90(###) ###-##-##', type: MaskAutoCompletionType.lazy);
class _RegisterTabState extends State<RegisterTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(  
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: _nameController,
                      maxLength: false,
                      text: "Ad",
                      validation: (input) {
                        if (input.isEmpty) {
                          return "Lütfen adınızı giriniz";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      maxLength: false,
                      text: "Soy Ad",
                      validation: (input) {
                        if (input.isEmpty) {
                          return "Lütfen soy adınızı giriniz";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      mask: phoneFormatter,
                      maxLength: false,
                      validation: (input) {
                        if (input.isEmpty) {
                          return "Lütfen telefon numaranızı giriniz";
                        } 
                      },
                      text: "Telefon",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: _emailController,
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
                      isHidden: true,
                      controller: _passwordController,
                      maxLength: true,
                      validation: (input) {
                        if (input.isEmpty) {
                          return "Lütfen Şifrenizi giriniz";
                        } else if (input.length < 6) {
                          return "En az 6 karakter girebilirsiniz.";
                        } else if (validPasswordCharacters.hasMatch(input)) {
                          return "Şifreniz en az 1 harf, rakam veya karakter içermelidir";
                        }else if(_passwordController2.text != input){
                          return "Şifreler eşleşmelidir";
                        }
                      },
                      text: "Şifre",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      isHidden: true,
                      controller: _passwordController2,
                      maxLength: false,
                      text: "Şifre Tekrar",
                      validation: (input) {
                        if (input.isEmpty) {
                          return "Lütfen Şifrenizi giriniz";
                        } else if (input.length < 6) {
                          return "En az 6 karakter girebilirsiniz.";
                        } else if (validPasswordCharacters.hasMatch(input)) {
                          return "Şifreniz en az 1 harf, rakam veya karakter içermelidir";
                        } else if(_passwordController.text != input){
                          return "Şifreler eşleşmelidir";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      text: "Kayıt Ol",
                      onTap: () {
                        print(_nameController.text);
                        if (_key.currentState!.validate()) {
                          dioRegister(_nameController.text, _emailController.text, _passwordController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
