import 'package:flutter/material.dart';
import 'package:mlingo/configs/new_app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
              onPressed: () {}, buttonTitle: StringConstants.kRegister),
          const SizedBox(height: spacingBetweenTextFields),
          InkWell(
              splashColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              onTap: () {},
              child: Text(StringConstants.kAlreadyHaveAnAccount,
                  style: Theme.of(context)
                      .textTheme
                      .authenticationScreenTextStyles
                      .copyWith(color: AppColor.darkBlue)))
        ]);
  }
}
