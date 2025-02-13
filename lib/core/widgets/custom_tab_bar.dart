import 'package:evently_app/core/sizes/siizes.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class CustomTabBar extends StatelessWidget{

  final bool isSelected;
  final String text;
  final IconData icon;

  const CustomTabBar({
    super.key, required this.text,
    required this.icon,
    required this.isSelected
});


  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       color: isSelected? AppColors.wity : Colors.transparent,
       borderRadius: BorderRadius.circular(25),
       border: Border.all(
         color: AppColors.wity,
       )
     ),
     padding: EdgeInsets.all(8),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(
           icon,
           color: isSelected? AppColors.primary: AppColors.wity,
         ),
         8.spaceHorizontal,
         Text(text,
         style: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 16,
           color: isSelected? AppColors.primary : AppColors.wity
         ),)
       ],
     ),
   );
  }
  
}