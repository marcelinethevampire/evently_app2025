
import 'package:evently_app/core/sizes/siizes.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/modules/layout/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_elevated.dart';

class HomeTab extends StatelessWidget{

  const HomeTab({super.key});




  @override
  Widget build(BuildContext context) {
   return DefaultTabController(length: 6,
       child: Column(
    children: [
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),

          ),
          ),
          width: 1.width,
        height: 0.27.height,
        child: SafeArea(child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text("Welcome Back",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.wity,
                    ),),
                    Text("John Safwat",
                    style:  TextStyle(
                      fontSize: 16,
                      color: AppColors.wity,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset("lib/assets/images/sunicn.png"),
                 8.spaceHorizontal,
                CustomElevated(
                  text:'EN',
                  textColor: AppColors.primary,
                  onTap: (){},
                  borderRdius: 8,
                  bgColor: AppColors.wity,

                ),

              ],
            ),
            16.spaceVertical,
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                color: AppColors.wity,
                ),
                4.spaceHorizontal,
                Text("Cairo, Egypt",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.wity,
                    fontWeight: FontWeight.w500,
                ),
                ),
              ],
            ),
            8.spaceVertical,
            Expanded(child: TabBar(
              onTap: (value) {},
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                dividerColor:Colors.transparent ,
                tabs: const [
                  CustomTabBar(text: "Sports", icon: Icons.bike_scooter_outlined, isSelected: false),
                  CustomTabBar(text: "Birthday", icon: Icons.cake, isSelected: false),
                  CustomTabBar(text: "meeting", icon: Icons.meeting_room, isSelected: false),
                  CustomTabBar(text: "BookClub", icon: Icons.book, isSelected: false),
                  CustomTabBar(text: "Holiday", icon: Icons.holiday_village_outlined, isSelected: false),
                  CustomTabBar(text: "All", icon: Icons.all_out_outlined, isSelected: false
                  ),

                ],
            ),
            ),
          ],
        ),
        ),
        ),
      16.spaceVertical,
      Expanded(child: ListView.separated(
        itemBuilder: (context, int index) { return CategoryCard(); },
        separatorBuilder: ( context, int index) { return 16.spaceVertical;  },
        itemCount: 10,


      ))

    ],
       ),
   );
  }

}