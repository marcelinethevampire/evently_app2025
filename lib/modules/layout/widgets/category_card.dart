
import 'package:evently_app/core/sizes/siizes.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CategoryCard extends StatelessWidget{
  const CategoryCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 0.25.height,
      width: 0.9.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: 2,
          
),
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
            image: AssetImage( "lib/assets/images/holiday.png",),
        fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),

            ),
            padding: EdgeInsets.symmetric(horizontal: 8,
            vertical: 4),
            child: Column(
              children: [
                Text("25",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),)
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.wity,
              borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text("This is a Birthday Party",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.blackie
                ),),
                Spacer(),
                Icon(Icons.favorite,
                color: AppColors.primary,)
              ],
            ),
          )
        ],
      ),
    );
  }

}