import 'package:flutter/material.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/DashboardController.dart';
import 'package:loanmanagement/Screens/AnalysisScreeen.dart';
import 'package:loanmanagement/Screens/Dashbord.dart';
import 'package:loanmanagement/Services/LocalData.dart';
class MyDashBoardpage extends StatelessWidget {
   MyDashBoardpage({super.key});
    DashbordController dashbordController=Get.put(DashbordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AnimatedBottomNavigationBar(
      barColor: Colors.white,
      controller: FloatingBottomBarController(initialIndex: 0),
      bottomBar: [
        BottomBarItem(
          icon: const Icon(Icons.home, size: 25),
          iconSelected: const Icon(Icons.home,
              color: Color.fromARGB(255, 185, 245, 202),
              size: 25),
          title: "Home",
          dotColor:  Colors.white,
          onTap: (value) {
          dashbordController.setindex(0);
            
          },
        ),
        BottomBarItem(
          icon:
              const Icon(Icons.photo, size: 25),
          iconSelected: const Icon(Icons.photo,
               color: Color.fromARGB(255, 185, 245, 202),
              size: 25),
          title: "Search",
          dotColor: Colors.white,
          onTap: (value) {
          dashbordController.setindex(1);
          },
        ),
        BottomBarItem(
          icon:
              const Icon(Icons.person, size: 20),
          iconSelected: const Icon(Icons.person,
               color: Color.fromARGB(255, 185, 245, 202),
              size: 20),
          title:"Person",
          dotColor: Colors.white,
          onTap: (value) {
          dashbordController.setindex(2);
          },
        ),
        BottomBarItem(
          icon: const Icon(Icons.settings,
              size: 20),
          iconSelected: const Icon(Icons.settings,
              color: Color.fromARGB(255, 185, 245, 202),
              size: 20),
          title: "Settings",
          dotColor: Colors.white,
          onTap: (value) {
       dashbordController.setindex(3);
          },
        ),
      ],
      bottomBarCenterModel: BottomBarCenterModel(
        
        centerBackgroundColor: Colors.greenAccent.shade100,
        centerIcon: const FloatingCenterButton(
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        centerIconChild: [
          FloatingCenterButtonChild(
            child: const Icon(
              Icons.question_answer_outlined,
              color: AppColors.white,
            ),
            onTap: () {},
          ),
         
        ],
      ),
    ),




    body:Obx(() {
      return widgets[dashbordController.index.value];
    }),

    
    
    
    
    
    
    );
  }



  List<Widget> widgets=[
    AnalysisScreen(),
    Center(child: Text("okk"),),
    Center(child: Text("okk1"),),
    Center(child: Text("okk2"),),
  ];
}