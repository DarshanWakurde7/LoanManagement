import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loanmanagement/Controller/loancase/ApplicationDetailsController.dart';
import 'package:loanmanagement/Controller/loancase/ItrControllerApplicationDetials/ItrControllerAppicationDertails.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/Abbdata.dart';
import 'package:loanmanagement/Widget/DateTextField.dart';
import 'package:loanmanagement/Widget/DropdoewnDesign.dart';
import 'package:loanmanagement/Widget/TableofContacts.dart';
import 'package:loanmanagement/Widget/textarea.dart';
import 'package:loanmanagement/Widget/textfield.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class ApplicationDetail extends StatelessWidget {
   ApplicationDetail({super.key});

ApplicationController applicationController=Get.put(ApplicationController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
     
        child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          
          borderRadius: BorderRadius.horizontal(left: Radius.circular(12),right: Radius.circular(12))),
        child: Column(
            children: [


SizedBox(height: 10,),
Container(
  margin: EdgeInsets.only(top: 6),
  height: MediaQuery.of(context).size.height*0.045,
  child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: applicationController.ApplicationDetialssubmenu.length,
    itemBuilder: (context,indx){
    return Obx(
      () {
        return GestureDetector(
          onTap: (){
            applicationController.setcurrentIndex(indx);
          },
          child: Container(
            margin: EdgeInsets.all(3),
            width: 100,
              height: MediaQuery.of(context).size.height*0.03,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: (indx==applicationController.currentIndex.value)?Colors.green.shade500:Colors.green.shade200,
          ),
            child: Center(child: Text(applicationController.ApplicationDetialssubmenu[indx]))),
        );
      }
    );
  }),
),
SizedBox(height:10,),

          Container(height: MediaQuery.of(context).size.height*0.735,color: Colors.white,
          child: Obx((){
      switch (applicationController.currentIndex.value) {
      case 0:
        return Contactlist();
      case 1:
        return RTRScreen();
      case 2:
        return ItrDetails();
      case 3:
        return AbbdetiaslScreen() ;
      // case 4:
      //   return PersonalDetail5();
      default:
        return Container();
    }
          }),
          
          )
           
            ],
          ),
      ),
    )
      
    );
  }
}


class Contactlist extends StatelessWidget {
  
   Contactlist({super.key});
ApplicationController applicationController=Get.put(ApplicationController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Contact List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ElevatedButton(onPressed: (){

                        showDialog(context: context, builder: (context){
                              return Dialog(

                                surfaceTintColor: Colors.white,
                                backgroundColor: Colors.white,
                                child: Container(
                                  height: 430,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  
                                      SizedBox(height:10),
                                                              
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text("Add Contact List",style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
                                          ),
                                         DropdownUni(fieldName: "Contact type", textcontroller: applicationController.contacttype.value, onChangedData: (val){
                                          applicationController.dropdown.value.forEach((element) {if(element.contactType==val){
                                              applicationController.setContactType(val, element.contactTypeId??0);
                                          }});
                                         },
                                          listdata: applicationController.dropdown.value.map((e) {
                                            return DropdownMenuEntry(value: e.contactType, label: e.contactType??"Contact Type");
                                          }).toList()),
                                          TextfiledWidget(fieldName: "Name", textcontroller:applicationController.Name.value , onChangedData: (val){
                                            applicationController.setname(val);
                                          }, inputType: TextInputType.text),
                                          TextfiledWidget(fieldName: "Phone", textcontroller:applicationController.Phone.value , onChangedData: (val){
                                            applicationController.setphone(val);
                                          }, inputType: TextInputType.text),
                                          TextfiledWidget(fieldName: "Cibil", textcontroller:applicationController.Cibilscore.value , onChangedData: (val){
                                            applicationController.setcibil(val);
                                          }, inputType: TextInputType.number),
                                          SizedBox(height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade300)),
                                                  onPressed: (){
                                                    print("okk00");
                                                  applicationController.addContactDetails();
                                                  applicationController.FetchAllContacts();
                                                  Navigator.pop(context);
                                                  }, child: Text("Save Data",style: TextStyle(color: Colors.white),))
                                              ],
                                            ),
                                          )
                                    ]
                                  ),
                                ),
                              );
                        });

                }, child: Text("Add",style: TextStyle(color: Colors.white),),style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(100, 38)),
           
            backgroundColor:MaterialStatePropertyAll(Colors.green.shade500) ),)
          ],
        ),

