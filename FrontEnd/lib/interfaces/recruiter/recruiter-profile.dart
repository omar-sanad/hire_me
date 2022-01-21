import 'package:hireme/widgets/candidate-drawer.dart';
import 'package:hireme/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecruiterProfile extends StatefulWidget {
  @override
  _RecruiterProfileState createState() => _RecruiterProfileState();
}

class _RecruiterProfileState extends State<RecruiterProfile> {
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
        drawer: CandidateDrawer(currentPage: "RecruiterProfile"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.88,
                    color: AllColors.bgColorScreen,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0)
                    ))
              ],
            ),
          ),
        ));
  }
}
