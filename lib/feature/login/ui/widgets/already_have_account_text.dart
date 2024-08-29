import 'package:docapp/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/rounting/rouhts.dart';
import '../../../../core/themeing/styles.dart';
import '../../../signup/presentattion/sign_up_screen.dart';



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
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to SignUpScreen
                 context.pushNamed(DocRoutes.signUpScreen);
                }
          ),
        ],
      ),
    );
  }
}
