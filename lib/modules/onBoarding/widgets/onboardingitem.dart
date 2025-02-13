
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/onboardingmodels.dart';

class Onboardingitem extends StatelessWidget {
  final OnBoardingModels onBoardingModels;
  const Onboardingitem({super.key, required this.onBoardingModels});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center ,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Image.asset(
          onBoardingModels.imagepath,
          height: size.height * 0.35,
        ),
        Text(onBoardingModels.title,
          style: TextStyle(
            fontFamily: "Janna",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,

          ),
        ),
        Text(onBoardingModels.desc?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Janna",
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: AppColors.blackie,

          ),
        ),




      ],);


  }
}
