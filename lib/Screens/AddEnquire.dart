import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/FormController.dart';
import 'package:loanmanagement/Models/AddEnquireModel.dart';
import 'package:loanmanagement/Services/LocalData.dart';

class AddEnquire extends StatelessWidget {
  AddEnquire({super.key});

  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController whatspp = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pin = TextEditingController();
  final TextEditingController loanAmount = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController panno = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController detailMessage = TextEditingController();
  final TextEditingController datasource = TextEditingController();
  final TextEditingController disbursed_lone_amount = TextEditingController();
  final TextEditingController patnercommissionpercent = TextEditingController();
  final TextEditingController estimated_closure_date = TextEditingController();
  final TextEditingController business_name = TextEditingController();
  final TextEditingController cibilscore = TextEditingController();
  final TextEditingController profile = TextEditingController();
  final TextEditingController dist_location = TextEditingController();
  final TextEditingController solutiondetail = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController nextAppointment = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController live_loan = TextEditingController();
  final TextEditingController officelocation = TextEditingController();
  final TextEditingController requiredLoanAmount = TextEditingController();
  final TextEditingController recalldate = TextEditingController();
  final TextEditingController clousareDate = TextEditingController();
  final TextEditingController rejectionreason = TextEditingController();
  final FormController formController = Get.put(FormController());