SizedBox(height: 25,),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          border: TableBorder(bottom: BorderSide(color: Colors.black)),
          columnWidths: {
           0: FixedColumnWidth(135),
           1: FixedColumnWidth(105),
           2: FixedColumnWidth(70),
           3: FixedColumnWidth(30),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                
                border: Border(bottom: BorderSide(color: Colors.black,width:2,strokeAlign: BorderSide.strokeAlignInside))),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                  child: Text("Name",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2,),
                  child: Text("Phone No",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2),
                  child: Text("Cibil ",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:2.0,vertical: 2),
                  child: Text("#",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),),
                ),
              ]
            ),
          ],
        ),
        Obx(
        
         () {
           if(applicationController.isBalank.value){
            return CircularProgressIndicator();
           }else{
             return Container(
            
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.585,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: applicationController.contactDetaislApplication.length,
                itemBuilder: (context,ind){
                return Tableofcontact(applicattype: applicationController.contactDetaislApplication[ind].contactType??"Contact Type", Name: applicationController.contactDetaislApplication[ind].contactName??"Contact Name", phone: applicationController.contactDetaislApplication[ind].contactPhone??000000, cibil: applicationController.contactDetaislApplication[ind].contactCibil??0000, id: applicationController.contactDetaislApplication[ind].contactId??0,onTapButton: ()async{
                          print("${applicationController.contactDetaislApplication[ind].contactId}");
                           await   applicationController.delete_contact(applicationController.contactDetaislApplication[ind].contactId??0);
                              applicationController.FetchAllContacts();
                        },);
              }),
            );
           }
          }
        )

      ],
    );
  }
}







class RTRScreen extends StatelessWidget {
  
   RTRScreen({super.key});
ApplicationController applicationController=Get.put(ApplicationController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("RTR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ElevatedButton(onPressed: (){

                        showDialog(context: context, builder: (context){
                              return Dialog(

                                surfaceTintColor: Colors.white,
                                backgroundColor: Colors.white,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    height: 600,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      
                                          SizedBox(height:10),
                                                                  
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Text("Add RTR data",style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
                                              ),
                                      
                                              TextfiledWidget(fieldName: "Financer Name", textcontroller:applicationController.financeName.value , onChangedData: (val){
                                                applicationController.setfinanceName(val);
                                              }, inputType: TextInputType.text),
                                                    DropdownUni(fieldName: "Contact type", textcontroller: applicationController.productS.value, onChangedData: (val){
                                              (applicationController.dropdownmodel.value.loanType??[]).forEach((element) {if(element.loanType==val){
                                                  applicationController.setProducts(val, element.loanTypeId??0);
                                              }});
                                             },
                                              listdata: (applicationController.dropdownmodel.value.loanType??[]).map((e) {
                                                return DropdownMenuEntry(value: e.loanTypeId, label: e.loanType??"Contact Type");
                                              }).toList()),
                                              TextfiledWidget(fieldName: "Sanction Amount", textcontroller:applicationController.sanctionAmount.value , onChangedData: (val){
                                                applicationController.setsanctionAmount(val);
                                              }, inputType: TextInputType.number),
                                              DateTimeTextfiledWidget(fieldName: "Open Date", textcontroller:applicationController.opendate.value , onChangedData: (val){
                                                applicationController.setopendate(val);
                                              }, inputType: TextInputType.number),
                                              TextfiledWidget(fieldName: "Emi Amount", textcontroller:applicationController.EmiAmountdata.value , onChangedData: (val){
                                                applicationController.setEmiAmountdata(val);
                                              }, inputType: TextInputType.number),
                                              TextfiledWidget(fieldName: "Tenure", textcontroller:applicationController.tenuredata.value , onChangedData: (val){
                                                applicationController.settenuredata(val);
                                              }, inputType: TextInputType.number),
                                              DateTimeTextfiledWidget(fieldName: "Emi Date", textcontroller:applicationController.emidatedata.value , onChangedData: (val){
                                                applicationController.setemidatedata(val);
                                              }, inputType: TextInputType.number),
                                              TextfiledWidget(fieldName: "Emi Bank Name", textcontroller:applicationController.ebanknamedata.value , onChangedData: (val){
                                                applicationController.setebanknamedata(val);
                                              }, inputType: TextInputType.text),
                                              TextfiledWidget(fieldName: "Emi Bank Type", textcontroller:applicationController.emibanktype.value , onChangedData: (val){
                                                applicationController.setcibil(val);
                                              }, inputType: TextInputType.text),
                                              TextfiledWidget(fieldName: "Outstanding", textcontroller:applicationController.outStandingdata.value , onChangedData: (val){
                                                applicationController.setoutStandingdata(val);
                                              }, inputType: TextInputType.number),
                                              DateTimeTextfiledWidget(fieldName: "Closer Date", textcontroller:applicationController.closerdatedata.value , onChangedData: (val){
                                                applicationController.setcloserdatedata(val);
                                              }, inputType: TextInputType.text),
                                              SizedBox(height: 20,),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade300)),
                                                      onPressed: ()async{
                                                        print("okk01");
                                                        await applicationController.addRtrDetials();
                                                        Navigator.pop(context);
                                                      
                                                      }, child: Text("Save Data",style: TextStyle(color: Colors.white),))
                                                  ],
                                                ),
                                              )
                                        ]
                                      ),
                                    ),
                                  ),
                                ),
                              );
                        });

                }, child: Text("Add",style: TextStyle(color: Colors.white),),style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(100, 38)),
           
            backgroundColor:MaterialStatePropertyAll(Colors.green.shade500) ),)
          ],
        ),


