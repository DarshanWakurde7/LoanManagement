import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:dynamic_multi_step_form/dynamic_json_form.dart';
import 'package:dynamic_multi_step_form/parts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Services/LocalData.dart';
import 'package:loanmanagement/Widget/ElevatedButton.dart';
import 'package:loanmanagement/Widget/textarea.dart';
import 'package:loanmanagement/Widget/textfield.dart';

class DocumentsList extends StatefulWidget {
  @override
  _DocumentsListState createState() => _DocumentsListState();
}

class _DocumentsListState extends State<DocumentsList> {
  Future<List<Document>> _fetchDocuments() async {
  
final response=await http.post(Uri.parse("https://lomnith-dev.portalwiz.in/api/public/api/fetch_loan_case_doc"),body: {
  "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}"
});

var jsonResponse=jsonDecode(response.body);
  
print(jsonResponse);
List<Document> document=[];

for(Map<String,dynamic> i in jsonResponse){
  document.add(Document.fromJson(i));
}

      return document;
  
  }


@override
Widget build(BuildContext context) {
  return FutureBuilder<List<Document>>(
    future: _fetchDocuments(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        List<Document> documents = snapshot.data!;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 800,
            child: ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Document doc = documents[index];
                return MyExpansionTile(doc: doc,refresh: (){
                  _fetchDocuments();
                },);
              },
            ),
          ),
        );
      }
    },
  );


  }

  void _uploadDocument(int docId) {
    // Implement your document upload functionality here
    print('Upload document with ID: $docId');
  }
}






class MyExpansionTile extends StatefulWidget {






  
  final Document doc;
  Function refresh;
  MyExpansionTile({required this.doc,required this.refresh});

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  String _character = "";

  TextEditingController name = TextEditingController();
  bool _isExpanded = false; // Track if the tile is expanded
File imagefile=File("");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Remove focus from any TextFormField when tapping outside
      },
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        initiallyExpanded: _isExpanded,
        title: Text(widget.doc.documentName??"ken"),
        children: [
          GestureDetector(
            onTap: () {}, // Prevent closing the tile when tapping inside ListTile
            child: ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: ((widget.doc.enqdocuments??[]).isEmpty),
                    child: GestureDetector(
                      onTap: ()async{
                    
                    
                         final ImagePicker _picker = ImagePicker();
                          final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                       if(image!=null){
                    setState(() {
                      imagefile=File(image.path);
                    });
                     }
                    
                    if(image!=null){
                    
                      showBottomSheet(context: context, builder: (context){
                        return Container(
                          height: MediaQuery.of(context).size.height*0.8,
                          width: double.infinity,
                           color: Colors.grey.shade200.withOpacity(0.5),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                height: 40,
                                    color: Colors.grey.shade200.withOpacity(0.5),
                                width: 120,
                                child: Center(child: Text("Preview",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),))),
                              SizedBox(height: 10,),
                              BackdropFilter(
                                 filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(height: MediaQuery.of(context).size.height*0.5,
                                margin: EdgeInsets.all(8.0),
                                
                                decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(image.path)))),),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0,8,15,0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    style: ButtonStyle(surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
                                    onPressed: ()async{
                        APiClls.updateProfilePicture(imagefile,widget.doc.docId??0);
                          widget.refresh();
                        
                                    },
                                    child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                                     
                      Text("Submit",style: TextStyle(fontSize: 16,color: Colors.black),),
                    ],
                                    )),
                                ),
                              ),
                            ],
                          ));
                      });
                    
                    }
                    
                    
                       
                          
                      },
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(style: BorderStyle.none),
                        ),
                        child: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ),
                 

                  Visibility(
                    visible: (widget.doc.enqdocuments??[]).isNotEmpty,
                    child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(style: BorderStyle.none),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: (widget.doc.enqdocuments??[]).length,
                          itemBuilder: (context,ind){
                            print("https://lomnith-dev.portalwiz.in/api/storage/app/${(widget.doc.enqdocuments??[])[ind].docPath}");
                          return Image.network("https://lomnith-dev.portalwiz.in/api/storage/app/${(widget.doc.enqdocuments??[])[ind].docPath}",height: 200,);
                        }),
                      ),),


                GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return Dialog(
                        child: Container(height: 200,width: double.infinity,decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.all( Radius.circular(16))),child: Column(children: [
                          SizedBox(height: 15,),
                          Textarea(fieldName: "Comment", textcontroller: name, onChangedData: (val){
                        
                          }, inputType: TextInputType.name),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: MyElevatedbutton(text: "Save", onPressed: (val){
                              print(val);
                            }),
                          )
                        ],),),
                      );
                    });
                  },
                  child: Text("Comment: Tap to Add Comment")),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      surfaceTintColor: MaterialStatePropertyAll(Colors.black),fixedSize: MaterialStatePropertyAll(Size(150,10))),
                    onPressed: () {
                      // _uploadDocument(widget.doc.docId);
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

















class Document {
  int? docId;
  int? accountId;
  int? categoryId;
  int? loanTypeId;
  int? applicantTypeId;
  String? documentName;
  String? comment;
  String? mandatory;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? updatedTime;
  String? docCategory;
  List<Enqdocuments>? enqdocuments;

  Document(
      {this.docId,
      this.accountId,
      this.categoryId,
      this.loanTypeId,
      this.applicantTypeId,
      this.documentName,
      this.comment,
      this.mandatory,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.updatedTime,
      this.docCategory,
      this.enqdocuments});

  Document.fromJson(Map<String, dynamic> json) {
    docId = json['doc_id'];
    accountId = json['account_id'];
    categoryId = json['category_id'];
    loanTypeId = json['loan_type_id'];
    applicantTypeId = json['applicant_type_id'];
    documentName = json['document_name'];
    comment = json['comment'];
    mandatory = json['mandatory'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    updatedTime = json['updated_time'];
    docCategory = json['doc_category'];
    if (json['enqdocuments'] != null) {
      enqdocuments = <Enqdocuments>[];
      json['enqdocuments'].forEach((v) {
        enqdocuments!.add(new Enqdocuments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_id'] = this.docId;
    data['account_id'] = this.accountId;
    data['category_id'] = this.categoryId;
    data['loan_type_id'] = this.loanTypeId;
    data['applicant_type_id'] = this.applicantTypeId;
    data['document_name'] = this.documentName;
    data['comment'] = this.comment;
    data['mandatory'] = this.mandatory;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['updated_time'] = this.updatedTime;
    data['doc_category'] = this.docCategory;
    if (this.enqdocuments != null) {
      data['enqdocuments'] = this.enqdocuments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enqdocuments {
  int? loanCaseDocId;
  int? loanCaseId;
  int? accountId;
  int? docId;
  String? docPath;
  int? approved;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedTime;
  String? updatedAt;

  Enqdocuments(
      {this.loanCaseDocId,
      this.loanCaseId,
      this.accountId,
      this.docId,
      this.docPath,
      this.approved,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedTime,
      this.updatedAt});

  Enqdocuments.fromJson(Map<String, dynamic> json) {
    loanCaseDocId = json['loan_case_doc_id'];
    loanCaseId = json['loan_case_id'];
    accountId = json['account_id'];
    docId = json['doc_id'];
    docPath = json['doc_path'];
    approved = json['approved'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedTime = json['updated_time'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loan_case_doc_id'] = this.loanCaseDocId;
    data['loan_case_id'] = this.loanCaseId;
    data['account_id'] = this.accountId;
    data['doc_id'] = this.docId;
    data['doc_path'] = this.docPath;
    data['approved'] = this.approved;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_time'] = this.updatedTime;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}