  void bindData(){
DateTime dateTime=DateTime.now();
   var formData={
    "fname": "${fname.text}",
    "lname": "${lname.text}",
    "phone": "${phone.text}",
    "whatsapp_no": "${whatspp.text}",
    "enquiry_mode_id": "1",
    "data_source": "${datasource.text}",
    "email": "${email.text}",
    "account_id": "${SharedPreferencesService.getInt("account_id")}",
    "enquiry_status_id": "${formController.enquirystatusId.value}",
    "created_by": "${SharedPreferencesService.getInt("user_id")}",
    "assigned_to": "2",
    "state": "${state.text}",
    "city": "${city.text}",
    "pin": "${pin.text}",
    "company_name": "${companyName.text}",
    "address": "${address.text}",
    "pan_number": "${panno.text}",
    "date_of_birth": "${formController.birthdate.value.text}",
    "enquiry_date": "${dateTime.year}-${dateTime.month}-${dateTime.day}",
    "loan_type": "1",
    "loan_amount": "${loanAmount.text}",
    "disbursed_lone_amount": "${disbursed_lone_amount.text}",
    "partner_commision_percentage": "${patnercommissionpercent.text}",
    "partner_commision_amount": "${patnercommissionpercent.text}",
    "next_appointment_date": "${formController.nextAppointment.value.text}",
    "enq_detail_msg": "${detailMessage.text}",
    "lead_level_id": "1",
    "estimated_closure_date": "${estimated_closure_date.text}",
    "notes": "${notes.text}",
    "business_name": "${business_name.text}",
    "sales_manager": "${formController.sales_manager.value}",
    "credit_manager": "${formController.credit_manager.value}",
    "cibil_score": "${cibilscore.text}",
    "current_ownership": "curren",
    "permanent_ownership": "Own",
    "profile": "${profile.text}",
    "already_applied": "No",
    "dist_location": "${dist_location.text}",
    "live_loan": "${live_loan.text}",
    "required_loan_amount": "${requiredLoanAmount.text}",
    "office_location": "${officelocation.text}",
    "solution_for_process": "${solutiondetail.text}",
    "rejection_reason": "${rejectionreason.text}",
    "Recall_date": "${recalldate.text}",
    "closer_date": "${clousareDate.text}"
};
AddEnquireModel enquireModel= AddEnquireModel.fromJson(formData);
print(".........................");
print(enquireModel.closerDate);
print(".........................");

// formController.addEnquireDetails(enquireModel);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Enquiry Form Data",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text("Personal Info", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: fname,
                            decoration: InputDecoration(
                              labelText: "Fname",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: lname,
                            decoration: InputDecoration(
                              labelText: "Lname",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(            

                    

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: phone,
                            decoration: InputDecoration(
                              labelText: "Phone",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: whatspp,
                            decoration: InputDecoration(
                              labelText: "Whatsapp",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: email,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.email_outlined, color: Colors.grey.shade300),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: pin,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Pin",
                              
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: loanAmount,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Loan Amount",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: city,
                            decoration: InputDecoration(
                              labelText: "City",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: state,
                            decoration: InputDecoration(
                              labelText: "State",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      return formController.isBlank.value
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(child: Center(child: CircularProgressIndicator())),
                            )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButton<String>(
                                      underline: Text(""),
                                      value: formController.paymentstatus.value.isEmpty
                                          ? null
                                          : formController.paymentstatus.value,
                                      items: formController.dropdownmodel.value.paymentStatus!.map(( item) {
                                        return DropdownMenuItem<String>(
                                          value: item.paymentStatus,
                                          child: Text(item.paymentStatus??"",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w400)),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          formController.uodateDropdown(newValue);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(3)),
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButton<String>(
                                      
                                      underline: Text(""),
                                      value: formController.leadlevel.value.isEmpty
                                          ? null
                                          : formController.leadlevel.value,
                                      items: formController.dropdownmodel.value.leadLevel!.map(( item) {
                                        return DropdownMenuItem<String>(
                                          value: item.leadLevel,
                                          child: Text(item.leadLevel??"",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w400),),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {

                                          formController.dropdownmodel.value.leadLevel!.forEach((element) {
                                            if(element.leadLevel==newValue){
                                            formController.leadlevelvaluein(element.leadLevelId??0);
                                            }
                                          },);
                                            print(formController.leadlevelIdvalue.value);
                                        
                                          formController.leadleveldata(newValue);
                                     

                                        }
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          );
                    }),

                        SizedBox(height: 10,),

                    Obx(() {
                      return formController.isBlank.value
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(child: Center(child: CircularProgressIndicator())),
                            )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                       
                                  child: DropdownMenu(
                                    width: 155,
                                  hintText: "Credit Manager",
                                  textStyle: TextStyle(fontSize: 14),
                                    dropdownMenuEntries: formController.dropdownmodel.value.creditManager!.map((e) {
                                    return DropdownMenuEntry(label: "${e.firstName??""} ${e.lastName}",value: e.userId);
                                  }).toList(),
                                  
                                  )
                                ),
                              Container(
                                  width: 155,
                                  child: DropdownMenu(
                                    width: 155,
                                  hintText: "Sales Manager",
                                  textStyle: TextStyle(fontSize: 14),
                                    dropdownMenuEntries: formController.dropdownmodel.value.salesManager!.map((e) {
                                    return DropdownMenuEntry(label: "${e.firstName??""} ${e.lastName}",value: e.userId);
                                  }).toList(),
                                  
                                  )
                                ),
                              
                            ],
                          );
                    }),
                    SizedBox(height: 10,),
                    Obx(() {
                      return formController.isBlank.value
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                               
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButton<String>(
                                      underline: Text(""),
                                      isExpanded: true,
                                      value: formController.enquirystatus.value.isEmpty
                                          ? null
                                          : formController.enquirystatus.value,
                                      items: formController.dropdownmodel.value.enquiryStatus!.map(( item) {
                                        return DropdownMenuItem<String>(
                                          value: item.enquiryStatus,
                                          child: Text(item.enquiryStatus??"",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w400)),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          formController.enquirystatusdata(newValue);
                                                 formController.dropdownmodel.value.enquiryStatus!.forEach((element) {
                                            if(element.enquiryStatus==newValue){
                                            formController.enquiryStatusIddd(element.enquiryStatusId??0);
                                            }
                                          },);
                                        }
                                      },
                                    ),
                                  ),
                                ),

                                   Container(
                                  height: 50,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(3)),
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButton<String>(
                                      underline: Text(""),
                                        isExpanded: true,
                                      value: formController.loantype.value.isEmpty
                                          ? null
                                          : formController.loantype.value,
                                      items: formController.dropdownmodel.value.loanType!.map(( item) {
                                        return DropdownMenuItem<String>(
                                          value: item.loanType,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(item.loanType??"",style: TextStyle( color: Colors.grey.shade600,fontWeight: FontWeight.w400,),maxLines: 3,)),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          formController.loantypedata(newValue);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                           
                            ],
                          );
                    }),
                    SizedBox(height: 10,),
                    Obx(() {
                      return formController.isBlank.value
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                               
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DropdownButton<String>(
                                      underline: Text(""),
                                      isExpanded: true,
                                      value: formController.applicant_type.value.isEmpty
                                          ? null
                                          : formController.applicant_type.value,
                                      items: formController.dropdownmodel.value.applicantType!.map(( item) {
                                        return DropdownMenuItem<String>(
                                          value: item.applicantType,
                                          child: Text(item.applicantType??"",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w400)),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          formController.applicant_type(newValue);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                   Container(
                                  height: 50,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(3)),
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextField(
                            controller: formController.birthdate.value,
                            readOnly: true,
                            decoration: InputDecoration(
                              
                              labelText: "Birth Date",
                              suffixIcon: Padding(padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: ()async{
                                DateTime? datetime= await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050));
                             if(datetime!=null){
                              formController.updateDate("${datetime.year}-${datetime.month}-${datetime.day}");
                             }
                                
                                },
                                child: Icon(Icons.calendar_month_outlined)),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        
                            border: OutlineInputBorder(borderSide: BorderSide.none)
                            ),
                          ),
                                  ),
                                ),
                           
                            ],
                          );
                    }),
                
                
                SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: companyName,
                            decoration: InputDecoration(
                              labelText: "Company Name",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: formController.nextAppointment.value,
                            readOnly: true,
                            decoration: InputDecoration(
                              suffixIcon: Padding(padding: EdgeInsets.all(5),child: GestureDetector(
                                onTap: ()async{
                                 DateTime? dateTime=await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050));
                                 if(dateTime!=null){
                                  formController.nextAppointmentdate("${dateTime.year}-${dateTime.month}-${dateTime.day}");
                                 }
                                },
                                child: Icon(Icons.calendar_month_outlined)),),
                              labelText: "Next Appointment",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),


                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Pan no", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: panno,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.person_2_outlined, color: Colors.grey.shade300,size: 30,),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                
                
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Address", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                    
                        maxLines: 4,
                        controller:address ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300)
                          )
                        )
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Notes", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                    
                        maxLines: 2,
                        controller:address ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300)
                          )
                        )
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Detail Message", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                    
                        maxLines: 2,
                        controller:detailMessage ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300)
                          )
                        )
                      ),
                    ),

                    SizedBox(height: 15,),


                     GestureDetector(
                    onTap: ()async{

                bindData();
                    },
                    child: Container(height: 50,width: MediaQuery.of(context).size.width,margin: EdgeInsets.symmetric(horizontal: 20),decoration: BoxDecoration(color: Colors.greenAccent.shade700,borderRadius: BorderRadius.circular(11)),child: Obx((){
                    
                      if(formController.isBlank.value){
                       
                        return Center(child: CircularProgressIndicator(color: Colors.white,),);
                      }
                      else{

                            return Center(child: Text("Add Enquiry",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),));
                      }
                    }),),
                  ),
                  SizedBox(height: 70,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
