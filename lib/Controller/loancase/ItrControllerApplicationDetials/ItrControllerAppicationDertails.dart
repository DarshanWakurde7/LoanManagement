import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/loancaseModels/ItrModel.dart';
import 'package:loanmanagement/Services/LocalData.dart';

class ItrControllerApplicationDetails extends GetxController{


  var totalIncomeItr1=TextEditingController().obs;
  var plGrossItr1=TextEditingController().obs;
  var plSalesItr1=TextEditingController().obs;
  var netPorfitItr1=TextEditingController().obs;
  var taxpayableItr1=TextEditingController().obs;
  var intrestonLoanItr1=TextEditingController().obs;
  var depricitaionItr1=TextEditingController().obs;
  var salaryRemunerationItr1=TextEditingController().obs;
  var CapitalBsItr1=TextEditingController().obs;
  var LoanFromItr1=TextEditingController().obs;
  var SecuredLoanItr1=TextEditingController().obs;
  var UnSecuredLoanItr1=TextEditingController().obs;
  var BalancesheetsizeItr1=TextEditingController().obs;
  var ItrFillingyearItr1=TextEditingController().obs;
  var growthItr1=TextEditingController().obs;
  var fixeddateItr1=TextEditingController().obs;
  var remarkItr1=TextEditingController().obs;




  var totalIncomeItr2=TextEditingController().obs;
  var plGrossItr2=TextEditingController().obs;
  var plSalesItr2=TextEditingController().obs;
  var netPorfitItr2=TextEditingController().obs;
  var taxpayableItr2=TextEditingController().obs;
  var intrestonLoanItr2=TextEditingController().obs;
  var depricitaionItr2=TextEditingController().obs;
  var salaryRemunerationItr2=TextEditingController().obs;
  var CapitalBsItr2=TextEditingController().obs;
  var LoanFromItr2=TextEditingController().obs;
  var SecuredLoanItr2=TextEditingController().obs;
  var UnSecuredLoanItr2=TextEditingController().obs;
  var BalancesheetsizeItr2=TextEditingController().obs;
  var ItrFillingyearItr2=TextEditingController().obs;
  var growthItr2=TextEditingController().obs;
  var fixeddateItr2=TextEditingController().obs;
  var remarkItr2=TextEditingController().obs;

