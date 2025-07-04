import 'package:flutter/material.dart';
import 'package:mlingo/configs/new_app_theme.dart';

import '../../../configs/app_dimensions.dart';
import '../../../utils/constants/string_constants.dart';

class NewLanguageField extends StatefulWidget {
  final VoidCallback onMinimize;

  const NewLanguageField({super.key, required this.onMinimize});

  @override
  State<NewLanguageField> createState() => _NewLanguageFieldState();
}

class _NewLanguageFieldState extends State<NewLanguageField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(
            flex: 5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(StringConstants.kAddNewLangTitle,
                  style: Theme.of(context).textTheme.textFieldLabelTextStyle),
              const SizedBox(height: 10),
              TextFormField(
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(kTextFormFieldPadding),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      hintText: StringConstants.kNewLang,
                      hintStyle: TextStyle(
                          fontSize: kHintTextSize, color: Colors.black54)))
            ])),
        const SizedBox(width: 40),
        Expanded(
            flex: 10,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(StringConstants.kNewLangValue,
                  style: Theme.of(context).textTheme.textFieldLabelTextStyle),
              const SizedBox(height: 10),
              TextFormField(
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(kTextFormFieldPadding),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      hintText: StringConstants.kAddValue,
                      hintStyle: TextStyle(
                          fontSize: kHintTextSize, color: Colors.black54)))
            ])),
        Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  widget.onMinimize();
                },
                icon: const Icon(Icons.remove)))
      ]),
      const SizedBox(height: 20)
    ]);
  }
}
