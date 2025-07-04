import 'package:flutter/material.dart';
import 'package:mlingo/configs/new_app_theme.dart';
import 'package:mlingo/widgets/primary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/field_label_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.30,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: spacingBetweenTextFieldAndButton),
                      LabelAndFieldWidget(
                          hintText: StringConstants.kExampleGmail,
                          label: StringConstants.kEmailAddress,
                          onTextFieldChanged: (value) {}),
                      const SizedBox(height: spacingBetweenTextFields),
                      const SizedBox(height: spacingBetweenTextFields),
                      LabelAndFieldWidget(
                          hintText: StringConstants.kEnterYourPassword,
                          label: StringConstants.kPassword,
                          onTextFieldChanged: (value) {},
                          obscureText: true),
                      const SizedBox(height: spacingBetweenTextFields),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }),
                            Text(StringConstants.kRegister,
                                style: Theme.of(context)
                                    .textTheme
                                    .authenticationScreenTextStyles),
                            const Spacer(),
                            InkWell(
                                splashColor: Colors.white,
                                hoverColor: Colors.white,
                                focusColor: Colors.white,
                                onTap: () {},
                                child: Text(StringConstants.kForgotPassword,
                                    style: Theme.of(context)
                                        .textTheme
                                        .authenticationScreenTextStyles
                                        .copyWith(color: AppColor.lightBlue)))
                          ]),
                      const SizedBox(height: spacingBetweenTextFields),
                      PrimaryButton(
                        onPressed: () {},
                        buttonTitle: StringConstants.kLogin,
                        backgroundColor: AppColor.lightBlue,
                      ),
                      const SizedBox(height: spacingBetweenTextFields),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(StringConstants.kNotRegisteredYet,
                                style: Theme.of(context)
                                    .textTheme
                                    .authenticationScreenTextStyles),
                            InkWell(
                                splashColor: Colors.white,
                                hoverColor: Colors.white,
                                focusColor: Colors.white,
                                onTap: () {},
                                child: Text(StringConstants.kCreateAccount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .authenticationScreenTextStyles
                                        .copyWith(color: AppColor.lightBlue)))
                          ])
                    ]))));
  }
}
