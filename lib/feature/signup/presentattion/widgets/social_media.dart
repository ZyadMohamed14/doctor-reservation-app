import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
class SocialLoginIcons extends StatelessWidget {
  const SocialLoginIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/svgs/google.svg', // Replace with your Google logo path
            height: 32.sp,
          ),
          onPressed: () {}, // Replace with your Google login logic
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/svgs/facebook.svg', // Replace with your Facebook logo path
            height: 32.sp,
          ),
          onPressed: () {}, // Replace with your Facebook login logic
        ),
        if (Platform.isIOS) // Conditionally show the Apple icon if on iOS
               IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/apple.svg', // Replace with your Apple logo path
              height: 32.sp,
            ),
            onPressed: () {}, // Replace with your Apple login logic
          ),
      ],
    );
  }
}