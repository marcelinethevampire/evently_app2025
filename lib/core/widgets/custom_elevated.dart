import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevated extends StatelessWidget{
  final String text;
  final double borderRdius;
  final Color bgColor;
  final Function()? onTap;
  final Color textColor;
  const CustomElevated ({
    super.key, required this.text,
    this.onTap,
    this.borderRdius = 16,
    this.bgColor = AppColors.primary,
    this.textColor = AppColors.wity,
});

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
       style:  ElevatedButton.styleFrom(
         padding: EdgeInsets.all(8),
         backgroundColor: bgColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(borderRdius),
         )
       ),

       onPressed: onTap,
       child:
   Text(text,
     style:  TextStyle(
       fontWeight: FontWeight.w500,
       fontSize: 20,
       color: textColor,
     ),
   ));
  }
}