// login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Screens/Dashbord.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
 var visible=false.obs;
      var username=TextEditingController().obs;
      var password=TextEditingController().obs;

 


      void visblityonTap(){
            visible.value=!visible.value;
      }


      void setusername(String name){
        username.value.text=name;
      }
      void setpassword(String pass){
        password.value.text=pass;
      }




  Future<bool> login(String username, String password) async {
    isLoading.value = true;
    try {

  bool check=await APiClls.login(username, password);
        print("okk");

          // Get.rawSnackbar(title: "Successfull",message: "Login Successfull!!",backgroundColor: Colors.greenAccent);
       return check;
    } catch (e) {
      Get.snackbar('Error', 'Failed111 to login');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
