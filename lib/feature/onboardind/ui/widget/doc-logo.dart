import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/themeing/styles.dart';

class DocLogoAndName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center
    ,children: [
      SvgPicture.asset('assets/svgs/docdoc_logo.svg'),
      SizedBox(width: 10.w),
      Text(
        'DocDoc',
        style: TextStyles.font24BlackBold,
      ),
    ],);
  }
  
}
