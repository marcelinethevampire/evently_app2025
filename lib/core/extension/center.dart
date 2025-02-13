import 'package:flutter/material.dart';

extension CenterToWidget on Widget{
  Widget setCenter(){
    return Center(
      child: this,
    );
  }
}