
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/modules/onBoarding/models/onboardingmodels.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/routes/pages_routes_names.dart';
import '../widgets/onboardingitem.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/onboarding";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen>{
  var activeindex = 0;
  PageController controller = PageController();

  @override
  //void initState() {
    //super.initState();
     // LocalStorageService.setBool(
   //     LocalStorageKeys.isFirstTimeRun, false
 //);  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackie,
      body:SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 16, ),
              Image.asset("lib/assets/logos/logoeventlyonboard.png",
                height: size.height * 0.167,
              ),
              Expanded(child:
              PageView.builder(
                controller: controller,
                onPageChanged: (int index){
                  activeindex = index;
                  setState(() {

                  });
                },
                itemCount: OnBoardingModels.onboardingList.length,
                itemBuilder:
                    (BuildContext context,int index){

                  OnBoardingModels onboardingModels = OnBoardingModels.onboardingList[index];
                  return Onboardingitem( onBoardingModels: onboardingModels );
                },
              )
                ,

              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Visibility(visible: activeindex!=0 ,
                    replacement: Spacer(),
                    child:
                    TextButton(onPressed: (){
                      controller.previousPage(duration:Duration(milliseconds: 500), curve: Curves.easeInOut);
                      if( activeindex>0){
                        activeindex--;               }

                    },

                        child: Text("Back",
                          style: TextStyle(
                            fontFamily: "Janna",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,

                          ),
                        )
                    ),
                  ),
                  Spacer(),
                  AnimatedSmoothIndicator(
                    activeIndex: activeindex,
                    count: OnBoardingModels.onboardingList.length,

                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.blackie,
                      dotHeight: 10,
                      dotWidth: 10,


                    ),
                  ),
                  Spacer(),
                  TextButton(onPressed: (){
                    if(activeindex ==
                        OnBoardingModels.onboardingList.length-1){
                      Navigator.pushReplacementNamed(context,PagesRoutesNames.layout );
                    }
                    controller.nextPage(duration:Duration(milliseconds: 500),
                        curve: Curves.easeInOut);

                    if( activeindex ==
                        OnBoardingModels.onboardingList.length-1){
                      return;
                    } activeindex++
                    ;

                  },
                    child: Text(activeindex == OnBoardingModels.onboardingList.length-1?"Finish"
                        :"Next",
                      style: TextStyle(
                        fontFamily: "Janna",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,

                      ),
                    ),
                  ),

                ],

              ),
              SizedBox(height: 16,),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen or perform an action
                },
                child: Text("Let's Start"),
              ),




            ],












          ),
        ),
      ),
    );
  }


}

