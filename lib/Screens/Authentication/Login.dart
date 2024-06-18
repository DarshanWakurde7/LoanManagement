import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/LoginController.dart';
import 'package:loanmanagement/Screens/DashBoardPage.dart';
import 'package:loanmanagement/Screens/Dashbord.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {



      LoginController loginController=Get.put(LoginController());
    


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Container(height: 100,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/splashscreenlogo.png")),borderRadius: BorderRadius.circular(11)),),
                    SizedBox(height: 80,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Email or Phone no",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                    ),
                    Obx(
                   
                      () {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: TextField(
                            
                            controller: loginController.username.value,
                            onChanged: (name){
                              loginController.setusername(name);
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                          ),
                        );
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      child: Obx(
                         () {
                          return TextField(
                            obscureText: loginController.visible.value,
                               controller: loginController.password.value,
                            onChanged: (pass){
                              loginController.setpassword(pass);
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: ()=>loginController.visblityonTap(),
                                child: Icon(loginController.visible.value?Icons.visibility_off:Icons.visibility,size: 30,color:Colors.grey.shade300,)),
                          
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                          );
                        }
                      ),
                    ),
                    
                  SizedBox(height: 190,),
                  GestureDetector(
                    onTap: ()async{
                     bool check=await loginController.login(loginController.username.value.text,loginController.password.value.text);
                     if(check){
                     Get.snackbar('WelCome ', 'Login Sucessfull');
                      Get.offAll(MyDashBoardpage());
                     }
                    },
                    child: Container(height: 60,width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),decoration: BoxDecoration(color: Colors.blue.shade800,borderRadius: BorderRadius.circular(11)),child: Obx((){
                    
                      if(loginController.isLoading.value){
                        return Center(child: CircularProgressIndicator(color: Colors.white,),);
                      }
                      else{
                            return Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),));
                      }
                    }),),
                  ),
        
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Text("Create New Account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          SizedBox(width: 10,),
                          Text("SignUp",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.blue.shade800),),
        
        
                    ],
                  )
        
          
            ],
          ),
        ),
      ),
    );
  }
}