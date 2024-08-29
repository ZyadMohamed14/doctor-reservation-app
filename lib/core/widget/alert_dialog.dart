import 'package:docapp/core/helpers/extensions.dart';
import 'package:docapp/core/rounting/rouhts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocAlertDialog extends StatelessWidget {
  final String contentText;
  final String? title;

  const DocAlertDialog({Key? key, required this.contentText, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Color.fromARGB(255, 29, 29, 31),
      title: Text(title ?? '', style: TextStyle(fontSize: 50.sp)),
      content: Text(contentText, style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 169, 169, 169))),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 88, 88, 88),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            context.pushNamed(DocRoutes.loginScreen);
          },
          child: Text(
            "OK",
          ),
        ),
      ],
    );
  }
}
