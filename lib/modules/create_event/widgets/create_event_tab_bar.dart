
import 'package:evently_app/core/sizes/siizes.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/event_ct.dart';

class CreateEventTabBar extends StatelessWidget{
   final EventCt eventCt;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 12),

      decoration: BoxDecoration(
        color: isSelected? AppColors.primary: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border:
          Border.all(
            color: AppColors.primary
          ),
      ),
      child: Row(
        children: [
          Icon(eventCt.ctIcon,
          color: isSelected? AppColors.wity: AppColors.primary,),
          8.spaceHorizontal,
          Text(eventCt.ctName,
          style:theme.textTheme.titleMedium?.copyWith(
            color: isSelected? AppColors.wity: AppColors.primary
          ))
        ],
      ),
    );
  }

  CreateEventTabBar({
    super.key,
    required this.eventCt
    , required this.isSelected
});
}