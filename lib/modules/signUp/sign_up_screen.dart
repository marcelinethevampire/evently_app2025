
import 'package:evently_app/core/extension/center.dart';
import 'package:evently_app/core/extension/padding.dart';
import 'package:evently_app/core/sizes/siizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/extension/validations/validations.dart';
import '../../core/routes/pages_routes_names.dart';
import '../../core/services/firebase_auth_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_text.dart';
import '../../main.dart';

class SignUpScreen extends StatefulWidget{
    const SignUpScreen({super.key});


    @override
  State <SignUpScreen> createState() => _SignUpScreenState() ;
//
  }
  class _SignUpScreenState extends State<SignUpScreen> {

  final _formkey = GlobalKey<FormState>();
  final _nameController =TextEditingController();
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),

      ),
      body: Form(key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Image.asset("lib/assets/logos/evenlyapplogo.png",
             height: 0.25.height,),
             CustomTextField(
               controller: _nameController,
               hint:"Name",
               hintColor: AppColors.greyy,
               onValidate: (value){
                 if(value== null || value.trim().isEmpty){
                   return "Please enter your Name";
                 }
                 return null;
               },
               prefixIcon: ImageIcon(AssetImage(
                 "lib/assets/images/personicn.png",

               ),
               color: AppColors.greyy,),
             ).setOnlyPadding(
               context, 0.03,0,0,0
             ),
              CustomTextField(
                controller: _emailController,
                hint: "Email",
                hintColor: AppColors.greyy ,
                onValidate: (value){
                  if(value== null || value.trim().isEmpty){
                    return "Please enter your Email Address";
                  }if(!Validations.validateEmail(value)){
                    return "Please enter your Email Address";
                  }
                  return null;
                },
                prefixIcon:ImageIcon(AssetImage(
                  "lib/assets/images/mailicn.png",

                ),
                  color: AppColors.greyy,),
              ).setOnlyPadding(
                  context, 0.015,0,0,0
              ).setOnlyPadding(context, 0.015, 0, 0, 0),
              CustomTextField(
                controller: _passwordController,
                isPassword: true,
                maxLines: 1,
                hint: "Password",
                hintColor:  AppColors.greyy,
                onValidate: (value){
                  if(value== null || value.trim().isEmpty){
                    return "Please enter your Password";
                  }if(!Validations.validatePassword(value)){
                    return "Please enter a valid Password";
                  }
                  return null;
                },
                prefixIcon:ImageIcon(AssetImage(
                  "lib/assets/images/passicon.png",

                ),
                  color: AppColors.greyy,),
              ).setOnlyPadding(context, 0.015, 0, 0, 0),
              CustomTextField(
                isPassword: true,
                maxLines: 1,
                hintColor: AppColors.greyy ,
                hint: "Re-Password",
                onValidate: (value){
                  if(value== null || value.trim().isEmpty){
                    return "Please enter your Password";
                  }if(value!=_passwordController.text){
                    return "Passwords Do not match";
                  }
                  return null;
                },
                prefixIcon:ImageIcon(AssetImage(
                  "lib/assets/images/passicon.png",

                ),
                  color: AppColors.greyy,),
              ).setOnlyPadding(context, 0.015, 0, 0, 0),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  FirebaseAuthService.createAccount(email: _emailController.text, password: _passwordController.text).then((value){
                    EasyLoading.dismiss();
                    if(value){
                      navigatorKey.currentState!.pushNamedAndRemoveUntil(PagesRoutesNames.SignIn, (route) => false);
                    }
                  },);
                }
              }, style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),

              ),
                child: Text("Register",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.wity,

                ),
                ).setVerticalPadding(context, 0.015),



              ).setVerticalPadding(context, 0.025),
        Text.rich(textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: "Already Have An Account?",
              style: theme.textTheme.titleMedium,
            ),
            WidgetSpan(child: GestureDetector(
              onTap: (){
                navigatorKey.currentState!.pop();

              },
              child: Text("Login",style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary
                  ,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            ),
          ],
        ),
      ),
           ],
          ).setCenter().setHorizontalPadding(context,0.05),
        ),

    );

  }
  
  }