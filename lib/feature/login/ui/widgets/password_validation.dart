

import 'package:docapp/core/helpers/spacing.dart';
import 'package:docapp/core/themeing/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/themeing/styles.dart';

class PasswordValidations extends StatelessWidget{
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Column(
    children: [
      buildValidationRow('At least 1 lowercase letter', hasLowerCase),
      verticalSpace(2),
      buildValidationRow('At least 1 uppercase letter', hasUpperCase),
      verticalSpace(2),
      buildValidationRow(
          'At least 1 special character', hasSpecialCharacters),
      verticalSpace(2),
      buildValidationRow('At least 1 number', hasNumber),
      verticalSpace(2),
      buildValidationRow('At least 8 characters long', hasMinLength),
    ]


  );
  }

  Widget buildValidationRow(String text, bool hasVaildateEntryData) {
    return Row(
      children: [
        CircleAvatar(
        radius: 2.5,
        backgroundColor: hasVaildateEntryData?Colors.green : ColorsManager.gray
    ),
        horizontalSpace(6),
        Text(text,style: TextStyles.font13BlueRegular.copyWith(
       //   decoration: hasVaildateEntryData?TextDecoration.lineThrough:null,
          decorationColor: Colors.green,
            decorationThickness:2,
          color: hasVaildateEntryData ? Colors.green : ColorsManager.gray,
        ),)
      ],
    );
  }
}