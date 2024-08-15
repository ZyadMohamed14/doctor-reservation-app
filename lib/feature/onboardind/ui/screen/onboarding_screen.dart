import 'package:docapp/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/rounting/rouhts.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/styles.dart';
import '../widget/doc-logo.dart';
import '../widget/doc_image_text.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                DocLogoAndName(),
                DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font13GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.h),
                      const GetStartedButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
   style: ButtonStyle(
     backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
     minimumSize: MaterialStateProperty.all(
       const Size(double.infinity, 52),
     ),shape: MaterialStateProperty.all(
     RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(16),
     ),
   ),
   ),
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
