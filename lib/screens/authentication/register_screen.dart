import 'package:flutter/material.dart';
import '../../configs/app_spacing.dart';
import '../../configs/spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/field_label_widget.dart';
import 'widgets/register_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.30,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: spacingBetweenTextFieldAndButton),
                      Row(children: [
                        Expanded(
                            child: LabelAndFieldWidget(
                                label: StringConstants.kFirstName,
                                onTextFieldChanged: (value) {})),
                        const SizedBox(width: spacingSmall),
                        Expanded(
                            child: LabelAndFieldWidget(
                                label: StringConstants.kLastName,
                                onTextFieldChanged: (value) {}))
                      ]),
                      const SizedBox(height: spacingBetweenTextFields),
                      LabelAndFieldWidget(
                          label: StringConstants.kEmailAddress,
                          onTextFieldChanged: (value) {}),
                      const SizedBox(height: spacingBetweenTextFields),
                      LabelAndFieldWidget(
                          label: StringConstants.kMobileNumber,
                          onTextFieldChanged: (value) {}),
                      const SizedBox(height: spacingBetweenTextFields),
                      LabelAndFieldWidget(
                          label: StringConstants.kPassword,
                          onTextFieldChanged: (value) {},
                          obscureText: true),
                      const SizedBox(height: spacingBetweenTextFields),
                      const RegisterButton()
                    ]))));
  }
}
