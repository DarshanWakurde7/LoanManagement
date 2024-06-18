import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/DashboardCount.dart';

class DashbordController extends GetxController{

var index=0.obs;
List<Dahboard_Data> dahboard_data=[];

var isLoading=false.obs;
void onInit() async{
gettheAnalysis();
 super.onInit();


  }



setindex(int val){
  index(val);
}


void gettheAnalysis()async{
  isLoading(true);
  dahboard_data=await APiClls.fetchDashbordData();
  isLoading(false);
}


}