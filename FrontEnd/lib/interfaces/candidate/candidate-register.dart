import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/constants/api.dart';
import 'package:hireme/widgets/input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CandidateRegister extends StatefulWidget {
  @override
  _CandidateRegisterState createState() => _CandidateRegisterState();
}

class _CandidateRegisterState extends State<CandidateRegister> {
  bool _checkboxValue = false;
  String text = "";
  Future<dynamic> _futureUser;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _identityCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  File _image;
  final double height = window.physicalSize.height;

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    setState(() {
      if (mounted) _image = image;
    });
  }

  Future<dynamic> register(
      BuildContext context, String first, String last, String email, String password, String identity, String phone, String address) async {
    if (email.trim() == '' || password.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please fill in all the fields correctly !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xfff1c40f),
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      final response = await http.post(
        Uri.parse(Api.baseUrl + '/candidates/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          'first_name': first,
          'last_name': last,
          'phone_number': phone,
          'address': address,
          'identity_code': identity,
          'email': email,
          'password': password,
        }),
      );
      print(response.body);
      final map = jsonDecode(response.body);
      if (map['code'] == 1) {
        Fluttertoast.showToast(
            msg: "Your account has been created successfully, please log in !",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff27ae60),
            textColor: Colors.black,
            fontSize: 16.0);
        Navigator.pushReplacementNamed(context, '/common-login');
      } else {
        throw Exception(
            response.statusCode.toString() + 'Request has failed !');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/photos/background.png"),
                  fit: BoxFit.cover)),
        ),
        SafeArea(
            child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 2, left: 16.0, right: 16.0, bottom: 2),
                    child: Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.84,
                            color: AllColors.bgColorScreen,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Center(
                                        child: Image.asset(
                                            "assets/photos/logo.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0, bottom: 2),
                                      child: Center(
                                          child: Text("Create your account",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                    Container(
                                      height: 220,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Input(
                                                obscureText: false,
                                                controller:
                                                    _firstNameController,
                                                placeholder:
                                                    "Please enter your first name",
                                                textColor: AllColors.secondary,
                                                prefixIcon: Icon(
                                                    Icons.account_box_rounded,
                                                    size: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Input(
                                                  obscureText: false,
                                                  controller:
                                                      _lastNameController,
                                                  placeholder:
                                                      "Please enter your last name",
                                                  textColor:
                                                      AllColors.secondary,
                                                  prefixIcon: Icon(
                                                      Icons.account_box_rounded,
                                                      size: 20)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0,
                                                  left: 8.0,
                                                  right: 8.0,
                                                  bottom: 0),
                                              child: Input(
                                                  controller:
                                                      _phoneNumberController,
                                                  obscureText: false,
                                                  placeholder:
                                                      "Please enter your phone number",
                                                  textColor:
                                                      AllColors.secondary,
                                                  prefixIcon: Icon(Icons.phone,
                                                      size: 20)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Input(
                                                  obscureText: false,
                                                  controller: _emailController,
                                                  placeholder:
                                                      "Please enter your email",
                                                  textColor:
                                                      AllColors.secondary,
                                                  prefixIcon: Icon(Icons.email,
                                                      size: 20)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Input(
                                                  obscureText: true,
                                                  controller:
                                                      _passwordController,
                                                  placeholder:
                                                      "Please enter your password",
                                                  textColor:
                                                      AllColors.secondary,
                                                  prefixIcon: Icon(Icons.lock,
                                                      size: 20)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Input(
                                                  obscureText: false,
                                                  controller:
                                                      _addressController,
                                                  placeholder:
                                                      "Please enter your address",
                                                  textColor:
                                                      AllColors.secondary,
                                                  prefixIcon: Icon(Icons.lock,
                                                      size: 20)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Input(
                                                  obscureText: false,
                                                  controller:
                                                      _identityCodeController,
                                                  placeholder:
                                                      "Please enter your identity code",
                                                  textColor:
                                                      AllColors.secondary,
                                                  prefixIcon: Icon(Icons.lock,
                                                      size: 20)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  top: 0,
                                                  bottom: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                      activeColor:
                                                          AllColors.primary,
                                                      onChanged: (bool
                                                              newValue) =>
                                                          setState(() =>
                                                              _checkboxValue =
                                                                  newValue),
                                                      value: _checkboxValue),
                                                  Text(
                                                      "I accept the terms and conditions",
                                                      style: TextStyle(
                                                          color:
                                                              AllColors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w200)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: RaisedButton(
                                        textColor: AllColors.white,
                                        color: AllColors.primary,
                                        onPressed: () {
                                          setState(() {
                                            _futureUser = register(
                                              context,
                                              _firstNameController.text,
                                              _lastNameController.text,
                                              _emailController.text,
                                              _passwordController.text,
                                              _identityCodeController.text,
                                              _phoneNumberController.text,
                                              _addressController.text,
                                            );
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 32.0,
                                                right: 32.0,
                                                top: 12,
                                                bottom: 12),
                                            child: Text("Register",
                                                style:
                                                    TextStyle(fontSize: 18.0))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 4),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, '/common-login');
                                          },
                                          child: Text(
                                            "You have already an account? Log in",
                                            style: TextStyle(
                                                color: AllColors.primary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                            textAlign:
                                                TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                  ),
                ]),
          ),
        ))
      ],
    ));
  }
}
