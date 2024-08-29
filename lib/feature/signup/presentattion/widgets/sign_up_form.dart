import 'package:docapp/core/widget/app_text_from_feild.dart';
import 'package:docapp/feature/signup/presentattion/widgets/social_media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/styles.dart';
import '../../../../core/utilits/app_strings.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../login/ui/widgets/password_validation.dart';
import '../../domain/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;

  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;

  bool hasUppercase = false;

  bool hasSpecialCharacters = false;

  bool hasNumber = false;

  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignupCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              hintText: "Name",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid name';
                }
              },
              controller: context.read<SignupCubit>().nameController,
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: "Email",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid Email';
                }
              },
              controller: context.read<SignupCubit>().emailController,
            ),
            verticalSpace(16),
            AppTextFormField(hintText: "Password",
                isObscureText: isPasswordObscureText,
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
              controller: context.read<SignupCubit>().passwordController,
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                },
                child: Icon(
                  isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),

            ),

            verticalSpace(16),
            AppTextFormField(
                hintText: "Confirm Password",
              isObscureText: isPasswordConfirmationObscureText
                ,validator: (value) {
                  if(value!.isEmpty){
                    return  'Please enter confrimation Password';
                  }
                  if(!value!.contains(passwordController.text)){
                    return 'Check your Password';
                  }

            },
              controller: context.read<SignupCubit>().passwordConfirmationController,
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                  });
                },
                child: Icon(
                  isPasswordConfirmationObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            verticalSpace(16),
            PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
            verticalSpace(16),
            IntlPhoneField(
              controller: context.read<SignupCubit>().phoneController,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.lighterGray,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  )),
              initialCountryCode: 'EG',
              onChanged: (phone) {
                // print(phone.completeNumber);
              },
              validator: (value){
                if(value!.completeNumber.isEmpty||value.completeNumber.length<10){
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppTextButton(
              buttonText: AppStrings.createAccount,
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                validateThenDoSignup(context);
              },

            ),
            verticalSpace(16),
          ],
        ));
  }
  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
