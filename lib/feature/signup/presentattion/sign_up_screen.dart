import 'package:docapp/feature/signup/presentattion/sign_up_bloc_listener.dart';
import 'package:docapp/feature/signup/presentattion/widgets/create-account.dart';
import 'package:docapp/feature/signup/presentattion/widgets/divider_widget.dart';
import 'package:docapp/feature/signup/presentattion/widgets/sign_up_form.dart';
import 'package:docapp/feature/signup/presentattion/widgets/social_media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../domain/sign_up_cubit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 30.sp),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateAccountHeader(),
              verticalSpace(16),
              SignUpForm(),
              verticalSpace(16),
              OrSignInwith(),
              verticalSpace(16),
              const SocialLoginIcons(),
              verticalSpace(16),
              AlreadyHaveAccountText(),
              const SignupBlocListener()
            ],
          ),
        )),
      ),
    );
  }
}
