import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/DashboardController.dart';
import 'package:loanmanagement/Screens/Dashbord.dart';
import 'package:loanmanagement/Services/LocalData.dart';

class AnalysisScreen extends StatelessWidget {
  AnalysisScreen({super.key});
  final DashbordController dashbordController = Get.put(DashbordController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/splashscreenlogo.png", height: 65)],
          ),
          SizedBox(height: 15),
          Card(
            color: Colors.grey.shade100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://i.sstatic.net/ZZ7VK.png", scale: 0.1),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, ${(SharedPreferencesService.getString("name") ?? "ken").split(" ")[0]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                      Text(
                        SharedPreferencesService.getString("email") ?? "portalwiechn@gmail.com",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDashboardCard(
                icon: Icons.people_outline,
                label: "Customer",
                color: Color.fromARGB(255, 138, 183, 255),
                onTap: () {
                  Get.to(EnquiryDashBoard());
                },
              ),
              _buildDashboardCard(
                icon: Icons.support_agent_outlined,
                label: "HRMS",
                color: Colors.grey.shade500,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDashboardCard(
                icon: Icons.support_agent_outlined,
                label: "Partner",
                color: Colors.grey.shade500,
                height: 160,
                width: 120,
              ),
              _buildDashboardCard(
                icon: Icons.transfer_within_a_station_sharp,
                label: "Cross Selling",
                color: Colors.grey.shade500,
                height: 160,
                width: 120,
              ),
              _buildDashboardCard(
                icon: Icons.notifications_outlined,
                label: "Notifications",
                color: Colors.grey.shade500,
                height: 160,
                width: 120,
              ),
            ],
          ),
          Card(
            color: Colors.grey.shade100,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Obx(() {
                // Ensure that the observable variables are being used within the Obx scope
                var dashboardData = dashbordController.dahboard_data;
             if(dashbordController.isLoading.value){
              return Center(child: CircularProgressIndicator(),);
             }
             else if(dashboardData.isNotEmpty){
                 return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dashboardData.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, ind) {
                  if (ind==0) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.smart_button_outlined,color: Colors.blueAccent,),
                              SizedBox(width: 10,),
                              Text("Smart Views",style: TextStyle(fontSize: 16,color: Colors.blueAccent,),),
                            ],
                          ),
                        ),
                        Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "${dashboardData[ind].label}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${dashboardData[ind].count}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                      ],
                    );
                  }
                  else{
                      return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "${dashboardData[ind].label}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${dashboardData[ind].count}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  },
                );
             }
             else{
              return Center(child: Text("No much Data"),);
             }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required Color color,
    double height = 110,
    double width = 180,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey.shade100,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
