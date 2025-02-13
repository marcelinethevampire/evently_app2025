
import 'package:evently_app/core/extension/padding.dart';
import 'package:evently_app/core/sizes/siizes.dart';
import 'package:evently_app/models/event_ct.dart';
import 'package:evently_app/models/event_data.dart';
import 'package:evently_app/modules/create_event/widgets/create_event_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../core/services/firebase_firestore_service.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_text.dart';
import 'package:intl/intl.dart';

import '../../main.dart';


class CreateEventScreen extends StatefulWidget{
  const CreateEventScreen({super.key});


  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState  ();

  }

class _CreateEventScreenState extends State<CreateEventScreen>  {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  int selectedTap = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<EventCt> eventCt =[
    EventCt(ctName: "BookClub", ctIcon: Icons.menu_book_outlined, ctImg: "lib/assets/images/bookclub.png"),
    EventCt(ctName: "Sport", ctIcon: Icons.directions_bike, ctImg: "lib/assets/images/sport.png"),
    EventCt(ctName: "BirthDay", ctIcon: Icons.cake_outlined, ctImg: "lib/assets/images/holiday.png"),
    EventCt(ctName: "Meeting", ctIcon: Icons.meeting_room_outlined, ctImg: "lib/assets/images/meeting.png"),
    EventCt(ctName: "Holiday", ctIcon: Icons.holiday_village_outlined, ctImg: "lib/assets/images/vacay.png"),


  ];

  @override
  Widget build(BuildContext context) {
   var theme = Theme.of(context);
   return Scaffold(
     appBar: AppBar(
       title: Text("Create Event"),
     ),
     body: SingleChildScrollView(
       physics: ClampingScrollPhysics(),
       child: Form(key: formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 width: 1.0.width,
                 height:0.26.height ,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(16),
                   child: Image.asset(eventCt[selectedTap].ctImg,
                   fit: BoxFit.cover,),
                 ),
               ),
               SizedBox(height: 10,),
               DefaultTabController(length: 5, child: TabBar(isScrollable: true,
                   tabAlignment: TabAlignment.start,
                   indicatorPadding: EdgeInsets.zero,
                   labelPadding: EdgeInsets.symmetric(horizontal: 6),
                   padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                   indicator: BoxDecoration(),
                   onTap: (value){
                 setState(() {
                   selectedTap = value;
                 });
                   },
                   tabs: eventCt.map(
                           (element)
                   {
                     return CreateEventTabBar(
                       eventCt: element,
                       isSelected: selectedTap == eventCt.indexOf(element),
                     );
                   }
                   ).toList()),
               ),
               const SizedBox(height: 10,),
               Text("Title",
               style: theme.textTheme.titleMedium,)
               ,
               const SizedBox(height: 8,),
               CustomTextField(
                 controller: _titleController,
                 hint: "Event Title",
                 hintColor: AppColors.greyy,
                 prefixIcon: const Icon(Icons.edit_note_outlined,
                 color: AppColors.greyy,)
               ),
               const SizedBox(height: 10,),
               Text("Description",
               style: theme.textTheme.titleMedium,
               ),
               const SizedBox(height: 8,),
               CustomTextField(
                 controller: _descController,
                 hint: "Event Description",
                 hintColor: AppColors.greyy,
                maxLines: 4,

               ),
               const SizedBox(height: 20,),
               Row(
                 children: [
                   Icon(Icons.calendar_month),
                   SizedBox(width: 10,),
                   Text("Event Date",
                   style: theme.textTheme.titleMedium,),
                   Spacer(),
                   GestureDetector(
                     onTap: (){

                      selectEventDate(context);
                     },
                     child: Text(
                         selectedDate!=null?
                         DateFormat("dd MMM yyy").format(selectedDate!):
                             "Choose Date",
                       style:theme.textTheme.titleMedium?.copyWith(
                         color: AppColors.primary,
                         fontWeight: FontWeight.bold
                       ) ,
                     ),
                   )
                 ],
               ),
               SizedBox(height: 20,),
               Text("Location",
               style: theme.textTheme.titleMedium?.copyWith(),),
               SizedBox(height:8),
               ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                 padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                 elevation: 0,
                 backgroundColor: Colors.transparent,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(16)
                 ),
                 side: BorderSide(color: AppColors.primary)
               ),

                   child: Row(
                     children: [
                       Container(
                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           color: AppColors.primary,
                           borderRadius: BorderRadius.circular(8)
                         ),
                         child: Icon(Icons.my_location_outlined,
                         color: AppColors.wity,),
                       ),
                      SizedBox(height: 10,),
                        Text("Choose Event Location",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary
                        ),
                            
                            ),
                      
                      Spacer(),
                       Icon(Icons.arrow_forward_ios_rounded,
                       color: AppColors.primary,),
       

                     ],
                   ),
               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: (){
                 if(formKey.currentState!.validate()){
                   if(selectedDate != null){
                     EventData data =
                       EventData(
                         eventTitle: _titleController.text,
                         eventImg: eventCt[selectedTap].ctImg,
                         eventCt: eventCt[selectedTap].ctName,
                         eventDesc: _descController.text,
                         eventDate: selectedDate!, //eventId: '', Favorite: Favorite,
                         
                        
                         );
                     EasyLoading.show();
                     FirebaseFirestoreService.createNewEvent(data).then(
                         (value){
                           EasyLoading.dismiss();
                           if(value == true){
                             navigatorKey.currentState!.pop();
                             SnackBarService.showSuccessMessage(
                               "Event Successfully Created"
                             );
                           }
                         }
                     );
                   }
                   else {
                     SnackBarService.showErrorMessage(
                       "you must select event date"
                     );
                   }
                 }
               }, style: ElevatedButton.styleFrom(
                 padding: EdgeInsets.symmetric(
                   horizontal: 8,
                   vertical: 12
                 ),
                 elevation: 0,
                 backgroundColor: AppColors.primary,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(16),
                 ),
                 side: BorderSide(
                   color: AppColors.primary
                 )
               ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Add Event",
                       style: theme.textTheme.titleMedium?.copyWith(
                         fontWeight: FontWeight.bold,
                         color: AppColors.wity,
                         fontSize: 16,
                       ),)
                     ],
                   )),
SizedBox(height: 20,),

             ],
           ).setHorizontalPadding(
             context,0.04
           ),
       ),
     ),
   );
 
  }
  void selectEventDate(BuildContext context) async{
    DateTime? newDate = await showDatePicker(context: context,
        firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)
        )
    );
    if(newDate !=null){
      setState(() {
        selectedDate=  newDate;
      });
      print(selectedDate);
    }
  }
  void selectEventTime(BuildContext context) async{
    TimeOfDay? newTime =await showTimePicker(context: context,
        initialTime: TimeOfDay.now());
    if(newTime!=null){
      setState(() {
        selectedTime = newTime;
      });
      print(selectedTime);
    }
  }



}