Container(

  width: double.infinity,
  height: MediaQuery.of(context).size.height*0.625,
  child: Obx(
 
    (){
      return HorizontalDataTable(
        
            leftHandSideColumnWidth: 130,
            rightHandSideColumnWidth: 1120,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            isFixedFooter: true,
            
            footerWidgets: [
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              ],
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: applicationController.rtrListData.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black38,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
            itemExtent: 55,
          );
    }
  ),
    ),

       

      ],
    );
  }

  List<Widget> _getTitleWidget(){
    return [

      _getTitleItemWidget("Financer Name",130),
      _getTitleItemWidget("Product Ls",130),
      _getTitleItemWidget("Sanction Amount",130),
      _getTitleItemWidget("Open Date",100),
      _getTitleItemWidget("Emi Amount",100),
      _getTitleItemWidget("Tenure",100),
      _getTitleItemWidget("Emi Date",100),
      _getTitleItemWidget("Emi Bank Name",130),
      _getTitleItemWidget("Emi Bank Type",130),
      _getTitleItemWidget("OutStanding",130),
      _getTitleItemWidget("Action",60)

    ];
  }


   Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 130,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(applicationController.rtrListData[index].financerName??"Financer name"),
    );
  }
    Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Obx(
     
      () {
        return Row(
          children: <Widget>[
        
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].product??0}")),
            ),
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].sanctionAmount}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].openDate}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].emiAmount}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].tenure}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${(applicationController.rtrListData[index].emiDate??"Sorry no Data").substring(0,10)}")),
            ),
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].emiBankName}")),
            ),
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].emiBankAccountType}")),
            ),
            Container(
              width: 130,
              height: 52,
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${applicationController.rtrListData[index].outStanding}")),
            ),
            GestureDetector(
              onTap: ()async{
                      await applicationController.delete_RtrDetails(applicationController.rtrListData[index].rtrId??0);
                      applicationController.fetchRtrList();
                  },
              child: Container(
                width: 60,
                height: 52,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Center(child: Icon(Icons.delete),),
              ),
            ),
          ],
        );
      }
    );
  }
}



