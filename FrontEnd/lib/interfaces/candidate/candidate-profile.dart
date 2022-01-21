import 'package:hireme/widgets/candidate-drawer.dart';
import 'package:hireme/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CandidateProfile extends StatefulWidget {
  @override
  _CandidateProfileState createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateProfile> {
  bool switchValueOne;
  bool switchValueTwo;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(title: "My Profile", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "MyProfile"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.88,
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
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 18),
                              child: Center(
                                  child: Text("Mon compte",
                                      style: TextStyle(
                                          color: AllColors.secondary,
                                          fontSize: 34,
                                          fontWeight:
                                          FontWeight.w600))),
                            ),
                            Container(
                              height: 580,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Center(
                                          child: CircleAvatar(
                                              radius: 60,
                                              backgroundImage: AssetImage(
                                                  'assets/photos/user.png'))),
                                    ),
                                    SizedBox(height: 12.0),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Input(
                                        obscureText: false,
                                        placeholder:
                                        "Yassine",
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
                                          placeholder:
                                          "Lafryhi",
                                          textColor:
                                          AllColors.secondary,
                                          prefixIcon: Icon(
                                              Icons.account_box_rounded,
                                              size: 20)),
                                    ),
                                    Padding(
                                      padding:   const EdgeInsets.all(8.0),
                                      child: Input(
                                          obscureText: false,
                                          placeholder:
                                          "0697586390",
                                          textColor:
                                          AllColors.secondary,
                                          prefixIcon: Icon(Icons.phone,
                                              size: 20)),
                                    ),
                                    Padding(
                                      padding:   const EdgeInsets.all(8.0),
                                      child: Input(
                                          obscureText: false,
                                          placeholder:
                                          "MD15967",
                                          textColor:
                                          AllColors.secondary,
                                          prefixIcon: Icon(Icons.phone,
                                              size: 20)),
                                    ),
                                    Padding(
                                      padding:   const EdgeInsets.all(8.0),
                                      child: Input(
                                          obscureText: false,
                                          placeholder:
                                          "K139290633",
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
                                          placeholder:
                                          "y.lafryhi_etu@enset-media.ac.ma",
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
                                          placeholder:"",
                                          textColor:
                                          AllColors.secondary,
                                          prefixIcon: Icon(Icons.lock,
                                              size: 20)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: RaisedButton(
                                textColor: AllColors.white,
                                color: AllColors.primary,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg:
                                      "Votre compte est mis à jour avec succès  !",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AllColors.primary,
                                      textColor: Colors.black,
                                      fontSize: 16.0);
                                  Future.delayed(Duration(milliseconds: 1000), () {
                                    Navigator.pushReplacementNamed(
                                        context, '/login');
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
                                    child: Text("Enregistrer",
                                        style:
                                        TextStyle(fontSize: 18.0))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
