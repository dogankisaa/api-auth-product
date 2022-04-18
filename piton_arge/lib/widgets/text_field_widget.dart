import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldWidget extends StatefulWidget {
  final text;
  final controller;
  final validation;
  final mask;
  final maxLength;
  final isHidden;
  const TextFieldWidget({
    Key? key,
    this.text,
    this.validation,
    this.controller,
    this.maxLength,
    this.mask,
    this.isHidden,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    bool isHide = false;
    var defaultFormatter =
        new MaskTextInputFormatter(mask: '', type: MaskAutoCompletionType.lazy);
    return TextFormField(
      obscureText: widget.isHidden == false || widget.isHidden == null ? false : true,
      controller: widget.controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxLength ? 20 : null),
        widget.mask != null ? widget.mask : defaultFormatter
      ],
      validator: widget.validation,
      decoration: InputDecoration(
        labelText: widget.text,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