class ItrDetails extends StatelessWidget {
   ItrDetails({super.key});
ItrControllerApplicationDetails itrControllerApplicationDetails=Get.put(ItrControllerApplicationDetails());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: ExpansionTile(
                    title: Text("ITR Details First Year"),
                    children: [
             
              Column(
                children: [
   TextfiledWidget(fieldName: "Total Income", textcontroller:itrControllerApplicationDetails.totalIncomeItr1.value, onChangedData: (val){
                    itrControllerApplicationDetails.settotalIncomeItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "P&L Gross Profit", textcontroller:itrControllerApplicationDetails.plGrossItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setplGrossItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "P&L Sale", textcontroller: itrControllerApplicationDetails.plSalesItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setplSalesItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Net Profit", textcontroller: itrControllerApplicationDetails.netPorfitItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setnetPorfitItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Tax Payable", textcontroller: itrControllerApplicationDetails.taxpayableItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.settaxpayableItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Interest on Loan", textcontroller:itrControllerApplicationDetails.intrestonLoanItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setintrestonLoanItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Depriciation", textcontroller: itrControllerApplicationDetails.depricitaionItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setdepricitaionItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Salary Remuneration", textcontroller: itrControllerApplicationDetails.salaryRemunerationItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setsalaryRemunerationItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Capital BS", textcontroller: itrControllerApplicationDetails.CapitalBsItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setCapitalBsItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Loan From", textcontroller: itrControllerApplicationDetails.LoanFromItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setsetLoanFromItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Secured Loan", textcontroller: itrControllerApplicationDetails.SecuredLoanItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setSecuredLoanItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "UnSecured Income", textcontroller: itrControllerApplicationDetails.UnSecuredLoanItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setUnSecuredLoanItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Balance Sheet Size", textcontroller: itrControllerApplicationDetails.BalancesheetsizeItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setBalancesheetsizeItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "ITR Filling Year", textcontroller:itrControllerApplicationDetails.ItrFillingyearItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setItrFillingyearItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Growth", textcontroller: itrControllerApplicationDetails.growthItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setgrowthItr1(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Filling Date", textcontroller: itrControllerApplicationDetails.fixeddateItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setfixeddateItr1(val);
                  }, inputType: TextInputType.text),
                  Textarea(fieldName: "Remark", textcontroller: itrControllerApplicationDetails.remarkItr1.value, onChangedData: (val){
            itrControllerApplicationDetails.setremarkItr1(val);
                  }, inputType: TextInputType.text),



                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: (){
                      itrControllerApplicationDetails.addItrDetails(1);
                    }, child: Text("Save",style: TextStyle(color: Colors.white),),
                 style:  ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize: MaterialStatePropertyAll(Size(500, 40)),
                  surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
             
                    ],
                  ),
          ),
      
                 ExpansionTile(
                  title: Text("ITR Details Second Year"),
                  children: [
           SingleChildScrollView(
            child: Column(
                children: [
               
                  TextfiledWidget(fieldName: "Total Income", textcontroller:itrControllerApplicationDetails.totalIncomeItr2.value, onChangedData: (val){
                    itrControllerApplicationDetails.settotalIncomeItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "P&L Gross Profit", textcontroller:itrControllerApplicationDetails.plGrossItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setplGrossItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "P&L Sale", textcontroller: itrControllerApplicationDetails.plSalesItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setplSalesItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Net Profit", textcontroller: itrControllerApplicationDetails.netPorfitItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setnetPorfitItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Tax Payable", textcontroller: itrControllerApplicationDetails.taxpayableItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.settaxpayableItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Interest on Loan", textcontroller:itrControllerApplicationDetails.intrestonLoanItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setintrestonLoanItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Depriciation", textcontroller: itrControllerApplicationDetails.depricitaionItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setdepricitaionItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Salary Remuneration", textcontroller: itrControllerApplicationDetails.salaryRemunerationItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setsalaryRemunerationItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Capital BS", textcontroller: itrControllerApplicationDetails.CapitalBsItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setCapitalBsItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Loan From", textcontroller: itrControllerApplicationDetails.LoanFromItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setsetLoanFromItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Secured Loan", textcontroller: itrControllerApplicationDetails.SecuredLoanItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setSecuredLoanItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "UnSecured Income", textcontroller: itrControllerApplicationDetails.UnSecuredLoanItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setUnSecuredLoanItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Balance Sheet Size", textcontroller: itrControllerApplicationDetails.BalancesheetsizeItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setBalancesheetsizeItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "ITR Filling Year", textcontroller:itrControllerApplicationDetails.ItrFillingyearItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setItrFillingyearItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Growth", textcontroller: itrControllerApplicationDetails.growthItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setgrowthItr2(val);
                  }, inputType: TextInputType.text),
                  TextfiledWidget(fieldName: "Filling Date", textcontroller: itrControllerApplicationDetails.fixeddateItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setfixeddateItr2(val);
                  }, inputType: TextInputType.text),
                  Textarea(fieldName: "Remark", textcontroller: itrControllerApplicationDetails.remarkItr2.value, onChangedData: (val){
            itrControllerApplicationDetails.setremarkItr2(val);
                  }, inputType: TextInputType.text),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: (){

                      itrControllerApplicationDetails.addItr2Details(2);
                    }, child: Text("Save",style: TextStyle(color: Colors.white),),
                 style:  ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize: MaterialStatePropertyAll(Size(500, 40)),
                  surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                  ),
                          SizedBox(height: 20,)
                ],
              ),
           )
                  ],
                ),
                SizedBox(height: 20,),
        ],
      ),
    );
  }
}