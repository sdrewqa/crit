import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingTextFieldWidget extends StatelessWidget {
  BookingTextFieldWidget({
    super.key,
    required this.isPhoneTextField,
    required this.controller,
    required this.validator,
    required this.label,
    required this.keyboardType,
  });
  final bool isPhoneTextField;
  final String label;
  final TextEditingController controller;
  final Function validator;
  final TextInputType keyboardType;

  final _phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          controller: controller,
          inputFormatters: isPhoneTextField ? [_phoneMaskFormatter] : null,
          decoration: InputDecoration(
              prefixText: isPhoneTextField ? '+7 ' : '',
              labelText: label,
              errorStyle: const TextStyle(height: 0),
              fillColor: const Color.fromRGBO(246, 246, 249, 1)),
          style: const TextStyle(height: 1.6),
          autovalidateMode:
              label == 'Почта' ? AutovalidateMode.onUserInteraction : null,
          keyboardType: keyboardType,
          validator: (value) {
            return validator(value);
          }),
    );
  }
}