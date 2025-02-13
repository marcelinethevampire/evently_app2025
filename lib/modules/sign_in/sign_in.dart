
import 'package:evently_app/core/extension/center.dart';
import 'package:evently_app/core/extension/padding.dart';
import 'package:evently_app/core/sizes/siizes.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/routes/pages_routes_names.dart';
import '../../core/services/firebase_auth_service.dart';
import '../../core/theme/app_colors.dart';
import '../../main.dart';

class SignIn extends StatefulWidget {

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn>{

   final _formKey = GlobalKey<FormState>();
   final _emailController = TextEditingController();
   final _passwordController = TextEditingController();
   @override
  Widget build(BuildContext context){
     var theme = Theme.of(context);
     return Scaffold(
       body: Form(key: _formKey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image.asset("lib/assets/logos/evenlyapplogo.png",
               height: 0.25.height,),
               CustomTextField(
                 controller: _emailController,
                 hint: "Email",
                 hintColor: AppColors.greyy,
                 onValidate: (value){
                   if(value == null || value.trim().isEmpty){
                     return "Please Enter your Email Address";
                   }
                   return null;
                 },
                 prefixIcon: ImageIcon(AssetImage("lib/assets/images/mailicn.png",
                 ),
                 color: AppColors.greyy,),

               ).setOnlyPadding(context,0.03,0.05,0,0),
               CustomTextField(
                 controller: _passwordController,
                 isPassword: true,
                 maxLines: 1,
                 hintColor: AppColors.greyy,
                 hint: "Password",
                 onValidate: (value){
                     if(value == null || value.trim().isEmpty){
                       return "Please enter your password";
                         }
                           return null;
                        },
                     prefixIcon: ImageIcon(AssetImage("lib/assets/images/passicon.png",
                    ),
                     color: AppColors.greyy,),

               ),
               Align(
                 alignment: Alignment.centerRight,
                 child: TextButton(
                   onPressed: (){
                     navigatorKey.currentState!.pushNamed(PagesRoutesNames.forgetPassword);
                     
                     
                   },
                   child: Text("Forget Password",
                   style: theme.textTheme.titleMedium?.copyWith(
                     
                     color: AppColors.primary,
                     fontWeight: FontWeight.bold,
                     decoration: TextDecoration.underline,
                     decorationColor: AppColors.primary,
                   ),),
                 ),
               ),
               ElevatedButton(onPressed: (){
                 if(_formKey.currentState!.validate()){
                   FirebaseAuthService.login(email: _emailController.text,
                       password: _passwordController.text).then((value){
                         EasyLoading.dismiss();
                         if(value){
                           navigatorKey.currentState!.pushNamedAndRemoveUntil(PagesRoutesNames.layout, (route) => false,
                           );
                         }
                   },
                 );
                 }
               }, style: ElevatedButton.styleFrom(
                 elevation: 0,
                 backgroundColor: AppColors.primary,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(16),

                 ),
               ),
                   child: Text("Login",
                   style: theme.textTheme.titleMedium?.copyWith(
                     fontWeight: FontWeight.bold,
                     color: AppColors.wity,
                   )
                   ).setVerticalPadding(context, 0.015),
               ).setVerticalPadding(context, 0.025),
               Text.rich(textAlign: TextAlign.center,
               TextSpan(
                 children: [
                   TextSpan(
                     text: "Do not Have An Account",
                     style: theme.textTheme.titleMedium,
                   ),
                   WidgetSpan(child: GestureDetector(
                     onTap: (){
                       navigatorKey.currentState!.pushNamed(PagesRoutesNames.SignUp);

                     },
                     child: Text("Create Account",
                     style: theme.textTheme.titleMedium?.copyWith(
                       color: AppColors.primary,
                       fontWeight: FontWeight.bold,
                       decorationColor: AppColors.primary,
                       decoration: TextDecoration.underline
                     ),),
                   ))
                 ],
               )),
               Row(
                 children: [
                   Expanded(child: Divider(
                     color: AppColors.primary,
                     indent: 20,
                     endIndent: 20,
                   )),
                   Text("Or",
                     style: theme.textTheme.titleMedium?.copyWith(
                       color: AppColors.primary,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ],
               ).setVerticalPadding(context, 0.02),
               ElevatedButton(onPressed: (){},
                   style: ElevatedButton.styleFrom(
                     elevation: 0,
                     backgroundColor:  AppColors.wity,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16),
                       side: BorderSide(
                         color:  AppColors.primary,
                       )
                     )
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset("lib/assets/images/googleicn.png",
                       height: 0.03.height,),
                       SizedBox(
                         width: 10,
                       ),
                       Text("Login With Google",
                       style: theme.textTheme.titleMedium?.copyWith(
                         color: AppColors.primary,
                         fontWeight: FontWeight.bold,
                       ),).setVerticalPadding(context, 0.015),
                     ],
                   )).setVerticalPadding(context, 0.025),
             ],
           ).setCenter().setHorizontalPadding(context, 0.05)),
     );
   }
  }

