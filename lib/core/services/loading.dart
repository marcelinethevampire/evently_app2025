import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading(){
  EasyLoading.instance
  ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..indicatorColor = Color(0xFFE00800)
    ..userInteractions = false
    
      ..textColor = Colors.white
      ..dismissOnTap = false;
  
}