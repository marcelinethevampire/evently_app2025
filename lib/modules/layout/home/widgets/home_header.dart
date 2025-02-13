import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget{
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
   var mediaQuery = MediaQuery.of(context);
   var theme = Theme.of(context);
   return Container(
     height: mediaQuery.size.height * 0.25,
     padding: EdgeInsets.only(
       top: 60,
       left: 20,
       right: 20
     ),
     decoration: BoxDecoration(
       color: AppColors.primary,
       borderRadius: BorderRadius.only(
         bottomRight: Radius.circular(24),
         bottomLeft: Radius.circular(24),

       ),
     ),
     child: Column(
       children: [
         Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Welcome Back ✨ ",
             style: theme.textTheme.titleMedium?.copyWith(
               color: AppColors.wity,
             ),
             ),
             Text("John Safwat",
             style: theme.textTheme.titleMedium?.copyWith(

               color: AppColors.wity,
               fontWeight: FontWeight.bold,
                 
             ),
             ),
             SizedBox(height: 15,),
             Row(
               children: [
                 Image.asset("lib/assets/images/mapicn.png",
                 height: 25,
                 ),
                 SizedBox(width: 4,),
                 Text("Cairo, Egypt",
                 style: theme.textTheme.titleMedium?.copyWith(
                   color: AppColors.wity,
                   fontWeight: FontWeight.w500
                 ),
                 )
               ],
             )
           ],
         ),
         Spacer(),
         Row(
           children: [
             Icon(Icons.wb_sunny_outlined,
             size: 28,
             color: AppColors.wity,
             ),
             SizedBox(width: 10,),
             Container(
               width: 35,
               height: 35,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: AppColors.wity,
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Text("EN",style:
                 theme.textTheme.titleMedium?.copyWith(
                   color: AppColors.primary,
                   fontWeight: FontWeight.bold
                 ),
               ),
             ),
             const    SizedBox(height: 10,),

           ],
         )
       ],
     ),





   );


  }

}