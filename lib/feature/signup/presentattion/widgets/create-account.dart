import 'package:docapp/core/helpers/extensions.dart';
import 'package:docapp/core/helpers/spacing.dart';
import 'package:docapp/core/utilits/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../../core/rounting/rouhts.dart';
import '../../../../core/themeing/styles.dart';

class CreateAccountHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.createAccount,style: TextStyles.font32BlueBold,
        ),
        verticalSpace(8),
        Text(AppStrings.signUpMessage,style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(DocRoutes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}