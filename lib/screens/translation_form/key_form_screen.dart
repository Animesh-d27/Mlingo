import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlingo/bloc/translation_form/translation_form_bloc.dart';
import 'package:mlingo/configs/app_color.dart';
import 'package:mlingo/configs/new_app_theme.dart';
import 'package:mlingo/screens/translation_form/widgets/add_new_language.dart';
import 'package:mlingo/screens/translation_form/widgets/language_field.dart';

import '../../bloc/translation_form/translation_form_event.dart';
import '../../bloc/translation_form/translation_form_state.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/primary_button.dart';
import '../dashboard/dashboard_screen.dart';

class AddNewKey extends StatelessWidget {
  final bool isEdit;

  const AddNewKey({super.key, required this.isEdit});

  static Map addNewKeyMap = {};

  @override
  Widget build(BuildContext context) {
    List translationValueList;
    if (isEdit) {
      translationValueList = addNewKeyMap["translations"];
    } else {
      addNewKeyMap = {};
      translationValueList = [
        {"language": "English"},
        {"language": "German"},
        {"language": "Hindi"},
      ];
    }
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDashboardHorizontalPadding,
                vertical: kDashboardVerticalPadding),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConstants.kMlingo,
                          style: Theme.of(context).textTheme.mlingoTextStyle),
                      const SizedBox(height: kFormSizedBoxHeight),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.arrow_back_rounded)),
                            const SizedBox(width: 5),
                            Text(
                                isEdit
                                    ? StringConstants.kEditKey
                                    : StringConstants.kAddNewKey,
                                style: Theme.of(context)
                                    .textTheme
                                    .formHeadingTextStyle)
                          ]),
                      const SizedBox(height: kFormSizedBoxHeight),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kFormSizedBoxHeight,
                              vertical: kMlingoTop),
                          child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(kCardRadius)),
                              padding: const EdgeInsets.all(spacingLarge),
                              child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Form(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        LanguageField(
                                            initialValue: addNewKeyMap["key"],
                                            hintText: StringConstants.kAddKey,
                                            onTextFieldChanged:
                                                (String textField) {
                                              addNewKeyMap["key"] = textField;
                                            },
                                            text: StringConstants.kKey),
                                        const SizedBox(
                                            height: kFormSizedBoxHeight),
                                        LanguageField(
                                            hintText: "English",
                                            initialValue: translationValueList[
                                                    translationValueList
                                                        .indexWhere((element) =>
                                                            element[
                                                                "language"] ==
                                                            "English")]
                                                ["translation"],
                                            onTextFieldChanged: (String value) {
                                              translationValueList[
                                                      translationValueList
                                                          .indexWhere((element) =>
                                                              element[
                                                                  "language"] ==
                                                              "English")]
                                                  ["translation"] = value;
                                            },
                                            text: "English"),
                                        const SizedBox(
                                            height: kFormSizedBoxHeight),
                                        LanguageField(
                                            hintText: "German",
                                            initialValue: translationValueList[
                                                    translationValueList
                                                        .indexWhere((element) =>
                                                            element[
                                                                "language"] ==
                                                            "German")]
                                                ["translation"],
                                            onTextFieldChanged: (String value) {
                                              translationValueList[
                                                      translationValueList
                                                          .indexWhere((element) =>
                                                              element[
                                                                  "language"] ==
                                                              "German")]
                                                  ["translation"] = value;
                                            },
                                            text: "German"),
                                        const SizedBox(
                                            height: kFormSizedBoxHeight),
                                        LanguageField(
                                            hintText: "Hindi",
                                            initialValue: translationValueList[
                                                    translationValueList
                                                        .indexWhere((element) =>
                                                            element[
                                                                "language"] ==
                                                            "Hindi")]
                                                ["translation"],
                                            onTextFieldChanged: (String value) {
                                              translationValueList[
                                                      translationValueList
                                                          .indexWhere((element) =>
                                                              element[
                                                                  "language"] ==
                                                              "Hindi")]
                                                  ["translation"] = value;
                                            },
                                            text: "Hindi"),
                                        const SizedBox(
                                            height: kFormSizedBoxHeight),
                                        const AddNewLanguage(),
                                        const SizedBox(
                                            height: kFormSizedBoxHeight),
                                        BlocListener<TranslationFormBloc,
                                                TranslationFormState>(
                                            listener: (context, state) {
                                              if (state
                                                  is TranslationFormSaving) {
                                                const CircularProgressIndicator();
                                              } else if (state
                                                  is TranslationFormSaved) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const DashboardScreen()));
                                              }
                                            },
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: PrimaryButton(
                                                    buttonWidth: 500,
                                                    onPressed: () {
                                                      addNewKeyMap[
                                                              "translations"] =
                                                          translationValueList;
                                                      isEdit
                                                          ? null
                                                          : context
                                                              .read<
                                                                  TranslationFormBloc>()
                                                              .add(TranslationForm(
                                                                  translationFormMap:
                                                                      addNewKeyMap));
                                                    },
                                                    buttonTitle: isEdit
                                                        ? 'Edit Key'
                                                        : 'Add Key'))),
                                        const SizedBox(
                                            height: kFormSizedBoxHeight)
                                      ])))))
                    ]))));
  }
}
