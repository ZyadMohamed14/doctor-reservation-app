import 'package:docapp/core/helpers/spacing.dart';
import 'package:docapp/core/themeing/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/app_text_from_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscusr = true;

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
                Form(
                    child: Column(children: [
                  AppTextFormField(
                    hintText: "Email",
                  ),
                  verticalSpace(16),
                  AppTextFormField(
                    hintText: "Password",
                    isObscureText: isObscusr,
                    suffixIcon: GestureDetector(
                      onTap: () => {
                        setState(() {
                          isObscusr = !isObscusr;
                        })
                      },
                      child: Icon(
                          isObscusr ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  verticalSpace(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("Forget Password", style: TextStyles.font13BlueRegular,),
                  )
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
