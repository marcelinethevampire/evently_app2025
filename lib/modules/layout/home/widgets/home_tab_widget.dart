
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../models/event_ct.dart';

class HomeTabWiget extends StatelessWidget{
   final EventCt eventCt;
   final bool isSelected;
  const HomeTabWiget({super.key,
  required this.eventCt,
  required this.isSelected});
  @override
  Widget build(BuildContext context) {
   var theme = Theme.of(context);
   return Container(
     padding: EdgeInsets.symmetric(
       horizontal: 12,vertical: 5
     ),
     decoration: BoxDecoration(
       color: !isSelected? AppColors.primary : AppColors.wity,
       borderRadius: BorderRadius.circular(20),
       border: Border.all(
         color: AppColors.wity
       ),
     ),
     child: Row(
       children: [
         Icon(eventCt.ctIcon,color:!isSelected? AppColors.wity : AppColors.primary ,),
         SizedBox(width: 5,),
         Text(eventCt.ctName,
         style: theme.textTheme.titleMedium?.copyWith(
           color: !isSelected? AppColors.wity : AppColors.primary
         ),
         ),
       ],
     ),
   );
  }

}