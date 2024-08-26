import 'package:docapp/core/helpers/spacing.dart';
import 'package:docapp/core/themeing/styles.dart';
import 'package:docapp/feature/login/ui/widgets/already_have_account_text.dart';
import 'package:docapp/feature/login/ui/widgets/email_and_password.dart';
import 'package:docapp/feature/login/ui/widgets/login_bloc_listener.dart';
import 'package:docapp/feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/app_text_button.dart';
import '../../../core/widget/app_text_from_feild.dart';
import '../data/model/login_request_body.dart';
import '../logic/logic/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 30.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Welcome Back",
                  style: TextStyles.font32BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                EmailAndPassword(),
                  verticalSpace(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("Forget Password", style: TextStyles.font13BlueRegular,),
                  ),
                verticalSpace(40),
                AppTextButton(
                  buttonText: "Login",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const AlreadyHaveAccountText(),
                LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
