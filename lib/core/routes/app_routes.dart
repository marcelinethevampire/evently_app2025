import 'dart:collection';
import 'dart:developer';


import 'package:evently_app/core/routes/pages_routes_names.dart';
import 'package:evently_app/modules/create_event/create_event_screen.dart';
import 'package:evently_app/modules/layout/layout_screen.dart';
import 'package:evently_app/modules/layout/likes_tab.dart';
import 'package:evently_app/modules/signUp/sign_up_screen.dart';
import 'package:evently_app/modules/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

import '../../modules/forgetPassword/forget_password_screen.dart';
import '../../modules/onBoarding/pages/onboardingscreen.dart';
import '../../modules/splash/splash_screen.dart';

abstract class AppRoutes{
  static Route onGeneratedRoute(RouteSettings settings){

    switch(settings.name){
      case PagesRoutesNames.initial:
        return MaterialPageRoute(builder:
        (context) => const SplashScreen(),
          settings: settings,
        );
      case PagesRoutesNames.onboarding:
        return MaterialPageRoute(builder:
        (context) => const OnBoardingScreen(),
          settings: settings,
        );

      case PagesRoutesNames.layout:
        return MaterialPageRoute(builder:
            (context) => const LayoutScreen(),
          settings: settings,
        );
      case PagesRoutesNames.SignIn:
        return MaterialPageRoute(builder:
            (context) => const SignIn(),
          settings: settings,
        );
      case PagesRoutesNames.SignUp:
        return MaterialPageRoute(builder:
            (context) => const SignUpScreen(),
          settings: settings,
        );
      case PagesRoutesNames.forgetPassword:
        return MaterialPageRoute(builder:
            (context) => const ForgetPasswordScreen(),
          settings: settings,
        );
      case PagesRoutesNames.createEvent:
        return MaterialPageRoute(builder:
            (context) => const CreateEventScreen(),
          settings: settings,
        );
      case PagesRoutesNames.favorites:
        return MaterialPageRoute(builder:
            (context) => const FavoritesView(),
          settings: settings,
        );


     default:
       return MaterialPageRoute(builder:
       (context) => const SplashScreen(),
         settings: settings
       );
    }

  }
}