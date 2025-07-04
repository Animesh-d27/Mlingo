import 'package:flutter/material.dart';
import 'package:mlingo/configs/new_app_theme.dart';

import '../../../configs/app_dimensions.dart';

typedef StringCallBack = Function(String textField);

class LanguageField extends StatelessWidget {
  final String text;
  final String hintText;
  final String? initialValue;
  final StringCallBack onTextFieldChanged;

  const LanguageField({
    super.key,
    required this.hintText,
    required this.onTextFieldChanged,
    required this.text,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    if (initialValue != null && controller.text.isEmpty) {
      controller.text = initialValue.toString();
    }
    return SizedBox(
        width: 650,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 5,
              child: Text(text,
                  style: Theme.of(context).textTheme.textFieldLabelTextStyle)),
          const SizedBox(width: 20),
          Expanded(
              flex: 10,
              child: TextFormField(
                  onChanged: (value) {
                    onTextFieldChanged(value);
                  },
                  initialValue: initialValue,
                  decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      hintText: hintText,
                      hintStyle: const TextStyle(
                          fontSize: kHintTextSize, color: Colors.black54))))
        ]));
  }
}
