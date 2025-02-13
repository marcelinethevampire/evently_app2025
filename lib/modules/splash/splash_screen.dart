import 'dart:async';


import 'package:evently_app/core/sizes/siizes.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/routes/pages_routes_names.dart';

class SplashScreen extends StatefulWidget{
  static String routeName = "splash";


  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
    
  }
  class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    Timer(
      const Duration(seconds: 2),
        (){
        Navigator.pushNamedAndRemoveUntil(context,
            PagesRoutesNames.layout,
            (route) => false,
        );
        },
    );
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
   // var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.evenlyapplogo,
              height:0.25.height,
              ),
            ],
          ),
        ),
    );
  }
}




