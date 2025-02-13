
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/services/firebase_firestore_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../models/event_data.dart';

class EventCard extends StatelessWidget{
  final EventData eventData;
  const EventCard({super.key,
  required this.eventData});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height:  200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 10,horizontal: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary,
        width: 1.4),
        image: DecorationImage(image: AssetImage(eventData.eventImg),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.wity,
              borderRadius: BorderRadius.circular(8),

            ),
            child: Text(
              DateFormat("dd MMM").format(eventData.eventDate),
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

          ),
          Spacer(),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.wity,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(eventData.eventTitle,
                textAlign: TextAlign.start,
                style: theme.textTheme.titleMedium?.copyWith( fontWeight: FontWeight.bold,
                  fontSize: 16,),

                ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    eventData.Favorite =!eventData.Favorite;
                    FirebaseFirestoreService.updateEvent(eventData);
                  },
                  child: Icon(eventData.Favorite? Icons.favorite: Icons.favorite_border,
                  color: AppColors.primary,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}