import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/constants/api.dart';
import 'package:hireme/widgets/input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setLoggedIn(bool value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool('loggedIn', value);
}

Future<bool> setPreference(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}

Future<bool> getLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('loggedIn') ?? false;
}

Future<String> getRole() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('role') ?? '';
}

Future<void> _showUserRoleDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Create an account'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Do you want to create an account as a candidate or recruiter ?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Candidate'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/candidate-register');
            },
          ),
          TextButton(
            child: const Text('Recruiter'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/recruiter-register');
            },
          ),
        ],
      );
    },
  );
}

Future<dynamic> login(
    BuildContext context, String email, String password) async {
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
      Uri.parse(Api.baseUrl + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'email': email,
        'password': password,
      }),
    );
    print(response.body);
    final map = jsonDecode(response.body);
    if (map['code'] == 1) {
      Fluttertoast.showToast(
          msg: "Logged in successfully !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff27ae60),
          textColor: Colors.black,
          fontSize: 16.0);
      await setLoggedIn(true);
      await setPreference('id', map['id'].toString());
      await setPreference('token', map['token'].toString());
      await setPreference('role', map['role'].toString());
      if (map['role'].toString() == 'candidate') {
        Navigator.pushReplacementNamed(context, '/candidate-dashboard');
      } else if (map['role'].toString() == 'recruiter') {
        Navigator.pushReplacementNamed(context, '/recruiter-dashboard');
      }
    } else {
      Fluttertoast.showToast(
          msg: "The given credentials are incorrect !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xfff35034),
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}

class CommonLogin extends StatefulWidget {
  @override
  _CommonLoginState createState() => _CommonLoginState();
}

class _CommonLoginState extends State<CommonLogin> {
  bool _loggedIn = false;
  String text = "";
  Future<dynamic> _futureUser;
  final double height = window.physicalSize.height;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  _CommonLoginState() {
    getRole().then((value) {
      if (value == 'candidate') {
        Navigator.pushReplacementNamed(context, '/candidate-dashboard');
      } else if (value == 'recruiter') {
        Navigator.pushReplacementNamed(context, '/recruiter-dashboard');
      }
    });
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
                        top: 16, left: 16.0, right: 16.0, bottom: 16),
                    child: Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
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
                                          top: 8.0, bottom: 4),
                                      child: Center(
                                          child: Text(
                                              "HireMe (Your hiring space)",
                                              style: TextStyle(
                                                  color: AllColors.primary,
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 4),
                                      child: Center(
                                          child: Text(
                                              "Please log in to start :",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                              obscureText: false,
                                              controller: _controller1,
                                              placeholder:
                                                  "Please enter your email",
                                              textColor: AllColors.secondary,
                                              prefixIcon:
                                                  Icon(Icons.email, size: 20)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                              obscureText: true,
                                              controller: _controller2,
                                              placeholder:
                                                  "Please enter your password",
                                              textColor: AllColors.secondary,
                                              prefixIcon:
                                                  Icon(Icons.lock, size: 20)),
                                        )
                                      ],
                                    ),
                                    Center(
                                      child: RaisedButton(
                                        textColor: AllColors.white,
                                        color: AllColors.primary,
                                        onPressed: () {
                                          setState(() {
                                            _futureUser = login(
                                                context,
                                                _controller1.text,
                                                _controller2.text);
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
                                            child: Text("Log in",
                                                style: TextStyle(
                                                    color: AllColors.black,
                                                    fontSize: 18.0))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 4),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            _showUserRoleDialog(context);
                                          },
                                          child: Text(
                                            "You don't have an account ? Create one",
                                            style: TextStyle(
                                                color: AllColors.primary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                            //title
                                            textAlign:
                                                TextAlign.center, //aligment
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                  ),
                ],
              )),
        ))
      ],
    ));
  }
}
