import 'package:evently_app/core/extension/padding.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_text.dart';

class ForgetPasswordScreen extends StatelessWidget{
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
   return Scaffold(
     appBar: AppBar(
       title: Text("Forget password"),
     ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Image.asset("lib/assets/images/forgetImg.png"),
         CustomTextField(
           hint: "Email",
           hintColor: AppColors.greyy,
           prefixIcon:ImageIcon(AssetImage(
             "lib/assets/images/mailicn.png"
           ),
           color: AppColors.greyy,),

         ).setOnlyPadding(context,0.015,0,0,0),
         ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
           backgroundColor: AppColors.primary,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16),

           ),

         ),
             child: Text("Reset Password",
             style: theme.textTheme.titleMedium?.copyWith(
               fontWeight: FontWeight.bold,
               color: AppColors.wity
             ),
             ).setVerticalPadding(context,0.015),
         ).setHorizontalPadding(context,0.025),
       ],

     ).setHorizontalPadding(context,0.05),
   );
  }

}