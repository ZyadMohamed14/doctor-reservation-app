import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrSignInwith extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Row
      (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:
          16.0),
          child: Text(
            "Or sign in with",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }

}