  void onInit() {
 super.onInit();
fetchItrDetails();
fetchItr2Details();
  }

void settotalIncomeItr2(String data){
  totalIncomeItr2.value.text=data;
}
void setplGrossItr2(String data){
  plGrossItr2.value.text=data;
}
void setplSalesItr2(String data){
  plSalesItr2.value.text=data;
}
void settaxpayableItr2(String data){
  taxpayableItr2.value.text=data;
}
void setnetPorfitItr2(String data){
  netPorfitItr2.value.text=data;
}
void setintrestonLoanItr2(String data){
  intrestonLoanItr2.value.text=data;
}
void setdepricitaionItr2(String data){
  depricitaionItr2.value.text=data;
}
void setsalaryRemunerationItr2(String data){
  salaryRemunerationItr2.value.text=data;
}
void setsetLoanFromItr2(String data){
  LoanFromItr2.value.text=data;
}
void setCapitalBsItr2(String data){
  CapitalBsItr2.value.text=data;
}
void setUnSecuredLoanItr2(String data){
  UnSecuredLoanItr2.value.text=data;
}
void setSecuredLoanItr2(String data){
  SecuredLoanItr2.value.text=data;
}
void setItrFillingyearItr2(String data){
  ItrFillingyearItr2.value.text=data;
}
void setBalancesheetsizeItr2(String data){
  BalancesheetsizeItr2.value.text=data;
}
void setfixeddateItr2(String data){
  fixeddateItr2.value.text=data;
}
void setgrowthItr2(String data){
  growthItr2.value.text=data;
}
void setremarkItr2(String data){
  remarkItr2.value.text=data;
}



void settotalIncomeItr1(String data){
  totalIncomeItr1.value.text=data;
}
void setplGrossItr1(String data){
  plGrossItr1.value.text=data;
}
void setplSalesItr1(String data){
  plSalesItr1.value.text=data;
}
void settaxpayableItr1(String data){
  taxpayableItr1.value.text=data;
}
void setnetPorfitItr1(String data){
  netPorfitItr1.value.text=data;
}
void setintrestonLoanItr1(String data){
  intrestonLoanItr1.value.text=data;
}
void setdepricitaionItr1(String data){
  depricitaionItr1.value.text=data;
}
void setsalaryRemunerationItr1(String data){
  salaryRemunerationItr1.value.text=data;
}
void setsetLoanFromItr1(String data){
  LoanFromItr1.value.text=data;
}
void setCapitalBsItr1(String data){
  CapitalBsItr1.value.text=data;
}
void setUnSecuredLoanItr1(String data){
  UnSecuredLoanItr1.value.text=data;
}
void setSecuredLoanItr1(String data){
  SecuredLoanItr1.value.text=data;
}
void setItrFillingyearItr1(String data){
  ItrFillingyearItr1.value.text=data;
}
void setBalancesheetsizeItr1(String data){
  BalancesheetsizeItr1.value.text=data;
}
void setfixeddateItr1(String data){
  fixeddateItr1.value.text=data;
}
void setgrowthItr1(String data){
  growthItr1.value.text=data;
}
void setremarkItr1(String data){
  remarkItr1.value.text=data;
}





void fetchItrDetails() async{
 Itr_Model itr_model= await APiClls.fetchItrDetiaslyear_1(1);
 setyear1ItrDetiasl(itr_model);
}

void setyear1ItrDetiasl(Itr_Model itr_model){
settotalIncomeItr1("${itr_model.totalIncome}");
setplGrossItr1("${itr_model.plGrossProfit??0}");
setplSalesItr1(itr_model.plSale??"");
setnetPorfitItr1("${itr_model.netProfit}");
settaxpayableItr1(itr_model.taxPayable??"");
setintrestonLoanItr1("${itr_model.toInterestOnLoan??0}");
setdepricitaionItr1("${itr_model.toDepreciation}");
setsalaryRemunerationItr1("${itr_model.salaryRemuneration}");
setCapitalBsItr1("${itr_model.capitalBs}");
setsetLoanFromItr1("${itr_model.loanFrom}");
setUnSecuredLoanItr1("${itr_model.unsecuredLoan}");
setBalancesheetsizeItr1("${itr_model.balanceSheetSize}");
setItrFillingyearItr1("${itr_model.itrFillingYear}");
setgrowthItr1("${itr_model.growth}");
setItrFillingyearItr1(itr_model.filingDate??"");
setremarkItr1(itr_model.remarks??"");


}

void fetchItr2Details() async{
 Itr_Model itr_model= await APiClls.fetchItrDetiaslyear_1(2);
 print(itr_model.capitalBs);
 setyear2Itr2Detiasl(itr_model);
}

void setyear2Itr2Detiasl(Itr_Model itr_model){
settotalIncomeItr2("${itr_model.totalIncome}");
setplGrossItr2("${itr_model.plGrossProfit??0}");
setplSalesItr1(itr_model.plSale??"");
setnetPorfitItr2("${itr_model.netProfit}");
settaxpayableItr1(itr_model.taxPayable??"");
setintrestonLoanItr2("${itr_model.toInterestOnLoan??0}");
setdepricitaionItr2("${itr_model.toDepreciation}");
setsalaryRemunerationItr2("${itr_model.salaryRemuneration}");
setCapitalBsItr2("${itr_model.capitalBs}");
setsetLoanFromItr2("${itr_model.loanFrom}");
setUnSecuredLoanItr2("${itr_model.unsecuredLoan}");
setBalancesheetsizeItr2("${itr_model.balanceSheetSize}");
setItrFillingyearItr2("${itr_model.itrFillingYear}");
setgrowthItr2("${itr_model.growth}");
setItrFillingyearItr1(itr_model.filingDate??"");
setremarkItr1(itr_model.remarks??"");


}









void addItrDetails(int Year)async{

Itr_Model itr_model=Itr_Model(
loanCaseId: SharedPreferencesService.getInt("enquireid")??0,
year: Year,
totalIncome: int.parse(totalIncomeItr1.value.text),
plGrossProfit: int.parse(plGrossItr1.value.text),
plSale: plSalesItr1.value.text,
netProfit: int.parse(netPorfitItr1.value.text),
toDepreciation: depricitaionItr1.value.text,
salaryRemuneration: int.parse(salaryRemunerationItr1.value.text),
loanFrom: LoanFromItr1.value.text,
growth: growthItr1.value.text,
itrFillingYear: int.parse(ItrFillingyearItr1.value.text),
taxPayable: taxpayableItr1.value.text,
toInterestOnLoan: int.parse(intrestonLoanItr1.value.text),
capitalBs: CapitalBsItr1.value.text,
unsecuredLoan: int.parse(UnSecuredLoanItr1.value.text),
securedLoan: int.parse(SecuredLoanItr1.value.text),
balanceSheetSize: BalancesheetsizeItr1.value.text,
filingDate: fixeddateItr1.value.text,
remarks: remarkItr1.value.text
);

Map<String,dynamic> data={
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}",
    "year": "$Year",
    "total_income": "${itr_model.totalIncome}",
    "pl_gross_profit": "${itr_model.plGrossProfit}",
    "pl_sale": "${itr_model.plSale}",
    "net_profit": "${itr_model.netProfit}",
    "to_depreciation": "${itr_model.toDepreciation}",
    "salary_remuneration": "${itr_model.salaryRemuneration}",
    "loan_from": "${itr_model.loanFrom}",
    "growth": "${itr_model.growth}",
    "itr_filling_year": "${itr_model.itrFillingYear}",
    "tax_payable": itr_model.taxPayable,
    "to_interest_on_loan": "${itr_model.toInterestOnLoan}",
    "capital_bs": "${itr_model.capitalBs}",
    "unsecured_loan": "${itr_model.unsecuredLoan}",
    "secured_loan": "${itr_model.securedLoan}",
    "balance_sheet_size": "${itr_model.balanceSheetSize}",
    "filing_date": "${itr_model.filingDate}",
    "remarks": "${itr_model.remarks}",
    "created_by": "${SharedPreferencesService.getInt("user_id")}"
};


print(data);
await APiClls.addItrDetails(data);

}


