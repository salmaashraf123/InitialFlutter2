import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/View/ThemeData/Theme.dart';

SizedBox Getbutton(String type){
  return SizedBox(
      width: 200,
      child: ElevatedButton(onPressed: (){},
          child: Text(type , style: GetTheme().textTheme.bodyLarge),
          style: ElevatedButton.styleFrom(backgroundColor: type == 'Login' ?
                 GetTheme().secondaryHeaderColor : GetTheme().scaffoldBackgroundColor,
          )
      ),
  );
}