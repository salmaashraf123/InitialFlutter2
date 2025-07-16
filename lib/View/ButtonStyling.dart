import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/View/ThemeData/Theme.dart';

import '../Routes/routes.dart';

SizedBox Getbutton(String type, BuildContext context) {
  return SizedBox(
    width: 300,
    child: ElevatedButton(
      onPressed: () {
        if (type == 'Sign up') {
          Navigator.of(context).pushNamed(
            Routes.registerPage,
          );
        }
        else{
          Navigator.of(context).pushNamed(
            Routes.loginPage,
          );
        }
      },
      child: Text(type, style: GetTheme().textTheme.bodyLarge),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            type == 'Login'
                ? GetTheme().secondaryHeaderColor
                : GetTheme().scaffoldBackgroundColor,
      ),
    ),
  );
}
