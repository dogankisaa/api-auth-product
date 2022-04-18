import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final onTap;
  final text;
  const ButtonWidget({
    Key? key, this.text, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: double.infinity, height: 60),
      child: ElevatedButton(
          onPressed:onTap,
          child: Center(
            child: Text(text, style: TextStyle(
              fontSize: 20
            ),),
          ),
          style: ButtonStyle(
              shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )))),
    );
  }
}