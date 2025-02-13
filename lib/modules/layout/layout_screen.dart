import 'package:evently_app/modules/layout/profile_tab.dart';
import 'package:flutter/material.dart';
import '../../core/routes/pages_routes_names.dart';
import '../../core/theme/app_colors.dart';
import 'home_tab.dart';
import 'likes_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:evently_app/modules/layout/map_tab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class LayoutScreen extends StatefulWidget {
  static String routeName = "/layout";
  const LayoutScreen({super.key});


  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}
  class _LayoutScreenState extends State<LayoutScreen>{

  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const Map(),
    const FavoritesView(),
    const ProfileView(),
   // const Scaffold()


  ];
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    
    return Scaffold(
   floatingActionButton: GestureDetector(
   onTap: (){
    Navigator.pushNamed(context, PagesRoutesNames.createEvent,);
  },
  child: const CircleAvatar(
    radius: 32,
    backgroundColor: AppColors.wity,
    child: CircleAvatar(
      radius: 26,
      backgroundColor:AppColors.primary ,
      child: Icon(Icons.add,size: 30,color: AppColors.wity,),
    ),
  ),
),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(
              selectedIndex ==0 ? "lib/assets/images/selectedhomeicn.png"
                  :"lib/assets/images/unselectedhomeicn.png"
            )),
            label: local.home,),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                selectedIndex ==1 ? "lib/assets/images/selectedmap.png"
                    :"lib/assets/images/mapicn.png"
            )),
              label: local.map,),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                selectedIndex ==2? "lib/assets/images/Heartselec.png"
                    :"lib/assets/images/likesunselected.png"
            )),
              label: local.favorites,),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                selectedIndex ==3? "lib/assets/images/personicn.png"
                    :"lib/assets/images/unselectedhomeicn.png"
            )),
              label: local.profile,),

          ]),


    );
  }
}

