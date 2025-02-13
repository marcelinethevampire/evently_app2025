import 'dart:core';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/services/firebase_firestore_service.dart';
import 'package:evently_app/modules/layout/home/widgets/event_card.dart';
import 'package:evently_app/modules/layout/home/widgets/home_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/event_ct.dart';
import '../../../models/event_data.dart';
import '../settings_provider.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

  }

class _HomeViewState extends State<HomeView> {
  int selectedTabIndex = 0;
  List<EventCt> ct = [
    EventCt(ctName: "Sports", ctIcon: Icons.directions_bike, ctImg: "lib/assets/images/sport.png"),
    EventCt(ctName: "Book Club", ctIcon: Icons.menu_book_outlined, ctImg: "lib/assets/images/bookclub.png"),
    EventCt(ctName: "Meeting", ctIcon: Icons.meeting_room_outlined, ctImg: "lib/assets/images/meeting.png"),
    EventCt(ctName: "Birthday", ctIcon: Icons.cake_outlined, ctImg: "lib/assets/images/holiday.png"),
    EventCt(ctName: "Holiday", ctIcon: Icons.holiday_village_outlined, ctImg: "lib/assets/images/vacay.png"),
  ];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60,
            left: 20,
            right: 20,
            bottom: 20),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Welcome Back ✨",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.wity,
                        //  fontWeight: FontWeight.bold
                        ),),
                        Text("John Safwat",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.wity,
                           fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Image.asset("lib/assets/images/mapicn.png",
                            height: 25,),
                            SizedBox(width: 4,),
                            Text("Cairo, Egypt",
                            style: theme.textTheme.titleMedium?.copyWith(
                                color: AppColors.wity,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),

                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(provider.isDark()){
                          provider.setCurrentTheme(ThemeMode.light);

                        }
                        else{ provider.setCurrentTheme(ThemeMode.dark);

                        }
                      },
                      child: Icon(Icons.wb_sunny_outlined,size: 28,
                          color: AppColors.wity,),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.wity,
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Text("EN",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                      SizedBox(height: 10,),
                    DefaultTabController(length: 5, child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorPadding: EdgeInsets.symmetric(horizontal:6 ),
                        labelPadding: EdgeInsets.symmetric(horizontal:0,vertical: 10 ) ,
                        indicator: BoxDecoration(),
                        onTap: (value){
                          setState(() {
                            selectedTabIndex = value;
                          });
                        },
                        tabs:   ct.map( (element) {
                          return HomeTabWiget(eventCt: element,
                              isSelected: selectedTabIndex
                                  ==
                                  ct.indexOf(element));
                        }


                        ).toList(),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuery.size.height * 0.02,),
                StreamBuilder<QuerySnapshot<EventData>>(
                  stream: FirebaseFirestoreService.getStreamData(
                    ct[selectedTabIndex].ctName,
                  ),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Column(
                        children: [
                          Text("Something Went Wrong",
                          ),
                          SizedBox(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.refresh_outlined,
                          color: AppColors.primary,),
                          )
                        ],
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }
                    List<EventData> eventDataList = snapshot.data!.docs.map(
                        (element){
                          return element.data();
                        },
                    ).toList();
                    return eventDataList.isNotEmpty? ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder:(context,index) => EventCard(eventData: eventDataList[index]),
                        separatorBuilder: (context,index) => SizedBox(height: 10,),
                        itemCount: eventDataList.length)
                        : Text("No Event Created Yet !",
                      style: theme.textTheme.titleLarge,
                    );
                  },

                ),SizedBox(height: mediaQuery.size.height * 0.02,),
              ],
            ),


          )
        ],
      ),
    );
  }
}