void addItr2Details(int Year)async{

Itr_Model itr_model=Itr_Model(
loanCaseId: SharedPreferencesService.getInt("enquireid")??0,
year: Year,
totalIncome: int.parse(totalIncomeItr2.value.text),
plGrossProfit: int.parse(plGrossItr2.value.text),
plSale: plSalesItr2.value.text,
netProfit: int.parse(netPorfitItr2.value.text),
toDepreciation: depricitaionItr2.value.text,
salaryRemuneration: int.parse(salaryRemunerationItr2.value.text),
loanFrom: LoanFromItr2.value.text,
growth: growthItr2.value.text,
itrFillingYear: int.parse(ItrFillingyearItr2.value.text),
taxPayable: taxpayableItr2.value.text,
toInterestOnLoan: int.parse(intrestonLoanItr2.value.text),
capitalBs: CapitalBsItr2.value.text,
unsecuredLoan: int.parse(UnSecuredLoanItr2.value.text),
securedLoan: int.parse(SecuredLoanItr2.value.text),
balanceSheetSize: BalancesheetsizeItr2.value.text,
filingDate: fixeddateItr2.value.text,
remarks: remarkItr2.value.text
);

Map<String,dynamic> data={
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}",
    "year": "$Year",
    "total_income": "${itr_model.totalIncome}",
    "pl_gross_profit": "${itr_model.plGrossProfit}",
    "pl_sale": "${itr_model.plSale}",
    "net_profit": "${itr_model.netProfit}",
    "to_depreciation": "${itr_model.toDepreciation}",
    "salary_remuneration": "${itr_model.salaryRemuneration}",
    "loan_from": "${itr_model.loanFrom}",
    "growth": "${itr_model.growth}",
    "itr_filling_year": "${itr_model.itrFillingYear}",
    "tax_payable": itr_model.taxPayable,
    "to_interest_on_loan": "${itr_model.toInterestOnLoan}",
    "capital_bs": "${itr_model.capitalBs}",
    "unsecured_loan": "${itr_model.unsecuredLoan}",
    "secured_loan": "${itr_model.securedLoan}",
    "balance_sheet_size": "${itr_model.balanceSheetSize}",
    "filing_date": "${itr_model.filingDate}",
    "remarks": "${itr_model.remarks}",
    "created_by": "${SharedPreferencesService.getInt("user_id")}"
};


print(data);
await APiClls.addItrDetails(data);

}




}