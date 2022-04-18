import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final size;
  final String text;
  const TextWidget({
    Key? key,
    this.size,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
