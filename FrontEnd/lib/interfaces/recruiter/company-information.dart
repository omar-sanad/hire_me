import 'dart:convert';

import 'package:hireme/constants/api.dart';
import 'package:hireme/widgets/input.dart';
import 'package:hireme/widgets/recruiter-drawer.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CompanyInformation extends StatefulWidget {
  @override
  _CompanyInformationState createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation> {
  bool switchValueOne;
  bool switchValueTwo;

  Future<String> getRecruiterId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('id') ?? '';
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<dynamic> _future, _getFuture;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<dynamic> post(BuildContext context, String name, String description,
      String website, String domain, String date) async {
    if (name.trim() == '' || description.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please fill in all the fields correctly !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xfff1c40f),
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      getRecruiterId().then((value) async {
        getToken().then((token) async {
          final response = await http.post(
            Uri.parse(Api.baseUrl + '/companies'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': token,
            },
            body: jsonEncode(<String, Object>{
              'owner': value,
              'name': name,
              'description': description,
              'website': website,
              'domain': domain,
              'date': date
            }),
          );
          print(response.body);
          final map = jsonDecode(response.body);
          if (map['code'] == 1) {
            Fluttertoast.showToast(
                msg: "The operation completed successfully !",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color(0xff27ae60),
                textColor: Colors.black,
                fontSize: 16.0);
            Navigator.pushReplacementNamed(context, '/recruiter-dashboard');
          } else {
            Fluttertoast.showToast(
                msg: "An error occurred, please try again later !",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color(0xffea4c1e),
                textColor: Colors.black,
                fontSize: 16.0);
          }
        });
      });
    }
  }

  Future<dynamic> get() async {
    getRecruiterId().then((value) async {
      getToken().then((token) async {
        final response = await http.get(
            Uri.parse(Api.baseUrl + '/companies?owner=' + value),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': token,
            });
        print(response.body);
        final map = jsonDecode(response.body);
        if (map['owner'].toString() == value) {
          _nameController.value = TextEditingValue(
            text: (map['name']),
            selection: TextSelection.fromPosition(
              TextPosition(offset: (map['name']).length),
            ),
          );

          _descriptionController.value = TextEditingValue(
            text: (map['description']),
            selection: TextSelection.fromPosition(
              TextPosition(offset: (map['description']).length),
            ),
          );

          _dateController.value = TextEditingValue(
            text: (map['date']),
            selection: TextSelection.fromPosition(
              TextPosition(offset: (map['date']).length),
            ),
          );

          _domainController.value = TextEditingValue(
            text: (map['domain']),
            selection: TextSelection.fromPosition(
              TextPosition(offset: (map['domain']).length),
            ),
          );

          _websiteController.value = TextEditingValue(
            text: (map['website']),
            selection: TextSelection.fromPosition(
              TextPosition(offset: (map['website']).length),
            ),
          );
        } else {
          Fluttertoast.showToast(
              msg: "An error occurred, please try again later !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color(0xffea4c1e),
              textColor: Colors.black,
              fontSize: 16.0);
        }
      });
    });
  }

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
      _getFuture = get();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(title: "Company Information", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: RecruiterDrawer(currentPage: "CompanyInformation"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                      child: Center(
                          child: Text("Add company information",
                              style: TextStyle(
                                  color: AllColors.secondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600))),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      height: 160.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/photos/photo16.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        obscureText: false,
                        placeholder: "Name",
                        controller: _nameController,
                        textColor: AllColors.secondary,
                        prefixIcon: Icon(Icons.info_rounded, size: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        obscureText: false,
                        placeholder: "Description",
                        controller: _descriptionController,
                        textColor: AllColors.secondary,
                        prefixIcon: Icon(Icons.info_rounded, size: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        obscureText: false,
                        placeholder: "Website",
                        controller: _websiteController,
                        textColor: AllColors.secondary,
                        prefixIcon: Icon(Icons.info_rounded, size: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        obscureText: false,
                        controller: _domainController,
                        placeholder: "Domain",
                        textColor: AllColors.secondary,
                        prefixIcon: Icon(Icons.info_rounded, size: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        obscureText: false,
                        controller: _dateController,
                        placeholder: "Founded at",
                        textColor: AllColors.secondary,
                        prefixIcon: Icon(Icons.info_rounded, size: 20),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Center(
                      child: RaisedButton(
                        textColor: AllColors.white,
                        color: AllColors.primary,
                        onPressed: () {
                          setState(() {
                            _future = post(
                                context,
                                _nameController.text,
                                _descriptionController.text,
                                _websiteController.text,
                                _domainController.text,
                                _dateController.text);
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 32.0, right: 32.0, top: 12, bottom: 12),
                            child: Text("Save changes",
                                style: TextStyle(fontSize: 18.0))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
